<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
    // Get the existing order list or create a new one if it doesn't exist
    List<String> orders = (List<String>) application.getAttribute("orders");
    if (orders == null) {
        orders = new ArrayList<>();
        application.setAttribute("orders", orders);
    }

    // Process the submitted orderId
    String orderId = request.getParameter("orderId");

    if (orderId != null) {
        // Add the new order to the list
        orders.add("Order ID: " + orderId);
    }

    // Handle "Clear History" request
    String clearHistory = request.getParameter("clearHistory");
    if ("true".equals(clearHistory)) {
        // Clear the orders list
        orders.clear();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sales Records</title>
    <link rel="stylesheet" href="css/sales.css">
</head>
<body>
    <h1>Sales Records</h1>

    <!-- Display all recorded orders -->
    <h2>Order List:</h2>
    <ul>
        <%
            if (orders.isEmpty()) {
        %>
            <li>No orders placed yet.</li>
        <%
            } else {
                // Display the orders stored in the application scope
                for (String order : orders) {
        %>
            <li><%= order %></li>
        <%
                }
            }
        %>
    </ul>

    <!-- Clear history button (this will reload the page and clear the orders list) -->
    <form action="sales.jsp" method="get">
        <input type="hidden" name="clearHistory" value="true">
        <button type="submit" style="background-color: #f44336; color: white; padding: 10px 20px; border: none; border-radius: 5px;">Clear Order History</button>
    </form>

    <br>
    <a href="artistdashboard.jsp">Go Back</a>
</body>
</html>
