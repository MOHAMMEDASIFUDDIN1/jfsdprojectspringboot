<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<header>
    <nav class="navbar">
        <div class="logo">
            <h1>Art Gallery</h1>
        </div>
    </nav>
</header>

<div class="loginWindow">
    <div class="loginHeader">Sign In</div>
    <div class="innerLoginWindow">
        <!-- Username Field -->
        <label for="username" style="padding:20px 0px 3px 0px">Username*</label>
        <input type="text" id="username" placeholder="Enter your username" required />

        <!-- Password Field -->
        <label for="password" style="padding:10px 0px 3px 0px">Password*</label>
        <input type="password" id="password" placeholder="Enter your password" required />

        <!-- Role Selection -->
        <label for="roleSelect" style="padding:10px 0px 3px 0px">Role*</label>
        <select id="roleSelect" required>
            <option value="">Select Role</option>
            <option value="customer">Customer</option>
            <option value="artist">Artist</option>
        </select>

        <!-- CAPTCHA Section -->
        <label for="captchaInput" style="padding:10px 0px 3px 0px">Enter CAPTCHA*</label>
        <img id="captchaImage" src="data:image/png;base64," alt="CAPTCHA" />
        <input type="text" id="captchaInput" placeholder="Enter CAPTCHA here" required />

        <!-- Forgot Password Link -->
        <div style="padding:10px 0px 10px 0px;text-align:right">
            Forgot <a href="/forgotpassword" style="cursor:pointer;color:blue">Password</a>
        </div>

        <!-- Sign In Button -->
        <button class="signinBtn" onclick="signin()">Sign In</button>

        <!-- Acknowledgement Section -->
        <div id="ack" style="width:100%;height:17px;color:red;"></div>

        <!-- Signup Section -->
        <div style="width:100%;height:17px;text-align:center;margin-top:10px">
            Don't have an account? <a href="/signup" class="signUp">SIGN UP NOW</a>
        </div>
    </div>
</div>

<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript">
    // Function to fetch CAPTCHA from the server and display it
    function loadCaptcha() {
        fetch("/captcha")
            .then(response => response.json())
            .then(data => {
                document.getElementById("captchaImage").src = "data:image/png;base64," + data.captcha;
                sessionStorage.setItem("captchaText", btoa(data.captchaText)); // Store CAPTCHA securely in base64
            });
    }

    // Sign-in function with CAPTCHA validation
    function signin() {
        const username = document.getElementById("username").value.trim();
        const password = document.getElementById("password").value.trim();
        const enteredCaptcha = document.getElementById("captchaInput").value;
        const correctCaptcha = atob(sessionStorage.getItem("captchaText"));
        const selectedRole = document.getElementById("roleSelect").value;

        // Validate inputs
        if (!username || !password) {
            document.getElementById("ack").innerHTML = "Username and Password are required!";
            return;
        }

        if (!selectedRole) {
            document.getElementById("ack").innerHTML = "Please select a role!";
            return;
        }

        if (enteredCaptcha !== correctCaptcha) {
            document.getElementById("ack").innerHTML = "Incorrect CAPTCHA!";
            return;
        }

        // Prepare login data
        const data = JSON.stringify({
            username: username,
            password: password,
            role: selectedRole
        });

        const url = "http://localhost:8081/user/login";
        callApi("POST", url, data, signinHandler);
    }

    // Handle Sign-in API Response
    function signinHandler(res) {
        const selectedRole = document.getElementById("roleSelect").value;
        if (res === "401") {  // Invalid credentials
            document.getElementById("ack").innerHTML = "Invalid Credentials!";
        } else if (res === "200") {  // Successful login
            const userInfo = {
                username: document.getElementById("username").value,
                role: selectedRole
            };
            sessionStorage.setItem("userInfo", JSON.stringify(userInfo)); // Store user info

            if (selectedRole === "customer") {
                location.replace("/home.jsp");
            } else if (selectedRole === "artist") {
                location.replace("/artistdashboard.jsp");
            }
        } else {
            document.getElementById("ack").innerHTML = "Unexpected response. Please try again.";
        }
    }

    // Load CAPTCHA when the page loads
    document.addEventListener("DOMContentLoaded", loadCaptcha);
</script>
</body>
</html>
