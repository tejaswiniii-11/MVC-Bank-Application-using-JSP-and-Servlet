package com.aurionpro.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Transaction {
    private int transactionId;
    private long fromAccount;
    private long toAccount;
    private BigDecimal amount;
    private String transactionType; // DEBIT or CREDIT
    private String status;          // SUCCESS or FAILED
    private Timestamp createdAt;
    private int accountId;
    private int customerId;

    // --- Getters and Setters ---
    
    public int getAccountId() {
        return accountId;
    }
    
    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }
    
    
    public int getCustomerId() {
        return customerId;
    }
    
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    
    
    public int getTransactionId() {
        return transactionId;
    }
    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public long getFromAccount() {
        return fromAccount;
    }
    public void setFromAccount(long fromAccount) {
        this.fromAccount = fromAccount;
    }

    public long getToAccount() {
        return toAccount;
    }
    public void setToAccount(long toAccount) {
        this.toAccount = toAccount;
    }

    public BigDecimal getAmount() {
        return amount;
    }
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getTransactionType() {
        return transactionType;
    }
    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
	public Transaction(int transactionId,int customerId, int accountId, long fromAccount, long toAccount, BigDecimal amount, String transactionType,
			String status, Timestamp createdAt) {
		super();
		this.transactionId = transactionId;
		this.customerId= customerId;
		this.accountId=accountId;
		this.fromAccount = fromAccount;
		this.toAccount = toAccount;
		this.amount = amount;
		this.transactionType = transactionType;
		this.status = status;
		this.createdAt = createdAt;
	}
	public Transaction() {
		super();
		// TODO Auto-generated constructor stub
	}

//    // --- ToString() for debugging ---
//    @Override
//    public String toString() {
//        return "Transaction{" +
//                "transactionId=" + transactionId +
//                ", fromAccount=" + fromAccount +
//                ", toAccount=" + toAccount +
//                ", amount=" + amount +
//                ", transactionType='" + transactionType + '\'' +
//                ", status='" + status + '\'' +
//                ", createdAt=" + createdAt +
//                '}';
//    }
    
    
    
    
    
}
