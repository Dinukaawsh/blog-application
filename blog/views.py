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

def comment_post(request, post_id):
    post = get_object_or_404(Post, id=post_id)

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

    # Fetch updated comments to render them on the post detail page
    comments = post.comments.all()  # Get all comments related to the post

    return render(request, 'blog/post_detail.html', {
        'post': post,
        'form': form,
        'comments': comments  # Pass comments to template
    })


# Like a post
def like_post(request, post_id):
    post = get_object_or_404(Post, id=post_id)
    if Like.objects.filter(post=post, user=request.user).exists():
        return HttpResponseForbidden("You have already liked this post.")
    like = Like.objects.create(post=post, user=request.user)
    return redirect('post_detail', post_id=post.id)  # Make sure the redirect is correct



@login_required
def update_post(request, post_id):
    post = get_object_or_404(Post, id=post_id)

    if request.user != post.author:
        return redirect('home')  # Prevents unauthorized editing

    if request.method == "POST":
        form = PostForm(request.POST, instance=post)
        if form.is_valid():
            form.save()
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

    if request.user != post.author:
        return redirect('home')

    if request.method == "POST":
        post.delete()
        return redirect('home')

    return render(request, 'blog/delete_post.html', {'post': post})

# Post details view
def post_detail(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'blog/post_detail.html', {'post': post})


@login_required
def create_post(request):
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)  # Don't save yet
            post.author = request.user  # Assign the current logged-in user as the author
            post.save()  # Now save the post
            return redirect('home')
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


# Index view (first page shown with login/register options)
def index(request):
    if request.user.is_authenticated:
        return redirect('home')  # Redirect to home if already logged in
    return render(request, 'index.html')


# Home page with pagination (only accessible when logged in)
@login_required
def home(request):
    posts_list = Post.objects.all()
    posts_list = Post.objects.annotate(total_comments=Count('comments')) 
    paginator = Paginator(posts_list, 5)  # Show 5 posts per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    return render(request, 'blog/home.html', {'page_obj': page_obj})



# Logout functionality
def user_logout(request):
    logout(request)
    return redirect('index')  # Redirect to index page after logout

# Register view (for creating a new user)


def register(request):
    if request.method == "POST":
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Account created successfully!')
            return redirect("login")  # Redirect after successful registration
    else:
        form = CustomUserCreationForm()

    return render(request, "registration/register.html", {"form": form})

# Profile view (only accessible when logged in)
@login_required
def profile(request):
    return render(request, 'blog/profile.html')




