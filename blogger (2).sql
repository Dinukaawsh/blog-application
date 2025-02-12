-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2025 at 03:04 PM
-- Server version: 10.11.11-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogger`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add post', 8, 'add_post'),
(30, 'Can change post', 8, 'change_post'),
(31, 'Can delete post', 8, 'delete_post'),
(32, 'Can view post', 8, 'view_post'),
(33, 'Can add profile', 9, 'add_profile'),
(34, 'Can change profile', 9, 'change_profile'),
(35, 'Can delete profile', 9, 'delete_profile'),
(36, 'Can view profile', 9, 'view_profile'),
(37, 'Can add comment', 10, 'add_comment'),
(38, 'Can change comment', 10, 'change_comment'),
(39, 'Can delete comment', 10, 'delete_comment'),
(40, 'Can view comment', 10, 'view_comment'),
(41, 'Can add like', 11, 'add_like'),
(42, 'Can change like', 11, 'change_like'),
(43, 'Can delete like', 11, 'delete_like'),
(44, 'Can view like', 11, 'view_like');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$JfNNbuiHp4Vo6kzipuTl2v$i2NbCeYjHbsPl/a9k6wOA9aW9eagfm85o4zgBaMS/8M=', '2025-02-11 13:04:19.943743', 1, 'admin', '', '', 'dinukaaw.sh@gmail.com', 1, 1, '2025-02-10 17:18:31.660513'),
(2, 'pbkdf2_sha256$870000$3L0KMDxV3VE9XxYbgW4fJY$7P4MSlpfvJzLNAKysf9jqUkb8c5yO5vlCdDVeAYY2yw=', '2025-02-11 14:03:14.957982', 0, 'dinuka', '', '', 'dinuka@gmail.com', 0, 1, '2025-02-10 17:23:17.666318'),
(3, 'pbkdf2_sha256$870000$WzOqCOdaMm9spC50KBRvWp$FBbc/DmldkQgkgLIWcxzSYBjdIGTORazvnx+cyEUpOc=', '2025-02-11 13:58:53.567158', 0, 'roshan', '', '', 'roshan@gmail.com', 0, 1, '2025-02-10 17:26:55.102211'),
(4, 'pbkdf2_sha256$870000$01Qzyq6hY9uKxEQS9rbHww$mNQlpTBko+bQY5kwp0CxLIIWWQYw/RAURn+84vfvwi0=', '2025-02-11 13:50:59.820105', 0, 'Denuwan', '', '', 'denuwan@gmail.com', 0, 1, '2025-02-10 17:30:47.076657'),
(5, 'pbkdf2_sha256$870000$MRiYF5q2sV2Eg4tOL076Uf$M57UuHlbdhZezSOm2JwjlUa7NtvlCBpe38pFUZddLh0=', '2025-02-11 13:03:10.940206', 0, 'Gihan', '', '', 'gihan@gmail.com', 0, 1, '2025-02-10 17:33:05.107831'),
(6, 'pbkdf2_sha256$870000$GEvbqJKGiqEAw9lJnzcWyj$IobEmS1liy5Aj7awpv+96pOfn9tuA+pk7rdtwtdK754=', '2025-02-10 20:20:04.755234', 0, 'chandima', '', '', 'chandima@gmail.com', 0, 1, '2025-02-10 20:11:38.289708'),
(7, 'pbkdf2_sha256$870000$c4WhRmdVrc4sUKkrxRyDp7$M/CQY0L0nIGCsZao0CUnYhzQQSNiIq0eLPh8oQPSMRo=', '2025-02-11 13:53:23.737570', 0, 'Dinusha', '', '', 'dinusha@gmail.com', 0, 1, '2025-02-10 20:48:57.920942');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_category`
--

CREATE TABLE `blog_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_category`
--

INSERT INTO `blog_category` (`id`, `name`) VALUES
(3, 'Education'),
(4, 'Entertainment'),
(5, 'foods'),
(2, 'Lifestyle'),
(1, 'Technology');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comment`
--

CREATE TABLE `blog_comment` (
  `id` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `parent_comment_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_comment`
--

INSERT INTO `blog_comment` (`id`, `content`, `created_at`, `parent_comment_id`, `post_id`, `user_id`) VALUES
(1, 'read this!!', '2025-02-10 17:21:48.851174', NULL, 1, 1),
(2, 'This is important!', '2025-02-10 17:25:12.344242', NULL, 1, 2),
(3, 'Interesting content!', '2025-02-10 17:28:47.272211', NULL, 2, 3),
(4, 'this is important!', '2025-02-10 17:34:59.725224', NULL, 10, 5),
(5, 'wow!', '2025-02-10 17:35:09.596666', NULL, 1, 5),
(6, 'this is amezing!', '2025-02-10 17:35:29.252664', NULL, 2, 5),
(7, 'Wow!', '2025-02-10 17:35:45.243488', NULL, 4, 5),
(8, 'Importent content!', '2025-02-10 18:05:33.744070', NULL, 5, 1),
(9, 'this is very good!', '2025-02-10 18:29:12.714503', NULL, 3, 4),
(10, 'very good', '2025-02-10 20:49:24.456995', NULL, 1, 7),
(11, 'Amezing', '2025-02-10 20:52:09.862224', NULL, 5, 7),
(12, 'thank you', '2025-02-10 21:07:20.853727', 7, 4, 7),
(13, 'importent info!', '2025-02-10 21:12:55.361709', NULL, 4, 7),
(14, 'good', '2025-02-10 21:13:13.108791', 7, 4, 7),
(15, 'good idea', '2025-02-10 21:39:04.658446', NULL, 6, 1),
(16, 'cool!', '2025-02-10 21:44:44.973137', NULL, 1, 1),
(17, 'yes!', '2025-02-10 21:45:13.986674', 2, 1, 1),
(18, 'thank you', '2025-02-10 21:57:48.319275', 10, 1, 1),
(19, 'yess!', '2025-02-10 22:59:36.407365', 13, 4, 2),
(20, 'i love music!', '2025-02-11 12:30:08.387267', NULL, 24, 7),
(21, 'i love music!', '2025-02-11 12:31:56.452276', NULL, 16, 7),
(22, 'nice', '2025-02-11 12:45:42.155216', NULL, 1, 7),
(23, 'thank you', '2025-02-11 13:01:25.073441', 1, 1, 7),
(24, 'nice content!', '2025-02-11 14:03:44.442053', NULL, 29, 2);

-- --------------------------------------------------------

--
-- Table structure for table `blog_like`
--

CREATE TABLE `blog_like` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_like`
--

INSERT INTO `blog_like` (`id`, `created_at`, `post_id`, `user_id`) VALUES
(1, '2025-02-10 17:20:44.993005', 1, 1),
(2, '2025-02-10 17:24:38.654035', 4, 2),
(3, '2025-02-10 17:28:07.802038', 5, 3),
(4, '2025-02-10 17:28:13.873594', 1, 3),
(5, '2025-02-10 17:28:23.094198', 4, 3),
(6, '2025-02-10 17:28:29.593663', 2, 3),
(7, '2025-02-10 17:34:45.461740', 10, 5),
(8, '2025-02-10 17:35:37.001091', 4, 5),
(9, '2025-02-10 18:05:20.844234', 5, 1),
(10, '2025-02-10 18:28:59.540789', 3, 4),
(11, '2025-02-10 20:49:12.874973', 1, 7),
(12, '2025-02-10 20:52:02.005309', 5, 7),
(13, '2025-02-10 20:54:29.277043', 2, 7),
(14, '2025-02-10 20:54:34.587298', 3, 7),
(15, '2025-02-10 21:14:14.365135', 4, 7),
(17, '2025-02-10 21:47:05.949938', 2, 1),
(18, '2025-02-10 23:03:44.861799', 8, 4),
(19, '2025-02-11 10:07:14.973059', 14, 4),
(20, '2025-02-11 10:07:21.789532', 15, 4),
(21, '2025-02-11 10:28:22.090600', 18, 2),
(22, '2025-02-11 10:31:47.874762', 20, 2),
(23, '2025-02-11 10:32:51.447841', 21, 2),
(24, '2025-02-11 10:37:52.757672', 22, 7),
(25, '2025-02-11 10:39:19.446203', 23, 7),
(26, '2025-02-11 10:40:29.684291', 24, 7),
(27, '2025-02-11 12:04:34.175898', 25, 7),
(28, '2025-02-11 12:31:46.050374', 16, 7),
(29, '2025-02-11 14:03:27.710964', 29, 2);

-- --------------------------------------------------------

--
-- Table structure for table `blog_post`
--

CREATE TABLE `blog_post` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_post`
--

INSERT INTO `blog_post` (`id`, `title`, `content`, `created_at`, `updated_at`, `author_id`, `image`, `category_id`) VALUES
(1, 'The Evolution of Web Development', 'Web development has come a long way since the early days of static HTML pages. Today, dynamic web applications powered by frameworks like Laravel and Django are the norm. This blog explores how web development has evolved, highlighting the rise of JavaScript frameworks, API-driven applications, and the integration of modern technologies that provide rich, interactive user experiences.\r\nWeb development has seen incredible progress over the years. In the 1990s, websites were simple HTML files with static content. Fast forward to today, where we have complex web applications powered by dynamic technologies like React, Vue.js, Laravel, and Django. The shift from static to dynamic content, along with the introduction of JavaScript frameworks, APIs, and real-time updates, has transformed how we interact with the web. This blog will examine key milestones in web development, the introduction of server-side rendering, client-side rendering, and the impact of modern web standards like Progressive Web Apps (PWAs). By the end, readers will gain an appreciation for how modern web apps are built and why they are so much more interactive and engaging.', '2025-02-10 17:20:41.435494', '2025-02-11 09:59:27.107955', 1, 'post_images/download_1.jpg', 1),
(2, 'How to Build a Simple Blog Using Django', 'Django is an excellent web framework for building powerful applications, and creating a blog is a great way to start. In this blog, we’ll walk through the process of building a simple blog from scratch, covering user authentication, post creation, and comment functionality, all while keeping things simple and easy to follow.\r\n\r\nDjango is a versatile and powerful Python web framework that allows you to quickly build web applications, including blogs. This blog will guide you step-by-step through building a simple blog using Django. You’ll start with setting up your project, configuring URLs, and creating models to store blog posts. After that, we will focus on user authentication, allowing users to register, log in, and leave comments on posts. You’ll also learn how to use Django’s built-in admin interface for managing blog posts, authors, and users. By the end, you’ll have a fully functioning blog with a clean, minimalistic design and the foundation to expand further with features like categories, tags, or a search function.', '2025-02-10 17:21:31.724436', '2025-02-11 09:59:24.102030', 1, 'post_images/download_1.png', 1),
(3, 'Best Practices for Secure Authentication in Web Applications', 'Security is a top concern for any web application. This post delves into best practices for implementing secure authentication mechanisms, such as password hashing, multi-factor authentication, and how to prevent common vulnerabilities like SQL injection and cross-site scripting (XSS).\r\nAuthentication is a critical part of any web application, and securing it should be a top priority. In this blog, we’ll cover the key principles behind secure authentication. We’ll start with basic techniques like password hashing and explain why storing plaintext passwords is dangerous. We’ll also dive into more advanced methods, such as implementing multi-factor authentication (MFA), using OAuth for third-party logins, and securing login forms from brute-force attacks. Additionally, we’ll explore the concept of session management, including securely storing cookies and tokens. Finally, we’ll discuss how to prevent common authentication-related attacks like SQL injection, session hijacking, and cross-site scripting (XSS), ensuring your users\' data stays protected.', '2025-02-10 17:23:59.460827', '2025-02-11 10:21:36.628581', 2, 'post_images/download_3.jpg', 1),
(4, 'Why Choose Vue.js for Your Front-End Framework', 'Vue.js is a progressive JavaScript framework that has gained significant popularity among developers. This blog covers the key reasons why Vue.js is an excellent choice for building front-end applications, including its simplicity, flexibility, and seamless integration with other tools like Laravel.\r\nVue.js is a progressive JavaScript framework that has become increasingly popular among developers. Unlike other frameworks like Angular or React, Vue is easy to integrate into existing projects without a complete overhaul. This blog will explore why Vue.js is a great choice for building front-end applications. We’ll go over its core features, including the Vue CLI, reactivity system, and component-based architecture. Vue’s simplicity and flexibility allow developers to create scalable, maintainable applications with minimal boilerplate. We will also discuss Vue’s learning curve, which is lower than some other frameworks, and how Vue integrates seamlessly with back-end frameworks like Laravel for building full-stack applications.', '2025-02-10 17:24:17.986751', '2025-02-11 09:59:20.419630', 2, 'post_images/download_2.png', 1),
(5, 'The Importance of Responsive Design in Modern Websites', 'In the age of mobile-first design, responsive web design is crucial for ensuring a great user experience across all devices. This blog discusses the principles of responsive design, why it matters, and how to use tools like media queries and CSS frameworks to create layouts that adapt to any screen size.\r\nIn today’s mobile-first world, creating websites that work seamlessly across all devices is more important than ever. Responsive web design ensures that your website adapts to different screen sizes, whether viewed on a mobile phone, tablet, or desktop. In this blog, we’ll cover the principles of responsive design, including fluid grids, flexible images, and media queries. We’ll explain how to design layouts that adjust to various screen sizes, ensuring an optimal user experience. Additionally, we’ll explore responsive design frameworks like Bootstrap, which provide pre-built CSS and JavaScript components to create mobile-friendly sites quickly. By the end, you\'ll understand why responsive design is essential and how to implement it in your projects.', '2025-02-10 17:27:26.188457', '2025-02-11 09:59:17.243656', 3, 'post_images/download_4.jpg', 1),
(6, 'Exploring Laravel’s Eloquent ORM for Database Management', 'Laravel’s Eloquent ORM is a powerful and elegant way to interact with databases. In this blog, we’ll dive into how Eloquent makes database queries easy to write and maintain. We’ll explore relationships, query scopes, and advanced techniques to get the most out of Eloquent when managing data in your Laravel projects.\r\nLaravel’s Eloquent ORM (Object-Relational Mapping) is a powerful tool for interacting with databases. It simplifies the process of writing database queries by allowing developers to work with database records as if they were objects in their code. This blog will explore how Eloquent works, including defining models, retrieving records, and working with relationships like one-to-many and many-to-many. We’ll also dive into query scopes, allowing you to write reusable query logic, and how to leverage Eloquent’s advanced features like eager loading to optimize performance. By the end of the post, readers will have a clear understanding of how to efficiently interact with their database using Eloquent, reducing the need for complex SQL queries.', '2025-02-10 17:27:57.804303', '2025-02-11 09:59:14.820585', 3, 'post_images/download_3.png', 1),
(7, 'How to Build a RESTful API with Laravel', 'Laravel provides excellent tools for building RESTful APIs that are both efficient and easy to manage. This post guides you through the steps of creating a RESTful API in Laravel, covering everything from routing to authentication, response formatting, and validation.\r\nLaravel makes it incredibly easy to build a RESTful API for your applications. REST (Representational State Transfer) is an architectural style that is widely used to design networked applications. This blog will guide you through the process of building a RESTful API in Laravel, including setting up routes, controllers, and models for handling different HTTP requests (GET, POST, PUT, DELETE). We’ll also cover how to implement authentication using Laravel Passport for token-based authentication and how to return responses in JSON format. Finally, we’ll explore best practices for building a secure and maintainable API, including rate-limiting, input validation, and handling errors properly.', '2025-02-10 17:31:17.552055', '2025-02-11 13:27:48.731149', 4, 'post_images/download_4.png', 1),
(8, 'Integrating Bootstrap into Your Django Project', 'Bootstrap is a popular front-end framework that can significantly speed up development. In this blog, we show how to integrate Bootstrap into a Django project, enhancing the look and feel of your website with responsive, pre-styled components.\r\nBootstrap is a popular front-end framework that provides ready-made UI components like buttons, forms, navigation bars, and more. This blog will show you how to integrate Bootstrap into a Django project. You’ll learn how to include the Bootstrap CSS and JavaScript files, customize them for your needs, and use them to style your Django templates. We\'ll also cover how to create a responsive layout using Bootstrap’s grid system and components. By the end of the blog, you’ll have a beautiful and functional Django website that uses Bootstrap for styling, which will significantly speed up your front-end development process.', '2025-02-10 17:31:32.687028', '2025-02-11 09:58:52.707653', 4, 'post_images/download_5.jpg', 1),
(9, 'Understanding MVC Architecture in Web Development', 'The Model-View-Controller (MVC) pattern is fundamental in web development. This blog explains how MVC separates the concerns of data, user interface, and control flow, making it easier to build maintainable and scalable web applications. We’ll also look at how MVC is implemented in popular frameworks like Laravel and Django.\r\nThe Model-View-Controller (MVC) architecture is one of the most widely used design patterns in web development. MVC separates the application into three components: the model (handles data), the view (handles the user interface), and the controller (manages input and logic). This blog will break down the roles of each component, explain how they interact, and why MVC is so effective in creating maintainable and scalable web applications. We’ll also explore how popular frameworks like Laravel and Django implement MVC and how it helps developers keep code organized, making it easier to collaborate and debug.', '2025-02-10 17:33:31.420057', '2025-02-11 09:58:48.012515', 5, 'post_images/download_5.png', 1),
(10, 'Top 5 Debugging Tips for Laravel Developers', 'Debugging is an essential skill for any developer. This blog shares five practical tips for debugging Laravel applications, from using built-in tools like Laravel Debugbar to logging and error handling strategies that can help you quickly find and fix issues in your code.\r\nDebugging is an essential skill for any developer, and Laravel provides several powerful tools to help you identify and fix issues in your applications. In this blog, we’ll cover five tips for effectively debugging Laravel applications. First, we’ll discuss how to use Laravel’s built-in debugging tools, like the Laravel Debugbar, to track queries, view data, and inspect other aspects of your application. Then, we’ll dive into error logging and how to use Laravel’s logging system to track issues in your code. We’ll also explore techniques for debugging database queries, testing your code with PHPUnit, and using Xdebug for step-by-step debugging. By the end, you’ll be equipped with practical tips to troubleshoot and resolve issues faster.', '2025-02-10 17:34:32.451947', '2025-02-11 09:58:41.670163', 5, 'post_images/download_6.jpg', 1),
(14, 'How to Develop Effective Study Habits for Better Learning', 'Developing good study habits is key to academic success, but many students struggle with time management and concentration. This blog will provide practical tips on how to create an effective study routine, avoid procrastination, and use techniques like the Pomodoro method, active recall, and spaced repetition. We’ll also discuss the importance of finding the right study environment and minimizing distractions. Finally, we will explore how different learning styles—visual, auditory, reading/writing, and kinesthetic—affect how students absorb information and how they can use this knowledge to improve their study techniques.', '2025-02-11 10:06:14.291557', '2025-02-11 10:06:14.291606', 4, 'post_images/download_7.jpg', 3),
(15, 'The Importance of Soft Skills in Education and Career Growth', 'While academic knowledge is crucial, soft skills like communication, teamwork, and problem-solving are equally important in today\'s job market. This blog will highlight why soft skills matter for students and professionals, and how they can be developed alongside academic studies. We will cover essential skills such as emotional intelligence, adaptability, critical thinking, and leadership. Additionally, we will provide real-life examples of how strong soft skills can make a difference in interviews, workplace interactions, and overall career advancement.', '2025-02-11 10:07:06.430045', '2025-02-11 10:07:06.430089', 4, 'post_images/download_6.png', 3),
(16, 'The Evolution of the Film Industry: From Silent Movies to CGI Blockbusters', 'The film industry has undergone an incredible transformation over the past century. In this blog, we’ll take a journey through the history of cinema, starting from the early days of silent films and black-and-white classics to the rise of sound, color, and digital effects. We’ll explore how CGI (computer-generated imagery) has revolutionized filmmaking, enabling directors to create breathtaking visuals that were once impossible. The blog will also discuss the impact of streaming services like Netflix and Disney+ on traditional movie theaters and how they are changing the way we consume entertainment.', '2025-02-11 10:10:59.378267', '2025-02-11 10:10:59.378310', 4, 'post_images/download_8.jpg', 4),
(17, 'The Science Behind Perfect Coffee: How to Brew Like a Pro', 'Coffee is more than just a drink; it’s an art and a science. In this blog, we’ll explore different brewing methods like espresso, French press, pour-over, and AeroPress, explaining how each technique affects flavor. We’ll also discuss how factors like water temperature, grind size, and bean origin influence the final cup. Whether you\'re a casual coffee drinker or an aspiring barista, this guide will help you master the art of making the perfect coffee at home.', '2025-02-11 10:11:55.006490', '2025-02-11 10:11:55.006532', 4, 'post_images/download_9.jpg', 5),
(18, '10 Superfoods You Should Add to Your Diet for a Healthier Life', 'Superfoods are packed with nutrients and offer a variety of health benefits. This blog will highlight ten must-have superfoods like quinoa, chia seeds, kale, salmon, and blueberries, explaining how they boost immunity, improve digestion, and provide essential vitamins. We’ll also share easy ways to incorporate them into everyday meals, whether in smoothies, salads, or snacks.', '2025-02-11 10:28:13.037742', '2025-02-11 10:28:13.037790', 2, 'post_images/download_10.jpg', 5),
(19, 'The Power of Morning Routines: How to Start Your Day for Success', 'How you start your morning sets the tone for the rest of the day. This blog will explore the benefits of a structured morning routine, including practices like meditation, exercise, journaling, and healthy breakfasts. We’ll provide a step-by-step guide to creating a routine that boosts productivity, reduces stress, and helps achieve personal goals.', '2025-02-11 10:30:59.221611', '2025-02-11 10:30:59.221656', 2, 'post_images/download_11.jpg', 2),
(20, 'Minimalist Living: How to Declutter Your Life and Find Happiness', 'Minimalism is more than just owning fewer things; it’s about focusing on what truly adds value to your life. This blog will guide readers on decluttering their homes, simplifying their wardrobes, and adopting a more intentional lifestyle. We’ll also discuss the mental and emotional benefits of minimalism, such as reduced stress and increased focus.', '2025-02-11 10:31:38.429039', '2025-02-11 10:31:38.429086', 2, 'post_images/download_12.jpg', 2),
(21, 'The Power of Reading: How Books Shape Our Minds and Lives', 'Reading is one of the most powerful tools for personal and intellectual growth. This blog will explore how reading enhances cognitive abilities, boosts empathy, and expands knowledge across different subjects. We’ll discuss the benefits of both fiction and non-fiction books, and how they help in developing imagination, critical thinking, and emotional intelligence. Additionally, we will highlight strategies to build a reading habit, such as setting reading goals, using audiobooks, and finding genres that truly interest the reader. Finally, we will touch on how reading influences success in various careers and personal development.', '2025-02-11 10:32:45.865267', '2025-02-11 10:32:45.865319', 2, 'post_images/download_13.jpg', 3),
(22, 'The Debate Over Traditional vs. Modern Education Methods', 'Education systems worldwide are evolving, but there is an ongoing debate about whether traditional teaching methods are still effective compared to modern, student-centered approaches. In this blog, we will compare lecture-based learning with newer methods such as project-based learning, flipped classrooms, and experiential learning. We’ll discuss the pros and cons of both approaches and how they impact students\' critical thinking, creativity, and problem-solving abilities. Additionally, we will examine how a balanced approach—combining traditional discipline with modern engagement techniques—can create the best learning outcomes.', '2025-02-11 10:37:46.818213', '2025-02-11 10:37:46.818257', 7, 'post_images/download_7.png', 3),
(23, 'The Rise of Gaming: How Video Games Became a Billion-Dollar Industry', 'What started as a niche hobby has now turned into one of the biggest industries in entertainment. This blog will explore the rise of gaming, from the arcade era of the 1980s to today’s high-tech consoles and virtual reality experiences. We’ll discuss how gaming has evolved into competitive eSports, with professional players, million-dollar tournaments, and global audiences. The blog will also touch on the role of storytelling in modern games, how indie developers are shaping the industry, and the future of cloud gaming services like Xbox Game Pass and NVIDIA GeForce Now.', '2025-02-11 10:39:08.245543', '2025-02-11 10:39:08.245597', 7, 'post_images/download_14.jpg', 4),
(24, 'Music Trends That Are Shaping the Industry Today', 'The music industry is constantly evolving, influenced by cultural shifts, technology, and changing listener preferences. In this blog, we’ll examine some of the biggest music trends shaping the industry, such as the rise of independent artists, the impact of streaming services like Spotify and Apple Music, and the growing popularity of AI-generated music. We’ll also discuss how social media platforms like TikTok have changed the way songs go viral, leading to instant fame for artists. Finally, we’ll explore the future of live music, from virtual concerts to holographic performances.', '2025-02-11 10:40:13.177358', '2025-02-11 10:40:13.177405', 7, 'post_images/download_15.jpg', 4),
(25, 'The Impact of Social Media on Mental Health: Finding a Healthy Balance', 'Social media can be both a powerful tool and a source of stress. This blog will explore how excessive screen time affects mental well-being, causes comparison anxiety, and impacts self-esteem. We’ll provide strategies for managing social media use, including setting boundaries, unfollowing toxic accounts, and practicing digital detoxing to maintain a healthier relationship with technology.', '2025-02-11 12:04:23.381691', '2025-02-11 12:04:23.381741', 7, 'post_images/download_16.jpg', 2),
(26, 'How to Travel on a Budget: Tips for Affordable Adventures', 'Traveling doesn’t have to be expensive! This blog will share practical tips on how to find cheap flights, book budget-friendly accommodations, and explore destinations without overspending. We’ll also discuss how to make money while traveling, such as freelance work, travel blogging, and remote jobs. Whether you\'re a backpacker or a luxury traveler, these tips will help you see the world without breaking the bank.', '2025-02-11 13:56:44.304872', '2025-02-11 13:56:44.304923', 3, 'post_images/download_17.jpg', 2),
(27, 'The Art of Baking: Tips for Making Perfect Cakes and Pastries', 'Baking is both a science and an art, requiring precision and creativity. This blog will cover essential baking tips, from measuring ingredients accurately to mastering the perfect dough consistency. We’ll also discuss common baking mistakes and how to fix them, along with simple recipes for beginners, such as classic chocolate chip cookies, fluffy cupcakes, and homemade bread.', '2025-02-11 13:58:33.868591', '2025-02-11 13:58:33.868641', 3, 'post_images/download_18.jpg', 5),
(28, 'Street Food Around the World: Must-Try Dishes from Every Continent', 'Street food is a delicious and affordable way to experience global flavors. In this blog, we’ll take a food tour around the world, highlighting must-try dishes like tacos from Mexico, pad Thai from Thailand, falafel from the Middle East, and churros from Spain. We’ll also share tips on how to safely enjoy street food while traveling and where to find the best street food spots.', '2025-02-11 13:59:36.361994', '2025-02-11 13:59:36.362058', 3, 'post_images/download_19.jpg', 5),
(29, 'The Rise of Plant-Based Diets: Why More People Are Going Vegan', 'More people are switching to plant-based diets for health, environmental, and ethical reasons. This blog will explore the benefits of reducing meat consumption, the rise of meat alternatives like Beyond Meat and Impossible Burger, and how celebrities and athletes are embracing veganism. We’ll also discuss common myths about plant-based eating and provide simple vegan recipes for beginners.', '2025-02-11 14:01:18.677286', '2025-02-11 14:01:18.677347', 3, 'post_images/download_20.jpg', 5);

-- --------------------------------------------------------

--
-- Table structure for table `blog_profile`
--

CREATE TABLE `blog_profile` (
  `id` bigint(20) NOT NULL,
  `bio` longtext DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_profile`
--

INSERT INTO `blog_profile` (`id`, `bio`, `user_id`, `profile_picture`) VALUES
(1, 'hello i am gihan. good to see you', 5, 'profile_pics/images_2.png'),
(2, 'hello it\'s me denuwan here', 4, 'profile_pics/download.jpg'),
(3, 'its me dinuka', 2, 'profile_pics/images.png'),
(4, NULL, 3, 'profile_pics/219986.png'),
(5, 'i am chandima.', 6, 'profile_pics/images.jpg'),
(6, 'hello my name is dinusha. hey all', 7, 'profile_pics/images_1.png'),
(7, 'i am the ADMIN', 1, 'profile_pics/download.png');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-02-11 09:58:41.672367', '10', 'Top 5 Debugging Tips for Laravel Developers', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 8, 1),
(2, '2025-02-11 09:58:48.015299', '9', 'Understanding MVC Architecture in Web Development', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 8, 1),
(3, '2025-02-11 09:58:52.709728', '8', 'Integrating Bootstrap into Your Django Project', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 8, 1),
(4, '2025-02-11 09:58:56.356074', '7', 'How to Build a RESTful API with Laravel', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 8, 1),
(5, '2025-02-11 09:59:08.381715', '6', 'Exploring Laravel’s Eloquent ORM for Database Management', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 8, 1),
(6, '2025-02-11 09:59:12.175889', '5', 'The Importance of Responsive Design in Modern Websites', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 8, 1),
(7, '2025-02-11 09:59:14.822758', '6', 'Exploring Laravel’s Eloquent ORM for Database Management', 2, '[]', 8, 1),
(8, '2025-02-11 09:59:17.245583', '5', 'The Importance of Responsive Design in Modern Websites', 2, '[]', 8, 1),
(9, '2025-02-11 09:59:20.421933', '4', 'Why Choose Vue.js for Your Front-End Framework', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 8, 1),
(10, '2025-02-11 09:59:24.104199', '2', 'How to Build a Simple Blog Using Django', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 8, 1),
(11, '2025-02-11 09:59:27.110257', '1', 'The Evolution of Web Development', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 8, 1),
(12, '2025-02-11 10:21:36.630709', '3', 'Best Practices for Secure Authentication in Web Applications', 2, '[{\"changed\": {\"fields\": [\"Category\"]}}]', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'blog', 'category'),
(10, 'blog', 'comment'),
(11, 'blog', 'like'),
(8, 'blog', 'post'),
(9, 'blog', 'profile'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-02-10 17:15:32.982444'),
(2, 'auth', '0001_initial', '2025-02-10 17:15:33.335770'),
(3, 'admin', '0001_initial', '2025-02-10 17:15:33.424898'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-02-10 17:15:33.432312'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-02-10 17:15:33.440530'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-02-10 17:15:33.540241'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-02-10 17:15:33.584585'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-02-10 17:15:33.612580'),
(9, 'auth', '0004_alter_user_username_opts', '2025-02-10 17:15:33.630616'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-02-10 17:15:33.705089'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-02-10 17:15:33.715276'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-02-10 17:15:33.743937'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-02-10 17:15:33.793514'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-02-10 17:15:33.819534'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-02-10 17:15:33.840709'),
(16, 'auth', '0011_update_proxy_permissions', '2025-02-10 17:15:33.849594'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-02-10 17:15:33.868404'),
(18, 'blog', '0001_initial', '2025-02-10 17:15:33.977182'),
(19, 'blog', '0002_remove_post_author_remove_post_category_and_more', '2025-02-10 17:15:35.025943'),
(20, 'blog', '0003_post_updated_at', '2025-02-10 17:15:35.055624'),
(21, 'blog', '0004_post_author', '2025-02-10 17:15:35.138209'),
(22, 'blog', '0005_comment_like', '2025-02-10 17:15:35.368759'),
(23, 'sessions', '0001_initial', '2025-02-10 17:15:35.399220'),
(24, 'blog', '0006_remove_profile_profile_picture_alter_profile_bio', '2025-02-10 18:03:02.469786'),
(25, 'blog', '0007_profile_profile_picture', '2025-02-10 18:46:04.517937'),
(26, 'blog', '0008_post_image', '2025-02-10 22:10:02.614716'),
(27, 'blog', '0009_post_category_alter_category_name', '2025-02-11 09:40:06.903186');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('xrfiald8fydfqna3rpe9fe4l8wz798a5', '.eJxVjDEOAiEQRe9CbQgwLI6W9p6BDAzIqoFk2a2Md1eSLbT7-e_lvYSnbS1-62nxM4uzmMTh9wsUH6kOwHeqtyZjq-syBzkUudMur43T87K7f4FCvYysA0QbFOqkssls0ComwBim6CyccoQQjo4YVDSWNIKyhA4y6u9gFu8P02M3kw:1thYHM:wNdQZhbUr3PBlVya513pNNRzC-_QQFlHxWerCE4sk_w', '2025-02-24 18:13:08.928524'),
('y7tbcirlfedjcdg3g31bgr4rngfvb83a', '.eJxVjDEOwjAMRe-SGUVxUmjNyM4ZIsd2aAElUtNOiLtDpQ6w_vfef5lI6zLGtekcJzFn483hd0vEDy0bkDuVW7VcyzJPyW6K3Wmz1yr6vOzu38FIbfzWWTkJ8HBE8agJBvb9iZ067iVkHLrEPWlwCICAAQmQXOqy-MAdIZr3BwNdODs:1thqr4:XbOJCpd-mtSSPSMK_ERnGg_1n8MW4mNa7eR336oz708', '2025-02-25 14:03:14.961560');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_category_name_92eb1483_uniq` (`name`);

--
-- Indexes for table `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comment_parent_comment_id_26791b9a_fk_blog_comment_id` (`parent_comment_id`),
  ADD KEY `blog_comment_post_id_580e96ef_fk_blog_post_id` (`post_id`),
  ADD KEY `blog_comment_user_id_59a54155_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `blog_like`
--
ALTER TABLE `blog_like`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_like_post_id_user_id_82fa9e5e_uniq` (`post_id`,`user_id`),
  ADD KEY `blog_like_user_id_06356ade_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_post_author_id_dd7a8485_fk_auth_user_id` (`author_id`),
  ADD KEY `blog_post_category_id_c326dbf8_fk_blog_category_id` (`category_id`);

--
-- Indexes for table `blog_profile`
--
ALTER TABLE `blog_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blog_comment`
--
ALTER TABLE `blog_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `blog_like`
--
ALTER TABLE `blog_like`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `blog_profile`
--
ALTER TABLE `blog_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD CONSTRAINT `blog_comment_parent_comment_id_26791b9a_fk_blog_comment_id` FOREIGN KEY (`parent_comment_id`) REFERENCES `blog_comment` (`id`),
  ADD CONSTRAINT `blog_comment_post_id_580e96ef_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`),
  ADD CONSTRAINT `blog_comment_user_id_59a54155_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `blog_like`
--
ALTER TABLE `blog_like`
  ADD CONSTRAINT `blog_like_post_id_9038fd1f_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`),
  ADD CONSTRAINT `blog_like_user_id_06356ade_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD CONSTRAINT `blog_post_author_id_dd7a8485_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `blog_post_category_id_c326dbf8_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`);

--
-- Constraints for table `blog_profile`
--
ALTER TABLE `blog_profile`
  ADD CONSTRAINT `blog_profile_user_id_2bc46caa_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
