<!DOCTYPE html>
<%@ page language="java" %>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>

<style>

/* RESET */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* BODY */
body {
    font-family: 'Inter', 'Segoe UI', sans-serif;
    min-height: 100vh;
    background: linear-gradient(135deg, #6366f1, #4f46e5);
    display: flex;
    justify-content: center;
    align-items: center;
}

/* CARD */
.signup-card {
    background: white;
    padding: 35px 30px;
    border-radius: 20px;
    width: 380px;
    box-shadow: 0 20px 50px rgba(0,0,0,0.2);
    text-align: center;
}

/* TITLE */
.signup-card h2 {
    margin-bottom: 20px;
    color: #4f46e5;
}

/* INPUT */
.input-group {
    margin-bottom: 15px;
    text-align: left;
}

.input-group label {
    font-size: 14px;
    font-weight: 600;
}

.input-group input {
    width: 100%;
    padding: 12px;
    margin-top: 5px;
    border-radius: 8px;
    border: 1px solid #ddd;
    transition: 0.3s;
}

.input-group input:focus {
    border-color: #4f46e5;
    outline: none;
    box-shadow: 0 0 0 3px rgba(79,70,229,0.2);
}

/* BUTTON */
.btn-signup {
    width: 100%;
    padding: 14px;
    border: none;
    border-radius: 10px;
    background: linear-gradient(135deg, #22c55e, #16a34a);
    color: white;
    font-weight: bold;
    cursor: pointer;
    margin-top: 10px;
    transition: 0.3s;
}

.btn-signup:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(34,197,94,0.3);
}

/* MESSAGE */
.message {
    margin-bottom: 15px;
    padding: 10px;
    border-radius: 8px;
    font-size: 14px;
}

.success {
    background: #dcfce7;
    color: #166534;
}

.error {
    background: #fee2e2;
    color: #991b1b;
}

/* LINK */
.login-link {
    margin-top: 15px;
    font-size: 14px;
}

.login-link a {
    color: #4f46e5;
    text-decoration: none;
    font-weight: 600;
}

</style>
</head>

<body>

<%
String msg = (String)request.getAttribute("msg");
%>

<div class="signup-card">

    <h2>Create Account</h2>

    <!-- MESSAGE -->
    <% if(msg != null) { %>
        <div class="message success"><%= msg %></div>
    <% } %>

    <!-- FORM -->
    <form action="./signup" method="post">

        <div class="input-group">
            <label>Full Name</label>
            <input type="text" name="name" placeholder="Enter your name" required>
        </div>

        <div class="input-group">
            <label>Email</label>
            <input type="text" name="email" placeholder="Enter your email" required>
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter password" required>
        </div>

        <div class="input-group">
            <label>Confirm Password</label>
            <input type="password" name="confirmPassword" placeholder="Confirm password" required>
        </div>

        <button type="submit" class="btn-signup">Sign Up</button>

    </form>

    <div class="login-link">
        Already have an account? <a href="login">Login</a>
    </div>

</div>

</body>
</html>