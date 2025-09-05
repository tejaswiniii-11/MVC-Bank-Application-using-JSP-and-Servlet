package com.aurionpro.dao;

import com.aurionpro.database.DBConnection;
import com.aurionpro.model.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

public class AccountDao {

    // Generate unique 12-digit account number
    private long generateAccountNumber() throws SQLException {
        long accountNumber = 100000000000L + (long) (Math.random() * 899999999999L);
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT account_number FROM accounts WHERE account_number=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, accountNumber);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Duplicate found, retry
                System.out.println("Duplicate account number found: " + accountNumber + ", regenerating...");
                return generateAccountNumber();
            }
        }
        System.out.println("Generated account number: " + accountNumber);
        return accountNumber;
    }

    // Generate IFSC code
    private String generateIfsc() {
        int randomDigits = (int) (Math.random() * 10000000); // 0 to 9,999,999
        String ifsc = String.format("MUMB%07d", randomDigits);
        System.out.println("Generated IFSC code: " + ifsc);
        
        return ifsc;
    }

    public boolean createAccount(Account account) {
        String sql = "INSERT INTO accounts (customer_id, account_number, account_type, balance, status, branch, ifsc_code) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            long accountNumber = generateAccountNumber();
            String ifscCode = generateIfsc();

            // Set parameters
            ps.setInt(1, account.getCustomerId());
            ps.setLong(2, accountNumber);
            ps.setString(3, account.getAccountType());
            ps.setDouble(4, account.getBalance());
            ps.setString(5, "PENDING");
            ps.setString(6, "Mumbai");
            ps.setString(7, "MUMB0552945");
            
//            String ifscCode = generateIfsc();
//            account.setIfscCode(ifscCode);
//            
//            if(!account.getIfscCode().matches("^MUMB[0-9]{7}$")){
//                throw new IllegalArgumentException("Invalid IFSC generated");
//            }


            // Debug logging before execution
            System.out.println("Executing SQL: " + sql);
            System.out.println("Parameters:");
            System.out.println("Customer ID: " + account.getCustomerId());
            System.out.println("Account Number: " + accountNumber);
            System.out.println("Account Type: " + account.getAccountType());
            System.out.println("Balance: " + account.getBalance());
            System.out.println("Status: PENDING");
            System.out.println("Branch: Mumbai");
            System.out.println("IFSC: " + ifscCode);

            int rows = ps.executeUpdate();
            System.out.println("Rows affected: " + rows);
            return rows > 0;

        } catch (SQLException e) {
            System.err.println("SQL Exception occurred:");
            e.printStackTrace();
            return false;
        }
    }
    
    //For viewing profile - for customer
    public List<Account> getAccountsByCustomerId(int customerId) {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM accounts WHERE customer_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();

            int rowCount = 0;
            while (rs.next()) {
                rowCount++;
                Account acc = new Account();
                acc.setAccountId(rs.getInt("account_id"));
                acc.setCustomerId(rs.getInt("customer_id"));
                acc.setAccountNumber(rs.getLong("account_number"));
                acc.setAccountType(rs.getString("account_type"));
                acc.setBalance(rs.getDouble("balance"));
                acc.setStatus(rs.getString("status"));
                acc.setBranch(rs.getString("branch"));
                acc.setIfscCode(rs.getString("ifsc_code"));
                acc.setCreatedAt(rs.getTimestamp("created_at"));
                accounts.add(acc);
            }

//            context.log("Total rows fetched for customerId=" + customerId + ": " + rowCount);

        } catch (Exception e) {
//            context.log("Error fetching accounts for customerId=" + customerId, e);
        	e.printStackTrace();
        }
        return accounts;
    }

    //For Transactions
 // Get balance of an account
    public double getBalance(long accountNumber) {
        double balance = 0;
        String sql = "SELECT balance FROM accounts WHERE account_number=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, accountNumber);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                balance = rs.getDouble("balance");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return balance;
    }

    // Update balance of an account
    public boolean updateBalance(long accountNumber, double newBalance) {
        String sql = "UPDATE accounts SET balance=? WHERE account_number=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDouble(1, newBalance);
            ps.setLong(2, accountNumber);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
	
    
    //making payments
    public int getAccountIdByAccountNumber(long accountNumber) throws SQLException {
        String sql = "SELECT account_id FROM accounts WHERE account_number = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, accountNumber);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("account_id");
        }
        return -1;
    }

    public int getCustomerIdByAccountNumber(long accountNumber) throws SQLException {
        String sql = "SELECT customer_id FROM accounts WHERE account_number = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, accountNumber);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("customer_id");
        }
        return -1;
    }

    
    
    //see all the accounts - for admin
    public List<Account> getAllAccounts() throws SQLException {
        List<Account> accounts = new ArrayList<>();
        String query = "SELECT * FROM accounts";

        try (Connection con = DBConnection.getConnection();PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setAccountId(rs.getInt("account_id"));
                account.setCustomerId(rs.getInt("customer_id"));
                account.setAccountNumber(rs.getLong("account_number")); 
                account.setAccountType(rs.getString("account_type"));
                account.setBalance(rs.getDouble("balance"));
                account.setStatus(rs.getString("status"));
                account.setBranch(rs.getString("branch"));
                account.setIfscCode(rs.getString("ifsc_code"));
                account.setCreatedAt(rs.getTimestamp("created_at"));
                accounts.add(account);
            }
        }
        return accounts;
    }
    
    
 // Fetch all pending accounts
    public List<Account> getPendingAccounts() {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM accounts WHERE status = 'PENDING'";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Account acc = new Account();
                acc.setAccountId(rs.getInt("account_id"));
                acc.setCustomerId(rs.getInt("customer_id"));
                acc.setAccountNumber(rs.getLong("account_number"));
                acc.setAccountType(rs.getString("account_type"));
                acc.setBalance(rs.getDouble("balance"));
                acc.setStatus(rs.getString("status"));
                acc.setBranch(rs.getString("branch"));
                acc.setIfscCode(rs.getString("ifsc_code"));
                acc.setCreatedAt(rs.getTimestamp("created_at"));
                accounts.add(acc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accounts;
    }

    // Update account status
    public boolean updateAccountStatus(int accountId, String status) {
        String sql = "UPDATE accounts SET status = ? WHERE account_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, accountId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    

}
