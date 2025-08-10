package com.PMS.servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.PMS.dao.UserDAO;
import com.PMS.model.User;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")

public class RegistrationServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String countryCode = request.getParameter("countryCode");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setCountryCode(countryCode);
        user.setMobile(mobile);
        user.setAddress(address);
        user.setUsername(username);
        user.setPassword(password);

        UserDAO dao = new UserDAO();

        try {
            boolean registered = dao.registerCustomer(user);
            if (registered) {
                request.setAttribute("message", "Consumer Registration successful.");
                request.setAttribute("userID", username);
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.getRequestDispatcher("registerAck.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}

