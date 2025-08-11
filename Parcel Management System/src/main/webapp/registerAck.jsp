<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Registration Successful</title>
<style>
    * {
        box-sizing: border-box;
    }
    body {
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center; /* Horizontal center */
        align-items: center;    /* Vertical center */
        height: 100vh;
        margin: 0;
        background-color: white;
    }
    .container {
        text-align: center; /* Center text */
        padding: 20px;
        background: white;
        max-width: 500px;
        width: 100%;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
</style>
</head>
<body>
    <div class="container">
        <h3 style="color:green;">${message}</h3>
        <p>Customer UserID: ${userID}</p>
        <p>Customer Name: ${name}</p>
        <p>Email: ${email}</p>
        <a href="login.jsp">Go to Login</a>
    </div>
</body>
</html>
