from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.core.paginator import Paginator
from django.contrib.auth import logout
from django.shortcuts import render, get_object_or_404
from .models import Post
from .forms import CustomUserCreationForm
from django.contrib.auth.views import LoginView
from .forms import CustomLoginForm
from .forms import PostForm
from django.shortcuts import render, get_object_or_404, redirect
from django.shortcuts import render, redirect, get_object_or_404
from .models import Post, Comment 
from .forms import CommentForm
from django.http import HttpResponseForbidden
from .models import Post, Like
from django.db.models import Count
from .models import Post, Comment, Like
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
from django.contrib.auth.password_validation import validate_password
from django.contrib.auth import get_user_model
from .forms import UserProfileForm
from .models import Profile
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.forms import PasswordResetForm
from django.core.mail import send_mail
from django.conf import settings
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.contrib.auth.tokens import default_token_generator
from django.contrib.auth.forms import SetPasswordForm
from django.shortcuts import redirect
from .models import Category
from django.db.models import Q
from django.contrib.auth.decorators import login_required
from .models import UserActivity  # Import UserActivity model


def recent_activities(request):
    activities = UserActivity.objects.filter(
        user=request.user, 
        action_type__in=['create post', 'delete post', 'edit post', 'comment', 'like']
    ).order_by('-timestamp')[:10]
    return render(request, 'blog/recent_activities.html', {'activities': activities})




def index(request):
    if request.user.is_authenticated:
        return redirect('home')  # Redirect to home if already logged in
    
    # Fetch the three most recent posts if the user is not authenticated
    recent_posts = Post.objects.all().order_by('-created_at')[:3]

    return render(request, 'index.html', {
        'recent_posts': recent_posts
    })



def password_reset_confirm(request, uidb64, token):
    try:
        # Decode the uid from the URL
        uid = urlsafe_base64_decode(uidb64).decode()
        user = User.objects.get(pk=uid)
        
        # Check if the token is valid
        if default_token_generator.check_token(user, token):
            if request.method == 'POST':
                # User is allowed to enter a new password
                form = SetPasswordForm(user, request.POST)
                if form.is_valid():
                    form.save()
                    return redirect('password_reset_complete')  # Redirect to a success page
            else:
                form = SetPasswordForm(user)
            return render(request, 'registration/password_reset_confirm.html', {'form': form})  # Update path here
        else:
            return redirect('password_reset_failed')  # If token is invalid, show error page
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        return redirect('password_reset_failed')  # Redirect to a failure page if something goes wrong


def password_reset_request(request):
    if request.method == 'POST':
        # Get the email/username entered by the user
        email_or_username = request.POST.get('email_or_username')
        
        # Try to find a user with the provided email or username
        user = User.objects.filter(email=email_or_username).first() or User.objects.filter(username=email_or_username).first()
        
        if user:
            # Generate a token for the password reset link
            token = default_token_generator.make_token(user)
            uid = urlsafe_base64_encode(str(user.pk).encode('utf-8'))
            
            # Generate the password reset URL
            reset_url = f"{get_current_site(request).domain}/reset/{uid}/{token}/"
            
            # Create the password reset email message
            subject = "Password Reset Request"
            message = render_to_string('registration/password_reset_email.html', {'reset_url': reset_url, 'user': user})
            
            # Send the email to the user
            send_mail(subject, message, settings.DEFAULT_FROM_EMAIL, [user.email])
        
        return redirect('password_reset_done')  # Redirect to a page confirming the reset request
    return render(request, 'registration/password_reset_form.html')  # Update path here


def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
            return redirect('profile')  # Redirect to profile page after password change
    else:
        form = PasswordChangeForm(request.user)

    return render(request, 'blog/change_password.html', {'form': form})


def edit_profile(request):
    profile, created = Profile.objects.get_or_create(user=request.user)  # Ensure profile exists
    
    if request.method == 'POST':
        form = UserProfileForm(request.POST, instance=profile)  # Bind form to user profile
        if form.is_valid():
            form.save()  # Save the form
            return redirect('profile')  # Redirect to profile page (Change as needed)
    else:
        form = UserProfileForm(instance=profile)  # Load existing bio

    return render(request, 'profile/edit_profile.html', {'form': form})


from .forms import UserProfileForm


def comment_post(request, post_id):
    post = get_object_or_404(Post, id=post_id)

    # Track activity before saving the comment
    UserActivity.objects.create(
        user=request.user,
        action_type='comment',
        details=f"Commented on post: {post.title}"
    )

    if request.method == 'POST':
        form = CommentForm(request.POST)
        if form.is_valid():
            comment = form.save(commit=False)
            comment.user = request.user
            comment.post = post

            # Handle replies
            parent_comment_id = request.POST.get('parent_comment_id')
            if parent_comment_id:
                parent_comment = get_object_or_404(Comment, id=parent_comment_id)
                comment.parent_comment = parent_comment

            comment.save()
            return redirect('post_detail', post_id=post.id)
    else:
        form = CommentForm()

    comments = post.comments.filter(parent_comment__isnull=True)

    return render(request, 'blog/post_detail.html', {
        'post': post,
        'form': form,
        'comments': comments  # Pass comments to template
    })



# Like a post
@login_required
def like_post(request, post_id):
    post = get_object_or_404(Post, id=post_id)

    if Like.objects.filter(post=post, user=request.user).exists():
        return HttpResponseForbidden("You have already liked this post.")

    # Track activity before liking the post
    UserActivity.objects.create(
        user=request.user,
        action_type='like',
        details=f"Liked a post: {post.title}"
    )

    Like.objects.create(post=post, user=request.user)
    return redirect('post_detail', post_id=post.id)



@login_required
def update_post(request, post_id):
    post = get_object_or_404(Post, id=post_id)

    if request.user != post.author:
        return redirect('home')  # Prevents unauthorized editing

    if request.method == "POST":
        form = PostForm(request.POST, request.FILES, instance=post)  # Handle image updates
        if form.is_valid():
            form.save()

            # Track activity after saving the updated post
            UserActivity.objects.create(
                user=request.user,
                action_type='edit post',
                details=f"Edited a post: {post.title}"
            )

            return redirect('home')
    else:
        form = PostForm(instance=post)

    return render(request, 'blog/update_post.html', {'form': form})



def about(request):
    return render(request, 'blog/about.html')  
def contact(request):
    return render(request, 'blog/contact.html') 


@login_required
def delete_post(request, post_id):
    post = get_object_or_404(Post, id=post_id)

    # Track activity before deleting the post
    UserActivity.objects.create(
        user=request.user,
        action_type='delete post',
        details=f"Deleted a post: {post.title}"
    )

    if request.user != post.author:
        return redirect('home')

    if request.method == "POST":
        post.delete()
        return redirect('home')

    return render(request, 'blog/delete_post.html', {'post': post})


# Post details view
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    post.views += 1  # Increment views
    post.save(update_fields=['views'])  # Save only the 'views' field
    return render(request, 'blog/post_detail.html', {'post': post})


@login_required
def create_post(request):
    if request.method == "POST":
        print("Received POST request")
        print("FILES:", request.FILES)  # Debug: Print files received
        UserActivity.objects.create(
            user=request.user,
            action_type='create post',
            details=f"Created a new post: {post.title}"
        )
        form = PostForm(request.POST, request.FILES)  
        if form.is_valid():
            post = form.save(commit=False)
            post.author = request.user
            post.save()

            print("Image saved at:", post.image.url if post.image else "No image uploaded")  # Debugging

            return redirect('home')
        else:
            print("Form errors:", form.errors)  # Debug: Show form errors
    else:
        form = PostForm()
        
    
    return render(request, 'blog/create_post.html', {'form': form})


class CustomLoginView(LoginView):
    template_name = 'registration/login.html'
    authentication_form = CustomLoginForm

def search(request):
    query = request.GET.get('q', '')  # Get search query from the URL
    posts = Post.objects.filter(title__icontains=query)  # Simple search by title
    return render(request, 'blog/search_results.html', {'posts': posts, 'query': query})






@login_required
def home(request):
    # Annotating posts with the total comment count
    posts = Post.objects.annotate(total_comments=Count('comments'))  # Apply annotation here

    # Get the search query
    query = request.GET.get('q', '')  # Capture the search term from the input
    
    # Get the selected category (if any)
    category_id = request.GET.get('category')

    # If there’s a category selected, filter posts by category
    if category_id:
        posts = posts.filter(category_id=category_id)

    # If there’s a search query, filter by title, content, or author
    if query:
        posts = posts.filter(
            Q(title__icontains=query) |  # Search in title
            Q(content__icontains=query) |  # Search in content
            Q(author__username__icontains=query)  # Search by author (username)
        )

    # Retrieve all categories for the filter dropdown
    categories = Category.objects.all()

    # Apply pagination
    paginator = Paginator(posts, 6)  # Show 5 posts per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    # Return the rendered template with the filtered and paginated posts
    return render(request, 'blog/home.html', {
        'page_obj': page_obj,
        'categories': categories,
        'query': query  # Passing the search query to keep it in the input box
    })


# Logout functionality
def user_logout(request):
    logout(request)
    return redirect('index')  # Redirect to index page after logout



# Register view (for creating a new user)
User = get_user_model()

def register(request):
    if request.method == "POST":
        form = CustomUserCreationForm(request.POST)

        username = request.POST.get("username", "").strip()
        email = request.POST.get("email", "").strip()
        password1 = request.POST.get("password1", "")
        password2 = request.POST.get("password2", "")

        # Check if username already exists
        if User.objects.filter(username=username).exists():
            messages.error(request, "Username already exists. Please choose another.")
            return redirect("register")

        # Check if email already exists
        if User.objects.filter(email=email).exists():
            messages.error(request, "An account with this email already exists.")
            return redirect("register")

        # Validate email format
        try:
            from django.core.validators import validate_email
            validate_email(email)
        except ValidationError:
            messages.error(request, "Invalid email format.")
            return redirect("register")

        # Check password match
        if password1 != password2:
            messages.error(request, "Passwords do not match.")
            return redirect("register")

        # Validate password strength, including similarity check
        try:
            validate_password(password1, user=User(username=username))
        except ValidationError as e:
            for error in e.messages:
                messages.error(request, error)  # Display each validation error
            return redirect("register")

        # If form is valid, save user
        if form.is_valid():
            form.save()
            messages.success(request, "Account created successfully! Please log in.")
            return redirect("login")
        else:
            messages.error(request, "Something went wrong. Please check the form.")

    else:
        form = CustomUserCreationForm()

    return render(request, "registration/register.html", {"form": form})

@login_required
def profile(request):
    # Ensure the profile exists or create one if it doesn't
    profile, created = Profile.objects.get_or_create(user=request.user)  

    # Count posts by the current user
    post_count = Post.objects.filter(author=request.user).count()
    print(f"User {request.user.username} has {post_count} posts.")  # Debugging output

    if request.method == "POST":
        form = UserProfileForm(request.POST, request.FILES, instance=profile)  # Use Profile instance for bio update
        if form.is_valid():
            form.save()
            messages.success(request, "Bio updated successfully!")  # Show success message
            return redirect('profile')  # Redirect back to profile page
    else:
        form = UserProfileForm(instance=profile)  # Load existing bio for GET request

    return render(request, 'blog/profile.html', {'user': request.user, 'form': form, 'post_count': post_count})


def update_profile_picture(request):
    if request.method == 'POST':
        profile_picture = request.FILES.get('profile_picture')  # Use .get() to avoid MultiValueDictKeyError

        if not profile_picture:  # If no file is selected
            messages.error(request, "Please select an image before uploading.")
            return redirect('profile')  # Redirect back to profile page
        
        # If file is selected, update the user's profile picture
        request.user.profile.profile_picture = profile_picture
        request.user.profile.save()
        
        messages.success(request, "Profile picture updated successfully!")
        return redirect('profile')  # Redirect back to the profile page

    return redirect('profile')  # Ensure user is redirected even if the request method is not POST

  
@login_required
def update_bio(request):
    if request.method == 'POST':
        bio = request.POST.get('bio')
        user_profile = request.user.profile
        user_profile.bio = bio
        user_profile.save()
        return redirect('profile')  # Redirect to the profile page after saving