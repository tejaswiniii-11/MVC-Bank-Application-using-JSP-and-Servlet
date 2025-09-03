package com.aurionpro.dao;

import com.aurionpro.database.DBConnection;
import com.aurionpro.model.Account;
import com.aurionpro.model.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerDao {

    // Register new customer
    public boolean registerCustomer(Customer customer) {
        String sql = "INSERT INTO customers (username, password, full_name, email, phone) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, customer.getUsername());
            ps.setString(2, customer.getPassword()); 
            ps.setString(3, customer.getFullName());
            ps.setString(4, customer.getEmail());
            ps.setString(5, customer.getPhone());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Authenticate customer
    public Customer loginCustomer(String username, String password) {
        String sql = "SELECT * FROM customers WHERE username=? AND password=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setUsername(rs.getString("username"));
                customer.setPassword(rs.getString("password"));
                customer.setFullName(rs.getString("full_name"));
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone"));
                return customer;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // login failed
    }
    
    
    public Customer getCustomerById(int customerId) {
        Customer customer = null;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM customers WHERE customer_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                customer = new Customer();
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setUsername(rs.getString("username"));
                customer.setFullName(rs.getString("full_name"));
                customer.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customer;
    }

   // for admin part - show all customers
    public List<Customer> getAllCustomers() throws SQLException {
        List<Customer> customers = new ArrayList<>();
        String query = "SELECT * FROM customers ORDER BY created_at DESC";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setUsername(rs.getString("username"));
                customer.setPassword(rs.getString("password"));
                customer.setFullName(rs.getString("full_name"));
                customer.setEmail(rs.getString("email"));
                customer.setPhone(rs.getString("phone"));
                customer.setCreatedAt(rs.getTimestamp("created_at"));
                customers.add(customer);
            }
        }
        return customers;
    }

    
    
}
