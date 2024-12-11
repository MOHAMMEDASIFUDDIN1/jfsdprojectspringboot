<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload Artwork</title>
    <link rel="stylesheet" href="css/upload.css">
</head>
<body>
<header>
    <nav class="navbar">
        <div class="logo">
            <h1>Upload Artwork</h1>
        </div>
        <ul class="nav-links">
            <li><a href="/artistdashboard.jsp">Dashboard</a></li>
            <li><a href="/shop.html">Shop</a></li>
            <li><a href="/logout">Logout</a></li>
        </ul>
    </nav>
</header>
<main>
    <section class="upload-section">
        <h2>Upload Your Artwork</h2>
        <form action="/uploadArtwork" method="post" enctype="multipart/form-data">
            <label for="artTitle">Artwork Title:</label>
            <input type="text" id="artTitle" name="artTitle" placeholder="Enter artwork title" required>

            <label for="artPrice">Price (USD):</label>
            <input type="number" id="artPrice" name="artPrice" placeholder="Enter price" required>

            <label for="artImage">Upload Image:</label>
            <input type="file" id="artImage" name="artImage" accept="image/*" required>

            <button type="submit" class="upload-btn">Upload</button>
        </form>
    </section>
</main>
<footer>
    <p>&copy; 2024 Art Gallery. All rights reserved.</p>
</footer>
</body>
</html>
