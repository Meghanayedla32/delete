<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String customerName = (String) session.getAttribute("username");
    if (customerName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Home - Parcel Management System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h2>Welcome, <%= customerName %>!</h2>
    <nav>
        <ul>
            <li><a href="bookParcel.jsp">Book Parcel</a></li>
            <li><a href="trackParcel.jsp">Track Parcel</a></li>
            <li><a href="bookingHistory.jsp">Booking History</a></li>
            <li><a href="support.jsp">Support</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </nav>
</body>
</html>
