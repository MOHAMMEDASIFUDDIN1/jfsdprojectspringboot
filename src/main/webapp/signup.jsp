<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SignUp</title>
    <link rel="stylesheet" type="text/css" href="css/sstyle.css">
    <style>
        /* Inline CSS for demonstration purposes */
        .invalid {
            border-color: red; /* Red border for invalid input */
            background-color: #ffe6e6; /* Optional: light red background for better visibility */
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
    <div class="signup-container">
        <h2>Sign Up</h2>
        <div class="form-group">
            <label for="T1">Username*</label>
            <input type="text" id="T1" />
        </div>
        <div class="form-group">
            <label for="T2">Password*</label>
            <input type="password" id="T2" />
        </div>
        <div class="form-group">
            <label for="T3">Re-type Password*</label>
            <input type="password" id="T3" />
        </div>
        <div class="form-group">
            <label for="T4">First Name*</label>
            <input type="text" id="T4" />
        </div>
        <div class="form-group">
            <label for="T5">Last Name*</label>
            <input type="text" id="T5" />
        </div>
        <div class="form-group">
            <label for="T6">Mobile No.*</label>
            <input type="text" id="T6" />
        </div>
        <div class="form-group">
            <label for="T7">Email ID*</label>
            <input type="text" id="T7" />
        </div>
        <div class="form-group">
            <label for="role">Role*</label>
            <select id="role">
                <option value="customer">Customer</option>
                <option value="artist">Artist</option>
            </select>
        </div>
        <div class="form-group">
            <button onclick="save()">Save</button>
        </div>
        <div class="form-group">
            <label id="ack"></label>
        </div>
    </div>

    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
    function save() {
        var username = document.getElementById("T1").value;
        var password = document.getElementById("T2").value;
        var retypePassword = document.getElementById("T3").value; // Variable for re-type password
        var firstname = document.getElementById("T4").value;
        var lastname = document.getElementById("T5").value;
        var mobileno = document.getElementById("T6").value;
        var emailid = document.getElementById("T7").value; // Updated ID for email
        var role = document.getElementById("role").value; // Get the selected role

        // Ensure none of the fields are empty
        if (!username || !password || !retypePassword || !firstname || !lastname || !mobileno || !emailid || !role) {
            alert("Please fill in all required fields.");
            return;
        }

        // Get the re-type password input field
        var retypeInput = document.getElementById("T3");

        // Check if passwords match
        if (password !== retypePassword) {
            alert("Passwords do not match. Please try again.");
            retypeInput.classList.add('invalid'); // Add red border class
            return;
        } else {
            retypeInput.classList.remove('invalid'); // Remove red border if passwords match
        }

        // Constructing the data object
        var data = JSON.stringify({
            username: username,
            password: password,
            firstname: firstname,
            lastname: lastname,
            mobileno: mobileno,
            emailid: emailid,
            role: role // Add the role to the data
        });

        var url = "http://localhost:8081/user/signup"; // Endpoint for signup

        callApi("POST", url, data, getResponse);
    }
    </script>
</body>
</html>
