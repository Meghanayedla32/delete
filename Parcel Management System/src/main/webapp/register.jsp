<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Parcel Management</title>
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
        }
        .container {
            width: 500px;
        }
        .check{
            padding: 7px;
            text-align: left;
            width: auto;
            margin-left: 0;
        }
        #preference1{
            padding: 7px;
            text-align: left;
            width: auto;
            margin-left: 0;
        }
        #preference2{
            padding: 7px;
            text-align: left;
            width: auto;
            margin-left: 0;
            display: inline;
        }
        .fakelink {
            color: blue;
            text-decoration: underline;
            cursor: pointer; 
        }
        .ack { display: none; margin-top: 20px; }
    </style>
    <script src="js/validation.js"></script>
</head>
<body>
    <div class="container">
        <h2>Customer Registration</h2>
	    <c:if test="${not empty error}">
	        <div style="color:red;">${error}</div>
	    </c:if>

    <form action="RegistrationServlet" method="post" onsubmit="return validateRegister();">
        <fieldset>
            <legend>Personal Information</legend>
            <label for="custName">Customer Name:</label>
            <input type="text" name="name" id="custName" maxlength="50" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="countryCode">Country Code:</label>
            <select id="countryCode" name="countryCode" required>
                <option value="+91">+91</option>
                <option value="+1">+1</option>
                <option value="+44">+44</option>
                <!-- Add more country codes as needed -->
            </select>
            <label for="mobile">Mobile Number:</label>
            <input type="text" id="mobile" name="mobile" maxlength="10" pattern="\d{10}" required>

            <label for="address">Address:</label>
            <textarea id="address" name="address" required></textarea>
            
            <!-- 
            Customer Name: <input type="text" name="name" maxlength="50" required /><br/>
            Email: <input type="email" name="email" required /><br/>
            Country Code: 
            <select id="countryCode" name="countryCode" required>
                <option value="+91">+91</option>
                <option value="+1">+1</option>
                <option value="+44">+44</option>
                 Add more country codes as needed 
            </select>
            Mobile Number: <input type="text" name="mobile" pattern="\d{10}" required /><br/>
            Address: <textarea name="address" required></textarea><br/> -->
        </fieldset>
        
        <fieldset>
            <legend>UserName & Password</legend>
            <label for="userId">User Name:</label>
                <input type="text" name="username" id="userId" minlength="5" maxlength="20" required>

                <label for="password">Password:</label>
                <input type="password" name="password" id="password" maxlength="30" required>
                <p><small>Password must include UpperCase, LowerCase, and special character.</small></p>

                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" name="confirmPassword" id="confirmPassword" maxlength="30" required>
      
            <!--  
            User ID: <input type="text" name="username" minlength="5" maxlength="20" required /><br/>
            Password: <input type="password" name="password" maxlength="30" required /><br/>
            Confirm Password: <input type="password" name="confirmPassword" maxlength="30" required /><br/> -->
            
        </fieldset>

        <fieldset id ="check">
        <legend>Preferences</legend>
        <input type="checkbox" name="notifications" id="preference1" required>
        <label for="preference1" id="preference2"> I agree to receive notifications and E-mails.</label><br/>
        <input type="checkbox" name="terms"  id="preference1" required>
        <label for="preference1" id="preference2"> I have reviewed and agree to <span class="fakelink">privacy policy</span>.</label>
        
         <!--    <legend>Preferences</legend>
            <input type="checkbox" name="notifications" /> I agree to receive notifications and emails<br/>
            <input type="checkbox" name="terms" required /> I have reviewed and agree to the <span class="fakelink">terms and conditions</span><br/>--> 
        </fieldset>

        <input type="hidden" name="role" value="customer" />
        <button type="submit" value="Register">Register</button>
        <button type="reset" value="Reset" >Reset</button>
    </form>
    </div>
</body>
</html>
