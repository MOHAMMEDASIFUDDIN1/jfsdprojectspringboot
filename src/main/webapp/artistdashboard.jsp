<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Artist Dashboard</title>
    <link rel="stylesheet" href="css/artistdashboard.css">
</head>
<body>
<header>
    <nav class="navbar">
        <div class="logo">
            <h1>Artist Dashboard</h1>
        </div>
        <ul class="nav-links">
            <li><a href="/home.jsp">Home</a></li>
            <li><a href="/profile.jsp">Profile</a></li>
            <li><a href="/login.jsp">Logout</a></li>
        </ul>
    </nav>
</header>
<main>
    <section class="dashboard">
        <% 
            // Use the implicit session to retrieve the artist name safely
            String artistName = "Artist"; // Default name
            if (session != null && session.getAttribute("artistName") != null) {
                artistName = (String) session.getAttribute("artistName");
            }
        %>
        <h2>Welcome, <%= artistName %>!</h2>
        <p>Manage your artwork, view your sales, and connect with customers.</p>

        <div class="dashboard-options">
            <div class="option">
                <h3>Upload Artwork</h3>
                <a href="/upload.jsp" class="button">Upload Now</a>
            </div>
            <div class="option">
                <h3>View Sales</h3>
                <a href="/sales.jsp" class="button">View Details</a>
            </div>
            <div class="option">
                <h3>Customer Messages</h3>
                <a href="/message.jsp" class="button">Check Messages</a>
            </div>
            <div class="option">
                <h3>Manage Profile</h3>
                <a href="/profile.jsp" class="button">Edit Profile</a>
            </div>
        </div>
    </section>
</main>

</body>
</html>
