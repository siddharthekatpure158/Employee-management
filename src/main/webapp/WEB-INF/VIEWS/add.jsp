<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Add Employee</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background-color: #f4f6f9;
}

/* CENTER CONTAINER */
.wrapper {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

/* FORM BOX */
.container {
    background: #ffffff;
    padding: 35px;
    border-radius: 10px;
    width: 400px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}

/* TITLE */
.container h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #1e3c72;
}

/* INPUT GROUP */
.input-group {
    margin-bottom: 18px;
}

/* INPUT FIELD */
.input-group input {
    width: 100%;
    padding: 11px 12px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 14px;
    transition: border 0.2s;
}

/* FOCUS EFFECT */
.input-group input:focus {
    border-color: #1e3c72;
    outline: none;
}

/* BUTTON */
.btn {
    width: 100%;
    padding: 12px;
    background-color: #1e3c72;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 15px;
    cursor: pointer;
    transition: background 0.25s ease;
}

.btn:hover {
    background-color: #16325c;
}

/* BACK LINK */
.back-btn {
    margin-top: 12px;
    text-align: center;
}

.back-btn a {
    text-decoration: none;
    color: #1e3c72;
    font-size: 14px;
}

.back-btn a:hover {
    text-decoration: underline;
}

</style>

</head>

<body>

<% String msg=(String)request.getAttribute("msg"); %>>

<jsp:include page="navbar.jsp" />

<div class="wrapper">

    <div class="container">
        <h2>Add Employee</h2>

        <form action="addEmployee" method="post">

            <div class="input-group">
                <input type="text" name="name" placeholder="Employee Name" required>
            </div>

            <div class="input-group">
                <input type="email" name="email" placeholder="Email Address" required>
            </div>

            <div class="input-group">
                <input type="text" name="contact" placeholder="Contact Number" required>
            </div>

            <div class="input-group">
                <input type="text" name="role" placeholder="Job Role" required>
            </div>

            <div class="input-group">
                <input type="number" name="salary" placeholder="Salary" required>
            </div>

            <button type="submit" class="btn">Add Employee</button>
            <br><br>
            <%if(msg!=null){ %>
            <h2><%=msg %></h2>
            <%		} %>
            

        </form>

        <div class="back-btn">
            <a href="home">Back to Home</a>
        </div>
    </div>

</div>

</body>
</html>