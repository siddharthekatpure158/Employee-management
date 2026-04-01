<%@page import="com.springmvc.model.Employee"%>
<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Search Employee</title>

<style>
body {
    font-family: 'Segoe UI', sans-serif;
    background: #eef2f7;
    margin: 0;
}

.container {
    width: 450px;
    margin: 60px auto;
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #2a5298;
}

input {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border-radius: 8px;
    border: 1px solid #ccc;
}

button {
    width: 100%;
    padding: 12px;
    background: linear-gradient(90deg, #1e3c72, #2a5298);
    color: white;
    border: none;
    border-radius: 25px;
    cursor: pointer;
}

button:hover {
    transform: scale(1.03);
}

.message {
    margin-top: 20px;
    padding: 12px;
    border-radius: 8px;
    text-align: center;
    font-weight: bold;
}

.error {
    background:green;
    color:white;
}

/* Employee Card */
.emp-card {
    margin-top: 25px;
    border-radius: 12px;
    background: white;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    overflow: hidden;
}

.emp-header {
    background: linear-gradient(90deg, #1e3c72, #2a5298);
    color: white;
    padding: 15px 20px;
    display: flex;
    justify-content: space-between;
}

.badge {
    background: #00c853;
    padding: 5px 12px;
    border-radius: 20px;
    font-size: 12px;
}

.emp-body {
    padding: 20px;
}

.row {
    display: flex;
    justify-content: space-between;
    padding: 10px 0;
    border-bottom: 1px solid #eee;
}

.row span {
    color: #555;
}

.row strong {
    color: #222;
}

.highlight {
    background: #f1f5ff;
    padding: 12px;
    border-radius: 8px;
    border: none;
    margin-top: 10px;
}
.error2{
background:red;
    color:white;
}
</style>

</head>
<body>

<jsp:include page="navbar.jsp" />

<%
    String msg = (String) request.getAttribute("msg");
    Employee emp = (Employee) request.getAttribute("emp");
    String msg2 = (String) request.getAttribute("msg2");
%>

<div class="container">

    <h2>Update Employee</h2>

    <form action="updateemp" method="post">
        <input type="number" name="id" placeholder="Enter Employee ID" required />
        <button type="submit">Search Employee</button>
    </form>

    <% if (msg != null) { %>
    <div class="message error">
        <%= msg %>
    </div>
<%} %>

    <% if (emp != null) { %>

        <div class="emp-card">
            <div class="emp-header">
                <h3>Employee Details</h3>
                <span class="badge">ACTIVE</span>
            </div>

            <div class="emp-body">
            
            <form action="updateemp2" method="post">
            
            <input type="number" name="id" placeholder="Enter Employee ID" value=<%=emp.getId() %> readonly="readonly" required />
        	<input type="text" name="name" placeholder="Enter Employee ID" value=<%=emp.getName() %> required />
        	<input type="text" name="email" placeholder="Enter Employee ID" value=<%=emp.getEmail() %> required />
        	<input type="text" name="contact" placeholder="Enter Employee ID" value=<%=emp.getContact() %> required />
        	<input type="text" name="role" placeholder="Enter Employee ID" value=<%=emp.getRole() %> required />
        	<input type="number" name="salary" placeholder="Enter Employee ID" value=<%=emp.getSalary() %> required />
       		<button type="submit">Update Employee</button>
       		
    		</form>
                <% if (msg2 != null) { %>
    <div class="message error">
        <%= msg2 %>
    </div>
<%} %>

            </div>
        </div>

    <% } %>

</div>

</body>
</html>