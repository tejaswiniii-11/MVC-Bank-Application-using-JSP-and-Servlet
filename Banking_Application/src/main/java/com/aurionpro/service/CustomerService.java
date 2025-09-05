package com.aurionpro.service;

import java.sql.SQLException;
import java.util.List;

import com.aurionpro.dao.CustomerDao;
import com.aurionpro.model.Account;
import com.aurionpro.model.Customer;

public class CustomerService {
    private CustomerDao customerDAO = new CustomerDao();

    public boolean registerCustomer(Customer customer) {
        return customerDAO.registerCustomer(customer);
    }

    public Customer loginCustomer(String username, String password) {
        return customerDAO.loginCustomer(username, password);
    }
    
    public Customer getCustomerById(int customerId) {
        return customerDAO.getCustomerById(customerId);
    }

    public List<Customer> fetchAllCustomers() {
        try {
            return customerDAO.getAllCustomers();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
