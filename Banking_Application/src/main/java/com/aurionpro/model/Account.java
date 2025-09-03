package com.aurionpro.model;

import java.sql.Timestamp;

public class Account {
	private int accountId;
	private int customerId;
	private long accountNumber;
	private String accountType;
	private double balance;
	private String status;
	private String branch;
	private String ifscCode;
	private Timestamp createdAt;

	// Getters and Setters
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

	public long getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getIfscCode() {
		return ifscCode;
	}

	public void setIfscCode(String ifscCode) {
		this.ifscCode = ifscCode;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Account(int accountId, int customerId, long accountNumber, String accountType, double balance, String status,
			String branch, String ifscCode, Timestamp createdAt) {
		super();
		this.accountId = accountId;
		this.customerId = customerId;
		this.accountNumber = accountNumber;
		this.accountType = accountType;
		this.balance = balance;
		this.status = status;
		this.branch = branch;
		this.ifscCode = ifscCode;
		this.createdAt = createdAt;
	}
	
	
	
	
}
