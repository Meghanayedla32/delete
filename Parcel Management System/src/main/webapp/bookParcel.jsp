<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.PMS.util.DBUtil" %>
<%
    String username = (String) session.getAttribute("username");
	String senderName = "", senderEmail = "", senderMobile = "", senderAddress = "";
    if(username != null){
        try(Connection conn = DBUtil.getConnection()){
        	PreparedStatement ps = conn.prepareStatement("SELECT name, email, country_code, mobile, address FROM customers WHERE username=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                senderName = rs.getString("name");
                senderEmail = rs.getString("email");
                senderMobile = rs.getString("country_code") + " " + rs.getString("mobile");
                senderAddress = rs.getString("address");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Parcel Booking</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        nav ul li a{
            color: black !important;
        }
        .check{
            padding: 7px;
            text-align: left;
            width: auto;
            margin-left: 0;
        }
        #insurance{
            padding: 7px;
            text-align: left;
            width: auto;
            margin-left: 0;
        }
        #tracking{
            padding: 7px;
            text-align: left;
            width: auto;
            margin-left: 0;
            display: inline;
        }
    </style>
    <script>
    function calculateCost() {
        let sizeCost = parseInt(document.getElementById("parcelSize").value) || 0;
        let speedCost = parseInt(document.getElementById("deliverySpeed").value) || 0;
        let packagingCost = parseInt(document.getElementById("packagingPref").value) || 0;
        let codExtra = (document.querySelector('input[name="paymentMethod"]:checked')?.value === "COD") ? 20 : 0;
        let total = sizeCost + speedCost + packagingCost + codExtra;
        document.getElementById("serviceCost").value = total;
    }
</script>
</head>
<body>

	<div class="topbar">
        <p class="welcome">Welcome Customer, <%= username %>!</p>
        <nav>
            <ul>
                <li><a href="customer_home.jsp">Home</a></li>
                <li><a href="bookParcel.jsp">Booking Service</a></li>
                <li><a href="tracking.jsp">Tracking</a></li>
                <li><a href="history.jsp">Previous Booking</a></li>
                <li><a href="support.jsp">Contact Support</a></li>
                <li><a href="LogoutServlet">Logout</a></li>
            </ul>
        </nav>
    </div>
<main>
<form action="BookingServlet" method="post">
	
	<fieldset>
	    <legend>Sender Information</legend>
	    <label for="senderName">Name</label>
	    <input type="text" id="senderName" name="senderName" value="<%= senderName %>" readonly>
	
	    <label for="senderAddress">Address</label>
	    <textarea id="senderAddress" name="senderAddress" readonly><%= senderAddress %></textarea>
	    
	    <label for="senderEmail">Email</label>
	    <input id="senderEmail" name="senderEmail" value="<%= senderEmail %>" readonly>
	
	    <label for="senderContact">Contact</label>
	    <input type="text" id="senderContact" name="senderMobile" value="<%= senderMobile %>" readonly>
	</fieldset>

	<fieldset>
	    <legend>Receiver Information</legend>
	    <label for="receiverName">Name</label>
	    <input type="text" id="receiverName" name="receiverName" required>
	
	    <label for="receiverAddress">Address</label>
	    <textarea id="receiverAddress" name="receiverAddress" required></textarea>
	
	    <label for="receiverPin">Pin Code</label>
	    <input type="text" id="receiverPin" name="receiverPin" pattern="\d{6}" required>
	
	    <label for="receiverContact">Contact</label>
	    <input type="text" id="receiverContact" name="receiverMobile" pattern="\d{10}" required>
	    
	    <label for="receiverEmail">Email</label>
	    <input type="text" id="receiverEmail" name="receiverEmail" required>
	</fieldset>
	
	<fieldset>
	    <legend>Parcel Details</legend>
	    <label for="parcelSize">Size and Weight</label>
	    <select id="parcelSize" name="parcelSize" onchange="calculateCost()">
            <option value="100">Small (0.5-10kg) - ₹100</option>
            <option value="200">Medium (11-50kg) - ₹200</option>
            <option value="300">Large (51-90kg) - ₹300</option>
            <option value="400">Extra Large (91+) - ₹400</option>
        </select>
	
	    <label for="contentDesc">Contents Description</label>
	    <textarea id="contentDesc" name="contents" required></textarea>
	</fieldset>
	
	<fieldset>
	    <legend>Shipping Options</legend>
	    <label for="deliverySpeed">Delivery Speed</label>
	    <select id="deliverySpeed" name="deliverySpeed" onchange="calculateCost()">
            <option value="50">Standard - ₹50</option>
            <option value="150">Express - ₹150</option>
        </select>
	
	    <label for="packagingPref">Packaging Preferences</label>
	    <select id="packagingPref" name="packagingPref" onchange="calculateCost()">
            <option value="20">Standard - ₹20</option>
            <option value="0">Custom - ₹0</option>
            <option value="40">Eco-friendly - ₹40</option>
            <option value="60">Fragile Handling - ₹60</option>
        </select>
	</fieldset>
	
	<fieldset>
	    <legend>Date and Time</legend>
	    <label for="pickupDate">Pickup</label>
	    <input type="date" id="pickupDate" name="pickupDate" min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" required>
	
	    <label for="pickupTime">Pickup Time</label>
	    <select id="pickupTime"  name="pickupTime"required>
	        <option value="06:00AM-09:00AM">06:00AM – 09:00AM</option>
		    <option value="09:00AM-12:00PM">09:00AM – 12:00PM</option>
		    <option value="01:00PM-04:00PM">01:00PM – 04:00PM</option>
		    <option value="04:00PM-06:00PM">04:00PM – 06:00PM</option>
		    <option value="06:00PM-10:00PM">06:00PM – 10:00PM</option>
	    </select>
	</fieldset>
	<fieldset>
	
	    <label for="paymentMethod">Payment Method</label>
	    <select id="paymentMethod" name="paymentMethod" required>
	        <option value="card" onclick="calculateCost()">Credit/Debit Card</option>
	        <option value="cod" onclick="calculateCost()">Cash on Delivery</option>
	    </select>
	    
	    <label for="serviceCost">Estimated Cost</label>
	    <input type="text" id="serviceCost" name="serviceCost" readonly>
	</fieldset>
	
	<fieldset>
	    <legend >Additional Services</legend>
	    <div class="check">
	    <label><input type="checkbox" id="insurance"> Add Insurance</label>
	    <label><input type="checkbox" id="tracking"> Enable Tracking</label>
	    </div>
	</fieldset>

<input type="submit" value="Submit Booking">
</form>
</main>
</body>
</html>




