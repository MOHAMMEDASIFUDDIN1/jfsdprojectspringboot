<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
    // Get the existing feedback list or create a new one if it doesn't exist
    List<String> feedbackList = (List<String>) application.getAttribute("feedbackList");
    if (feedbackList == null) {
        feedbackList = new ArrayList<>();
        application.setAttribute("feedbackList", feedbackList);
    }

    // Retrieve the submitted feedback from the request
    String feedback = request.getParameter("feedback");

    if (feedback != null && !feedback.trim().isEmpty()) {
        // Add the new feedback to the list
        feedbackList.add(feedback);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Received</title>
    <link rel="stylesheet" href="css/style3.css">
    <style>
        body {
             margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background: url('/img/back11.jpg') no-repeat center center fixed;
    background-size: cover;
    color: #333;
        }

        .confirmation-container {
            max-width: 700px;
            top:100px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #4CAF50;
        }

        h2 {
            color: #333;
        }

        p {
            color: #666;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            background-color: #e1e1e1;
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: white;
            background-color: #333`;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #333;
        }
    </style>
</head>
<body>

    <!-- Display Confirmation Message -->
    <div class="confirmation-container">
        <p>feedback has been received and stored.</p>

        <!-- Display All Feedback -->
        <h2>All Feedback:</h2>
        <ul>
            <%
                // Display all stored feedback messages
                for (String storedFeedback : feedbackList) {
            %>
                <li><%= storedFeedback %></li>
            <%
                }
            %>
        </ul>
        
        <a href="artistdashboard.jsp">Go Back to Home</a>
    </div>

</body>
</html>
