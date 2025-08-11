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
    <style>
        body {
                background-color: #FFFEFE;
                display: block;
        }
        .navigation li a {
            color: black !important;
            text-decoration: none; 
        }

        .navigation li a:hover {
            color: #ff0000 !important; 
        }
        div.topbar {
            background-color: #ffcf79;
        }
        img{
            padding: 0%;
            vertical-align: middle;
            width: 100%;
            box-sizing: border-box;
        }
         
        main{   
            background-image: url('images/hero-header-bg.png');
            background-color: rgba(249, 250, 253, 0.145);
            display: block;
            unicode-bidi: isolate;
            box-sizing: border-box;

        }
    </style>
</head>

<body>
    <div class="topbar">
        <p class="welcome">Welcome Officer, <%= officerName %>!</p>
        <nav>
            <ul class="navigation">
                <li><a href="officer_home.jsp">Home</a></li>
		        <li><a href="tracking.jsp">Tracking</a></li>
		        <li><a href="delivery_status.jsp">Delivery Status</a></li>
		        <li><a href="pickup_schedule.jsp">Pickup Scheduling</a></li>
		        <li><a href="history_officer.jsp">Previous Booking</a></li>
		        <li><a href="LogoutServlet">Logout</a></li>
            </ul>
        </nav>
        
    </div>
    <div class="down">
        <main>
            <h2>Officer DashBoard</h2>
            <p>Select a service from the menu above to proceed.</p>
            <!--  <img src="images/hero.png" alt="illustration">-->
        </main>
    </div>
</body>
</html>
