package com.PMS.servelet;

//import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.PMS.dao.UserDAO;

/**
 * Servlet implementation class LoginServelet
 */
@WebServlet("/LoginServelet")
public class LoginServelet extends HttpServlet {
	
//	@Override
//	public void init() throws ServletException {
//	    super.init();
//	    System.setProperty("derby.system.home", "C:/Users/rohit/MyDB");
//        File derbyHome = new File("C:/Users/rohit/MyDB");
//	    if (!derbyHome.exists()) {
//	        derbyHome.mkdirs();
//	    }
//	}
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        UserDAO userDao = new UserDAO();

        boolean validUser = userDao.validateUser(username, password, role);

        if(validUser) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);
            
            
            if ("customer".equals(role)) {
                response.sendRedirect("customer_home.jsp");
            } else if ("officer".equals(role)) {
                response.sendRedirect("officer_home.jsp");
             }
             else {
                request.setAttribute("error", "Invalid role selected.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            if ("customer".equals(role)) {
                request.setAttribute("error", "User is not registered. Please register first.");
            } else if ("officer".equals(role)) {
                request.setAttribute("error", "Requested operation requires elevation.");
            } else {
                request.setAttribute("error", "Invalid username/password/role.");
            }
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}

