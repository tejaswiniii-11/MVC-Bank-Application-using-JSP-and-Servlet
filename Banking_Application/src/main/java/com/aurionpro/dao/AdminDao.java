package com.aurionpro.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.aurionpro.model.Admin;
import com.aurionpro.database.DBConnection;

public class AdminDao {
	
	//admin login
    public Admin login(String username, String password) {
        Admin admin = null;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM admins WHERE username=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                admin = new Admin();
                admin.setAdminId(rs.getInt("admin_id"));
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                admin.setFullName(rs.getString("full_name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }
    
    
}
