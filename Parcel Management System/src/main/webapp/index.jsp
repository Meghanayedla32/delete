<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  <!DOCTYPE html>
<html>
<head>
    <title>Parcel Management System</title>
</head>
<body>
    <h2>Welcome to Parcel Management System</h2>
    <a href="login.jsp">Login</a> | <a href="register.jsp">Register</a>
</body>
</html>-->


<!-- index.html -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parcel Management System</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        .landing-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background: linear-gradient(135deg, #e0f7fa, #fff);
            text-align: center;
        }

        .landing-container h1 {
            font-size: 2.5em;
            color: #333;
            animation: fadeIn 1s ease-in-out;
        }

        .landing-container p {
            font-size: 1.2em;
            margin-top: 10px;
            animation: fadeIn 2s ease-in-out;
        }

        .role-buttons {
            margin-top: 40px;
            animation: fadeIn 3s ease-in-out;
        }

        .role-buttons a {
            padding: 12px 25px;
            margin: 0 15px;
            text-decoration: none;
            background-color: #007BFF;
            color: white;
            border-radius: 6px;
            font-size: 1em;
            transition: background-color 0.3s;
        }

        .role-buttons a:hover {
            background-color: #0056b3;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="landing-container">
        <h1>Welcome to the Parcel Management System</h1>
        
        <div class="role-buttons">
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </div>
    </div>
</body>
</html>
<!-- index.html -->

