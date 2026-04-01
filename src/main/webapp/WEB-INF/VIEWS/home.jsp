<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Employee Management System</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', sans-serif;
    background: linear-gradient(-45deg, #1e3c72, #2a5298, #4facfe, #00c6ff);
    background-size: 400% 400%;
    animation: gradientBG 10s ease infinite;
    color: white;
}

/* BACKGROUND ANIMATION */
@keyframes gradientBG {
    0% {background-position: 0% 50%;}
    50% {background-position: 100% 50%;}
    100% {background-position: 0% 50%;}
}

/* NAVBAR SPACE */
.nav-space {
    height: 70px;
}

/* HERO */
.hero {
    height: 90vh;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    text-align: center;
}

.hero h1 {
    font-size: 52px;
    margin-bottom: 15px;
    animation: fadeSlide 1s ease;
}

.hero p {
    font-size: 18px;
    margin-bottom: 30px;
    opacity: 0.9;
}

/* BUTTON */
.btn {
    background: white;
    color: #1e3c72;
    padding: 14px 36px;
    border-radius: 40px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    transition: 0.3s;
    font-weight: 600;
}

.btn:hover {
    background: #f1f1f1;
    transform: translateY(-2px);
}

/* FEATURES */
.features {
    display: flex;
    justify-content: center;
    gap: 30px;
    padding: 60px;
    flex-wrap: wrap;
}

/* CARD */
.card {
    background: rgba(255,255,255,0.12);
    border-radius: 15px;
    padding: 30px;
    width: 260px;
    text-align: center;
    transition: 0.3s;
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255,255,255,0.2);
}

.card:hover {
    transform: translateY(-10px);
    background: rgba(255,255,255,0.2);
}

/* CARD TITLE */
.card h3 {
    margin-bottom: 10px;
    font-size: 20px;
}

/* CARD TEXT */
.card p {
    font-size: 14px;
    opacity: 0.85;
}

/* CARD BUTTON */
.card button {
    margin-top: 15px;
    padding: 10px 24px;
    border: none;
    border-radius: 25px;
    background: white;
    color: #1e3c72;
    cursor: pointer;
    font-weight: 500;
    transition: 0.3s;
}

.card button:hover {
    background: #e6e6e6;
}

/* ANIMATION */
@keyframes fadeSlide {
    from {
        opacity: 0;
        transform: translateY(-30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* RESPONSIVE */
@media(max-width: 900px) {
    .hero h1 {
        font-size: 34px;
    }

    .features {
        padding: 30px;
    }
}

</style>

</head>

<body>

<jsp:include page="navbar.jsp" />
<div class="nav-space"></div>

<!-- HERO -->
<div class="hero">
    <h1>Employee Management System</h1>
    <p>Manage employee records with a clean and efficient interface</p>

    <button class="btn" onclick="location.href='add'">
        Get Started
    </button>
</div>

<!-- FEATURES -->
<div class="features">

    <div class="card">
        <h3>Add Employee</h3>
        <p>Create new employee records</p>
        <button onclick="location.href='add'">Open</button>
    </div>

    <div class="card">
        <h3>Search Employee</h3>
        <p>Find employee by ID</p>
        <button onclick="location.href='search'">Open</button>
    </div>

    <div class="card">
        <h3>Delete Employee</h3>
        <p>Remove employee records</p>
        <button onclick="location.href='delete'">Open</button>
    </div>

    <div class="card">
        <h3>Update Employees</h3>
        <p>Display all employee data</p>
        <button onclick="location.href='update'">Open</button>
    </div>

</div>

</body>
</html>