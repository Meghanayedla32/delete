package com.PMS.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;

import com.PMS.model.User;
import com.PMS.util.DBUtil;

/**
 * Servlet implementation class UserDAO
 */
@WebServlet("/UserDAO")
public class UserDAO {

    public boolean validateUser(String username, String password, String role) {
        String sql;
        if ("customer".equals(role)) {
            sql = "SELECT * FROM customers WHERE username = ? AND password = ?";
        } else if ("officer".equals(role)) {
            sql = "SELECT * FROM officers WHERE username = ? AND password = ?";
        } else {
            return false;
        }

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean registerCustomer(User user) throws SQLException {
        String sql = "INSERT INTO customers (name, email, country_code, mobile, address, username, password) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getCountryCode());
            ps.setString(4, user.getMobile());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getUsername());
            ps.setString(7, user.getPassword());

            int result = ps.executeUpdate();
            return result > 0;
        }
    }
}

