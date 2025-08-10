package com.PMS.util;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBsetup {

    public static void insertOfficers() {
        String sql = "INSERT INTO officers (name, email, username, password) VALUES (?, ?, ?, ?)";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            // Officer 1
            ps.setString(1, "Officer One");
            ps.setString(2, "officer1@example.com");
            ps.setString(3, "officer1");
            ps.setString(4, "Officer@123");  // For real app, hash passwords
            ps.executeUpdate();

            // Officer 2
            ps.setString(1, "Officer Two");
            ps.setString(2, "officer2@example.com");
            ps.setString(3, "officer2");
            ps.setString(4, "Officer@456");
            ps.executeUpdate();

            System.out.println("Officer data inserted successfully.");

        } catch (SQLException e) {
            System.out.println("Officers might already exist or error: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        insertOfficers();
    }
}

