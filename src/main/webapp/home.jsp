<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Art Gallery Dashboard</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <!-- External CSS -->
    <link rel="stylesheet" href="css/styles1.css">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            background-image: url('img/back3.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .hero-content {
            background-color: rgba(255, 255, 255, 0.6); /* Semi-transparent white background */
            backdrop-filter: blur(1.0px); /* Apply the blur effect */
            padding: 20px;
            border-radius: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.8);
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        footer {
            margin-top: 20px;
            text-align: center;
        }

        /* Profile Icon Styling */
        .nav-links {
            display: flex;
            align-items: center;
            list-style: none;
        }

        .nav-links li {
            margin: 0 10px;
        }

        .profile-icon {
            display: flex;
            align-items: center;
            gap: 5px;
            text-decoration: none;
            color: #000;
        }

        .profile-icon i {
            font-size: 20px;
        }

        /* Logout Button Styling */
        .logout-button {
            background-color: #ff4d4d;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
        }

        .logout-button:hover {
            background-color: #ff1a1a;
        }
    </style>
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="logo">
                <h1>Art Gallery</h1>
            </div>
            <ul class="nav-links">
                <li><a href="artworks.html">Artworks</a></li>
                <li><a href="categories.html">Categories</a></li> 
                <li>
                    <!-- Profile Icon Link -->
                    <a href="profile.jsp" class="profile-icon">
                        <i class="fas fa-user-circle"></i> Profile
                    </a>
                </li>
                <li>
                    <!-- Logout Button Link -->
                    <a href="login.jsp" class="logout-button">Logout</a>
                </li>
            </ul>
        </nav>
    </header>

    <section class="hero">
        <div class="hero-content">
            <h2>Discover and Shop Beautiful Artworks</h2>
            <p>Explore a curated selection of stunning artworks from talented artists around the world.</p>
            <a href="shop.html" class="btn btn-primary">Shop Now</a>
        </div>
    </section>

    <footer>
        <div class="footer-content">
            <p>&copy; 2024 Art Gallery Online. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Smooth Scroll JavaScript -->
    <script>
        document.querySelectorAll('a[href^="gallary.html"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>
