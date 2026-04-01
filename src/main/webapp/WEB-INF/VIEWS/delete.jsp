<!DOCTYPE html>
<%@page import="com.springmvc.model.Employee"%>
<%@ page language="java" %>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Employee Management</title>

<style>

/* RESET */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* GLOBAL */
body {
    font-family: 'Segoe UI', Roboto, sans-serif;
    background: #f9fafb;
    color: #111827;
    line-height: 1.6;
}

/* NAVBAR */
.navbar {
    background: linear-gradient(135deg, #4f46e5, #6366f1);
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 40px;
    flex-wrap: wrap;
    color: white;
    box-shadow: 0 4px 20px rgba(0,0,0,0.15);
}

.navbar a {
    color: white;
    text-decoration: none;
    font-size: 15px;
    font-weight: 500;
    margin: 5px 10px;
    padding: 8px 14px;
    border-radius: 8px;
    transition: 0.3s;
}

.navbar a:hover {
    background: rgba(255,255,255,0.2);
}

.navbar a.active {
    background: white;
    color: #4f46e5;
}

.navbar-brand {
    font-size: 22px;
    font-weight: bold;
}

/* CONTAINER */
.container {
    max-width: 1100px;
    margin: 40px auto;
    padding: 20px;
}

/* FORM CARD */
.form-section {
    background: rgba(255,255,255,0.8);
    backdrop-filter: blur(10px);
    padding: 30px;
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.08);
    margin-bottom: 30px;
    text-align: center;
}

.form-section h2 {
    color: #4f46e5;
    margin-bottom: 20px;
}

/* FORM GROUP */
.form-group {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 15px;
    flex-wrap: wrap;
    margin-bottom: 20px;
}

.form-group label {
    font-weight: 600;
}

.form-group input[type="text"] {
    padding: 12px;
    border: 1px solid #e5e7eb;
    border-radius: 8px;
    width: 260px;
    transition: 0.3s;
}

.form-group input:focus {
    border-color: #4f46e5;
    box-shadow: 0 0 0 3px rgba(79,70,229,0.2);
    outline: none;
}

/* BUTTON */
.btn {
    padding: 12px 28px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 15px;
    font-weight: 600;
    transition: 0.3s;
}

.btn-remove {
    background: linear-gradient(135deg, #ef4444, #dc2626);
    color: white;
}

.btn-remove:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(239,68,68,0.4);
}

/* MESSAGE */
.message {
    text-align: center;
    padding: 14px;
    border-radius: 8px;
    margin: 20px 0;
    font-weight: 600;
}

.message.success {
    background: #dcfce7;
    color: #166534;
}

.message.error {
    background: #fee2e2;
    color: #991b1b;
}

/* TABLE */
.table-heading {
    text-align: center;
    color: #4f46e5;
    margin: 30px 0 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    border-radius: 16px;
    overflow: hidden;
    background: white;
    box-shadow: 0 10px 25px rgba(0,0,0,0.08);
}

thead {
    background: linear-gradient(135deg, #4f46e5, #6366f1);
    color: white;
}

thead th {
    padding: 14px;
    text-align: left;
    font-weight: 600;
}

tbody td {
    padding: 14px;
    border-bottom: 1px solid #f3f4f6;
}

tbody tr {
    transition: 0.2s;
}

tbody tr:hover {
    background: #f1f5ff;
    transform: scale(1.01);
}

/* MOBILE */
@media (max-width: 768px) {

    .navbar {
        flex-direction: column;
        align-items: flex-start;
    }

    .form-group {
        flex-direction: column;
        align-items: stretch;
    }

    .form-group input {
        width: 100%;
    }

    table, thead, tbody, th, td, tr {
        display: block;
    }

    thead {
        display: none;
    }

    tbody tr {
        margin-bottom: 15px;
        padding: 12px;
        border-radius: 12px;
        background: white;
    }

    tbody td {
        padding: 10px;
        text-align: right;
        position: relative;
    }

    tbody td::before {
        content: attr(data-label);
        position: absolute;
        left: 10px;
        font-weight: bold;
        color: #6b7280;
    }
}

</style>
</head>

<body>
<%
String msg=(String)request.getAttribute("msg");
String msg2=(String)request.getAttribute("msg2");
List<Employee> emps=(List<Employee>)request.getAttribute("emps");
%>


    <jsp:include page="navbar.jsp"/>

    <div class="container">

        <!-- FORM -->
        <div class="form-section">
            <h2>Remove Employee Record</h2>
            <form action="./deleteemp" method="post">
                <div class="form-group">
                    <label for="id">Employee ID:</label>
                    <input type="text" id="id" name="id" placeholder="Enter ID to remove" required>
                </div>
                <input type="submit" value="Remove" class="btn btn-remove">
            </form>
        </div>

         <% if(msg2 != null) { %>
        <div class="message success">
            <%= msg2 %>
        </div>
    <% } %>

		<% if(msg != null) { %>       
        <h2 class="table-heading"><%=msg %></h2>
		<% } %>
		
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Designation</th>
                    <th>Salary</th>
                </tr>
            </thead>

            <tbody>
<%
if(emps != null){
    for(Employee e : emps){
%>
    <tr>
        <td data-label="Id"><%= e.getId() %></td>
        <td data-label="Name"><%= e.getName() %></td>
        <td data-label="Email"><%= e.getEmail() %></td>
        <td data-label="Contact"><%= e.getContact() %></td>
        <td data-label="Designation"><%= e.getRole() %></td>
        <td data-label="Salary"><%= e.getSalary() %></td>
    </tr>
<%
    }
}
%>
</tbody>
        </table>

    </div>

</body>
</html>