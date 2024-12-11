<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile - Art Gallery</title>
    <link rel="stylesheet" href="css/st.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('/img/back13.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        }

        .navbar .logo h1 {
            margin: 0;
            color: white;
        }

        .editButton {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: #333;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .editButton:hover {
            background-color: #555;
            transform: scale(1.05);
        }

        .profileContainer {
            max-width: 700px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        .profileContainer h2 {
            color: #333;
        }

        .profileAvatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin: 0 auto 20px;
            background: url('/img/222.jpg') no-repeat center;
            background-size: cover;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        }

        .profileDetails p {
            font-size: 16px;
            margin: 10px 0;
        }

        .orderDetails {
            margin-top: 20px;
            padding: 20px;
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.2);
        }

        .orderDetails ul {
            list-style: none;
            padding: 0;
        }

        .orderDetails ul li {
            background-color: #333;
            color: white;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        }

        .backButton {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .backButton:hover {
            background-color: #555;
            transform: scale(1.05);
        }

        @media (max-width: 768px) {
            .profileContainer {
                margin: 20px;
                padding: 15px;
            }

            .orderDetails ul li {
                padding: 8px;
                font-size: 14px;
            }

            .backButton {
                font-size: 14px;
                padding: 8px 15px;
            }
        }
    </style>
</head>
<body>
<header>
    <nav class="navbar">
        <div class="logo">
            <h1>Art Gallery</h1>
        </div>
    </nav>
</header>

<div class="profileContainer">
    <button class="editButton" onclick="editProfile()">Edit Profile</button>

    <h2>Welcome to Your Profile</h2>
    <div class="profileAvatar"></div>
    <div class="profileDetails">
        <p><strong>Username:</strong> <span id="username"></span></p>
        <p><strong>Role:</strong> <span id="role"></span></p>
    </div>

    <div class="orderDetails" id="orderDetails">
        <h3>Your Orders:</h3>
        <div id="orderList"></div>
    </div>

    <button class="backButton" onclick="goBack()">Back to Previous Page</button>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const userInfo = JSON.parse(sessionStorage.getItem("userInfo"));
        if (userInfo) {
            document.getElementById("username").textContent = userInfo.username;
            document.getElementById("role").textContent = userInfo.role;

            fetchUserOrders(userInfo.username);
        } else {
            location.replace("/login.jsp");
        }
    });

    function fetchUserOrders(username) {
        fetch(`/user/orders?username=${username}`)
            .then(response => response.json())
            .then(orders => {
                const orderList = document.getElementById("orderList");
                if (orders.length > 0) {
                    const orderHTML = orders.map(order => `
                        <li><strong>Order ID:</strong> ${order.orderId} | 
                            <strong>Art Title:</strong> ${order.artTitle} | 
                            <strong>Order Date:</strong> ${order.orderDate}
                        </li>
                    `).join("");
                    orderList.innerHTML = `<ul>${orderHTML}</ul>`;
                } else {
                    orderList.innerHTML = '<p>No orders found.</p>';
                }
            })
            .catch(error => {
                console.error('Error fetching orders:', error);
                document.getElementById("orderList").innerHTML = '<p>Failed to load orders. Please try again later.</p>';
            });
    }

    function goBack() {
        window.history.back();
    }

    function editProfile() {
        alert("Edit profile functionality is under development!");
    }
</script>

</body>
</html>
