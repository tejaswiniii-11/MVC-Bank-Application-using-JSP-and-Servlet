package com.aurionpro.model;

import java.sql.Timestamp;

public class Customer {
	private int customerId;
	private String username;
	private String password;
	private String fullName;
	private String email;
	private String phone;
	private Timestamp createdAt;

	// Getters & Setters
	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Customer(int customerId, String username, String fullName, String email, String phone, Timestamp createdAt ) {
		super();
		this.customerId = customerId;
		this.username = username;
		
		this.fullName = fullName;
		this.email = email;
		this.phone = phone;
		this.createdAt = createdAt;
	}

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

}
