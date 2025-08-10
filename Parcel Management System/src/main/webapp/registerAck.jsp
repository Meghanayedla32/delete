<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Registration Successful</title></head>
<body>
    <h3 style="color:green;">${message}</h3>
    <p>Customer UserID: ${userID}</p>
    <p>Customer Name: ${name}</p>
    <p>Email: ${email}</p>
    <a href="login.jsp">Go to Login</a>
</body>
</html>
