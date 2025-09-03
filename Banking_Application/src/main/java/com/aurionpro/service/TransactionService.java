package com.aurionpro.service;

import java.math.BigDecimal;	
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.aurionpro.dao.AccountDao;
import com.aurionpro.dao.TransactionDao;
import com.aurionpro.model.Transaction;
import com.aurionpro.database.DBConnection;

public class TransactionService {
    private TransactionDao transactionDao;
    private AccountDao accountDao;

    public TransactionService() {
        this.transactionDao = new TransactionDao();
        this.accountDao = new AccountDao();
    }

    // --- Transfer money between two accounts ---
 // --- Transfer money between two accounts ---
    public boolean debitMoney(long fromAccount, long toAccount, BigDecimal amount) {
        Connection conn = null;
        boolean success = false;

        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false); // start transaction

            AccountDao accountDao = new AccountDao();

            // 1. Check sender balance
            double senderBalance = accountDao.getBalance(fromAccount);
            if (senderBalance < amount.doubleValue()) {
                throw new SQLException("Insufficient balance");
            }

            // 2. Debit from sender
            boolean debitSuccess = accountDao.updateBalance(fromAccount, senderBalance - amount.doubleValue());
            if (!debitSuccess) throw new SQLException("Debit failed");
//            else return true;


//           

            // 4. Insert DEBIT transaction
            Transaction debitTx = new Transaction(0, fromAccount, toAccount, amount, "DEBIT", "SUCCESS", null);
            transactionDao.addTransaction(debitTx);

//           

            conn.commit(); // ✅ Commit both updates + transactions
            success = true;

        } catch (Exception e) {
            e.printStackTrace();
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
        } finally {
            if (conn != null) {
                try { conn.setAutoCommit(true); conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }

        return success;
    }
    
    
    
    
    public boolean creditMoney(long fromAccount, long toAccount, BigDecimal amount) {
        Connection conn = null;
        boolean success = false;

        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false); // start transaction
            
            AccountDao accountDao = new AccountDao();

            // 1. Check sender balance
            double senderBalance = accountDao.getBalance(fromAccount);
            if (senderBalance < amount.doubleValue()) {
                throw new SQLException("Insufficient balance");
            }
            
//             3. Credit to receiver
          double receiverBalance = accountDao.getBalance(fromAccount);
          boolean creditSuccess = accountDao.updateBalance(fromAccount, receiverBalance + amount.doubleValue());
          if (!creditSuccess) throw new SQLException("Credit failed");
//          else return true;
          
          // 5. Insert CREDIT transaction
        Transaction creditTx = new Transaction(0, fromAccount, toAccount, amount, "CREDIT", "SUCCESS", null);
        transactionDao.addTransaction(creditTx);
        
        conn.commit(); // ✅ Commit both updates + transactions
        success = true;

    
        }
        catch (Exception e) {
            e.printStackTrace();
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
        } finally {
            if (conn != null) {
                try { conn.setAutoCommit(true); conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }

        return success;
    }
    
    public List<Transaction> showPassbook(int customerId) {
    	try {
			return transactionDao.getTransactionsByAccount(customerId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return null;
    }
    
    
    // To show all transactions - to admin
    public List<Transaction> getFilteredTransactions(String fromDate, String toDate, String type) {
        return transactionDao.getFilteredTransactions(fromDate, toDate, type);
    }

}
