package com.PMS.servelet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.PMS.util.DBUtil;

/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String generateBookingId() {
	    long number = (long) (Math.random() * 1_000_000_000_000L);
	    return String.format("%012d", number); // zero-padded to 12 digits
	}

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String username = (String) session.getAttribute("username");
        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int customerId = -1;
        // First, get customer ID from customers table
        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement ps = conn.prepareStatement(
                "SELECT id FROM customers WHERE username = ?"
            );
            ps.setString(1, username);
            var rs = ps.executeQuery();
            if (rs.next()) {
                customerId = rs.getInt("id");
            } else {
                response.getWriter().println("Customer not found.");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error retrieving customer ID: " + e.getMessage());
            return;
        }

        // Get form data
        String senderName = request.getParameter("senderName");
        String senderAddress = request.getParameter("senderAddress");
        String senderEmail = request.getParameter("senderEmail");
        String senderMobile = request.getParameter("senderMobile");

        String receiverName = request.getParameter("receiverName");
        String receiverAddress = request.getParameter("receiverAddress");
        String receiverPin = request.getParameter("receiverPin");
        String receiverMobile = request.getParameter("receiverMobile");
        String receiverEmail = request.getParameter("receiverEmail");

        String parcelSize = request.getParameter("parcelSize");
        String contents = request.getParameter("contents");
        String deliverySpeed = request.getParameter("deliverySpeed");
        String packagingPref = request.getParameter("packagingPref");

        String pickupDate = request.getParameter("pickupDate");
        String pickupTime = request.getParameter("pickupTime");

        String paymentMethod = request.getParameter("paymentMethod");
        String serviceCost = request.getParameter("serviceCost");
        
        String bookingId = generateBookingId();

        try (Connection conn = DBUtil.getConnection()) {
        	String sql = "INSERT INTO booking (customer_id, sender_name, sender_address, sender_email, sender_contact, receiver_name, receiver_address, receiver_pin, receiver_contact, receiver_email, parcel_size, contents, delivery_speed, packaging_pref, pickup_date, pickup_time, payment_method, service_cost, booking_id) "
        	           + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, customerId);
            ps.setString(2, senderName);
            ps.setString(3, senderAddress);
            ps.setString(4, senderEmail);
            ps.setString(5, senderMobile);
            ps.setString(6, receiverName);
            ps.setString(7, receiverAddress);
            ps.setString(8, receiverPin);
            ps.setString(9, receiverMobile);
            ps.setString(10, receiverEmail);
            ps.setString(11, parcelSize);
            ps.setString(12, contents);
            ps.setString(13, deliverySpeed);
            ps.setString(14, packagingPref);
            ps.setDate(15, java.sql.Date.valueOf(pickupDate));
            ps.setString(16, pickupTime);
            ps.setString(17, paymentMethod);
            ps.setBigDecimal(18, new java.math.BigDecimal(serviceCost));
            ps.setString(19, bookingId);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("bookingSuccess.jsp");
            } else {
                response.getWriter().println("Booking failed. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error inserting booking: " + e.getMessage());
        }
    }
}
