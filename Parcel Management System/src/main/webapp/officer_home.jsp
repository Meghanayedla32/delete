<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String officerName = (String) session.getAttribute("username");
    if (officerName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Officer Home - Parcel Management System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h2>Welcome Officer, <%= officerName %>!</h2>
    <nav>
        <ul>
            <li><a href="viewBookings.jsp">View Bookings</a></li>
            <li><a href="updateStatus.jsp">Update Delivery Status</a></li>
            <li><a href="manageCustomers.jsp">Manage Customers</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </nav>
</body>
</html>
