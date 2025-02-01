# Simple Blog Application

## Objective
This project is a simple blog application built using Django. It allows users to register, log in, create, read, update, and delete blog posts. Users can also comment on posts.

## Features

### 1. User Authentication
- Users can register, log in, and log out.
- Users can maintain their personal profiles (profile picture, bio, etc.).
- Forgot password functionality with email verification.

### 2. Blog Posts
- Authenticated users can create, edit, and delete their own blog posts.
- All users can view blog posts on the home page.
- Blog posts have individual pages.
- Blog posts can be categorized.
- Users can search for blog posts by title, content, or author.

### 3. Comments
- Both authenticated and anonymous users can add comments.
- Comments appear on individual blog post pages.
- Any user or the author can reply to comments.

### 4. Additional Features
- Displays author's name and post creation date.
- Tracks the number of views for each post.
- Uses Bootstrap for basic styling.

## Installation and Setup


 1. Clone the Repository
git clone https://github.com/your-username/blog-application.git
cd blog-application


3. Install Dependencies
pip install -r requirements.txt

4. Apply Migrations
python manage.py migrate


5.Create a Superuser (Admin)
python manage.py createsuperuser


6. Run the Development Server
python manage.py runserver
Visit http://127.0.0.1:8000/ in your browser.

Project Structure

blog-application/
│── blog/                   # Main app
│   ├── migrations/         # Database migrations
│   ├── static/             # Static files
│   ├── templates/          # HTML templates
│   ├── views.py            # Views
│   ├── models.py           # Models
│   ├── urls.py             # URL routes
│── myproject/              # Django project files
│── db.sqlite3              # Database file
│── manage.py               # Django management script
│── requirements.txt        # Dependencies


Technologies Used
Django (Python)
SQLite (Database)
Bootstrap (CSS Framework)
HTML & CSS



License
This project is open-source and available under the MIT License.
