<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parcel Management System</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        * {
            box-sizing: border-box;
        }
        body{
            font-family: Arial, sans-serif;
            background-color: #eef2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
    </style>
    <script src="js/validation.js"></script>
</head>
<body>
	<div class="container">
        <h2>Login</h2>

        <c:if test="${not empty error}">
            <div style="color:red;">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/LoginServelet" method="post" onsubmit="return validateLogin();">
            <label for="role">Select Role:</label>
            <select id="role" name="role" required>
                <option value="customer">Customer</option>
                <option value="officer">Officer</option>
            </select>

            <label for="username">User Name:</label>
            <input type="text" id="username" name="username" minlength="5" maxlength="20" required />
            <div id="userIdError" class="error"></div>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" maxlength="30" required />
            <div id="passwordError" class="error"></div>

            <button type="submit" value="Login" >Login</button>
        </form>

        <p>Don't have an account? <a href="register.jsp">Register</a></p>
    </div>


</body>
</html> 

<!--    <h3>Login</h3>
    
    <c:if test="${not empty error}">
        <div style="color:red;">${error}</div>
    </c:if>

    <form action="LoginServelet" method="post" onsubmit="return validateLogin();">
        Username: <input type="text" name="username" minlength="5" maxlength="20" required /><br/>
        Password: <input type="password" name="password" maxlength="30" required /><br/>
        Role: 
        <select name="role" required>
            <option value="customer">Customer</option>
            <option value="officer">Officer</option>
        </select><br/>
        <input type="submit" value="Login" />
    </form>
    <p>Don't have an account? <a href="register.jsp">Register</a></p>
</body>
</html>  -->
