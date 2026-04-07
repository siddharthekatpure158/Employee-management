<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
body {
    font-family: 'Segoe UI', Arial, sans-serif;
}
.navbar {
    position: fixed;
    top: 0;
    width: 100%;
    height: 65px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 60px;
    background-color: #1e3c72;
    color: white;
}
.logo {
    font-size: 20px;
    font-weight: 600;
}
.nav-links {
    display: flex;
    gap: 25px;
}
.nav-links a {
    text-decoration: none;
    color: white;
    padding: 8px 14px;
    border-radius: 6px;
}
.nav-links a:hover {
    background-color: rgba(255,255,255,0.2);
}
</style>
</head>

<body>

<div class="navbar">
    <div class="logo">Employee Management</div>
    
    <div class="nav-links">
        <a href="home">Home</a>
        <a href="add">Add</a>
        <a href="search">Search</a>
        <a href="delete">Delete</a>
        <a href="update">Update</a>
        <a href="logout">Logout</a>
    </div>
</div>

</body>
</html>