from django.urls import path
from . import views
from django.contrib.auth import views as auth_views  # Import Django's built-in auth views
from .views import create_post
from .views import CustomLoginView
from .views import update_post, delete_post


urlpatterns = [
    path('', views.index, name='index'),  # Index page (first page with login/register options)
    path('home/', views.home, name='home'),  # Home page (blog posts)
    path('post/<int:pk>/', views.post_detail, name='post_detail'),  # Post detail page
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),  # Logout page
    path('register/', views.register, name='register'),  # Register page
    path('profile/', views.profile, name='profile'),  # User profile page
    path('login/', CustomLoginView.as_view(), name='login'),
    path('password_reset/', auth_views.PasswordResetView.as_view(), name='password_reset'),
    path('password_reset/done/', auth_views.PasswordResetDoneView.as_view(), name='password_reset_done'),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(), name='password_reset_confirm'),
    path('reset/done/', auth_views.PasswordResetCompleteView.as_view(), name='password_reset_complete'),
    path('search/', views.search, name='search'),
    path('create-post/', create_post, name='create_post'),
    path('post/update/<int:post_id>/', update_post, name='update_post'),
    path('post/delete/<int:post_id>/', delete_post, name='delete_post'),
    path('about/', views.about, name='About'),
    path('contact/', views.contact, name='contact'),
    path('post/<int:post_id>/', views.post_detail, name='post_detail'),
    path('post/<int:post_id>/comment/', views.comment_post, name='comment_post'),
    path('post/<int:post_id>/like/', views.like_post, name='like_post'),
]
