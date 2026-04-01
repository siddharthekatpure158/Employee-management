<!DOCTYPE html>
<%@ page language="java" %>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

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
    height: 100vh;
    background: linear-gradient(135deg, #4f46e5, #6366f1);
    display: flex;
    justify-content: center;
    align-items: center;
}

/* CARD */
.login-card {
    background: white;
    padding: 40px 30px;
    border-radius: 20px;
    width: 350px;
    box-shadow: 0 20px 50px rgba(0,0,0,0.2);
    text-align: center;
}

/* TITLE */
.login-card h2 {
    margin-bottom: 25px;
    color: #4f46e5;
}

/* INPUT */
.input-group {
    margin-bottom: 18px;
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
.btn-login {
    width: 100%;
    padding: 14px;
    border: none;
    border-radius: 10px;
    background: linear-gradient(135deg, #4f46e5, #6366f1);
    color: white;
    font-weight: bold;
    cursor: pointer;
    margin-top: 10px;
    transition: 0.3s;
}

.btn-login:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(79,70,229,0.3);
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

</style>
</head>

<body>

<%
String msg = (String)request.getAttribute("msg");
%>

<div class="login-card">

    <h2>Login</h2>

    <!-- MESSAGE -->
    <% if(msg != null) { %>
        <div class="message error"><%= msg %></div>
    <% } %>

    <!-- FORM -->
    <form action="./login" method="post">

        <div class="input-group">
            <label>Email</label>
            <input type="text" name="email" placeholder="Enter your email" required>
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" placeholder="Enter your password" required>
        </div>

        <button type="submit" class="btn-login">Login</button>

    </form>

</div>

</body>
</html>