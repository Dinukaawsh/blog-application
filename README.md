# Simple Blog Application

## Objective
This project is a simple blog application built using Django. It allows users to register, log in, create, read, update, and delete blog posts. Users can also comment on posts.

## Features

### 1. User Authentication
- Users can register, log in, and log out.
- Users can maintain their personal profiles (profile picture, bio, etc.).
- Forgot password functionality with email verification.
- Users must be authenticated to like posts or access full blog details.

### 2. Blog Posts
- Authenticated users can create, edit, and delete their own blog posts.
- All users can view blog posts on the home page.
- Blog posts have individual pages.
- Blog posts can be categorized.
- Users can search for blog posts by title, content, or author.
- Post images can be added.


### 3. Comments
- Authenticated users can add comments.
- Comments appear on individual blog post pages.
- Users can reply to comments.
- Comment counts are displayed on the homepage.

### 4. Additional Features
- Displays author's name and post creation date.
- Uses Bootstrap for basic styling.
- Users must log in to access certain features like commenting, liking, and reading full posts.
- Uses Bootstrap for a modern and responsive UI.
- Displays the three most recent blog posts on the index page.

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


Technologies Used
Django (Python)
MySQL (Database)
Bootstrap (CSS Framework)
HTML & CSS
JavaScript (for interactive UI elements)


License
This project is open-source and available under the MIT License.
