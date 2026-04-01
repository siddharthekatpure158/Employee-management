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

/* NAVBAR */
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
    box-shadow: 0 2px 10px rgba(0,0,0,0.15);
}

/* LOGO */
.logo {
    font-size: 20px;
    font-weight: 600;
    letter-spacing: 0.5px;
}

/* LINKS */
.nav-links {
    display: flex;
    align-items: center;
    gap: 25px;
}

/* LINK STYLE */
.nav-links a {
    text-decoration: none;
    color: white;
    font-size: 15px;
    padding: 8px 14px;
    border-radius: 6px;
    transition: background 0.25s ease;
}

/* HOVER EFFECT */
.nav-links a:hover {
    background-color: rgba(255, 255, 255, 0.15);
}

/* ACTIVE LINK */
.nav-links a.active {
    background-color: white;
    color: #1e3c72;
    font-weight: 500;
}

/* RESPONSIVE */
@media(max-width: 768px) {
    .navbar {
        flex-direction: column;
        height: auto;
        padding: 15px;
    }

    .nav-links {
        margin-top: 10px;
        flex-wrap: wrap;
        justify-content: center;
        gap: 10px;
    }
}

</style>
</head>

<body>

<div class="navbar">
    <div class="logo">Employee Management</div>
    
    <div class="nav-links">
        <a href="home" class="active">Home</a>
        <a href="add">Add</a>
        <a href="search">Search</a>
        <a href="delete">Delete</a>
        <a href="update">Update</a>
    </div>
</div>

</body>
</html>