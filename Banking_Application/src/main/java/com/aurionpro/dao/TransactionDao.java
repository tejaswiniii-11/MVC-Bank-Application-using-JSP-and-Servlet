package com.aurionpro.dao;

import java.sql.*;	
import java.util.ArrayList;
import java.util.List;

import com.aurionpro.model.Transaction;
import com.aurionpro.model.Customer;
import com.aurionpro.database.DBConnection;

public class TransactionDao {

    // --- Add a new transaction ---
	public boolean addTransaction(Transaction transaction) throws SQLException {
	    String sql = "INSERT INTO transactions (customer_id, account_id, from_account, to_account, amount, transaction_type, status) "
	               + "VALUES (?, ?, ?, ?, ?, ?, ?)";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

	        ps.setInt(1, transaction.getCustomerId());
	        ps.setInt(2, transaction.getAccountId());
	        ps.setLong(3, transaction.getFromAccount());
	        ps.setLong(4, transaction.getToAccount());
	        ps.setBigDecimal(5, transaction.getAmount());
	        ps.setString(6, transaction.getTransactionType());
	        ps.setString(7, transaction.getStatus());

	        int rows = ps.executeUpdate();
	        System.out.println(ps);
	        if (rows > 0) {
	            try (ResultSet rs = ps.getGeneratedKeys()) {
	                if (rs.next()) {
	                    transaction.setTransactionId(rs.getInt(1));
	                }
	            }
	            return true;
	        }
	    }
	    return false;
	}


    // To show all transactions in my passbook feature
    // --- Get all transactions for an account ---
    public List<Transaction> getTransactionsByAccount(int customerId) throws SQLException {
        List<Transaction> transactions = new ArrayList<>();

        String sql = "SELECT * FROM transactions WHERE customer_id = ? ORDER BY created_at DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setLong(1, customerId);
           

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Transaction transaction = new Transaction();
                    transaction.setTransactionId(rs.getInt("transaction_id"));
                    transaction.setFromAccount(rs.getLong("from_account"));
                    transaction.setToAccount(rs.getLong("to_account"));
                    transaction.setAmount(rs.getBigDecimal("amount"));
                    transaction.setTransactionType(rs.getString("transaction_type"));
                    transaction.setStatus(rs.getString("status"));
                    transaction.setCreatedAt(rs.getTimestamp("created_at"));

                    transactions.add(transaction);
                    
                    System.out.println(transaction);
                }
            }
        }
        return transactions;
    }
    
    
    //To show all transactions to the admin
    public List<Transaction> getFilteredTransactions(String fromDate, String toDate, String type) {
        List<Transaction> transactions = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM transactions WHERE 1=1");

        if (fromDate != null && !fromDate.isEmpty()) {
            sql.append(" AND DATE(created_at) >= ?");
        }
        if (toDate != null && !toDate.isEmpty()) {
            sql.append(" AND DATE(created_at) <= ?");
        }
        if (type != null && !type.isEmpty()) {
            sql.append(" AND transaction_type = ?");
        }

        sql.append(" ORDER BY created_at DESC");

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {

            int paramIndex = 1;
            if (fromDate != null && !fromDate.isEmpty()) {
                stmt.setString(paramIndex++, fromDate);
            }
            if (toDate != null && !toDate.isEmpty()) {
                stmt.setString(paramIndex++, toDate);
            }
            if (type != null && !type.isEmpty()) {
                stmt.setString(paramIndex++, type);
            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Transaction tx = new Transaction();
                    tx.setTransactionId(rs.getInt("transaction_id"));
                    tx.setCustomerId(rs.getInt("customer_id"));
                    tx.setAccountId(rs.getInt("account_id"));
                    tx.setFromAccount(rs.getLong("from_account"));
                    tx.setToAccount(rs.getLong("to_account"));
                    tx.setAmount(rs.getBigDecimal("amount"));
                    tx.setTransactionType(rs.getString("transaction_type"));
                    tx.setStatus(rs.getString("status"));
                    tx.setCreatedAt(rs.getTimestamp("created_at"));
                    transactions.add(tx);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }


    

    
}
