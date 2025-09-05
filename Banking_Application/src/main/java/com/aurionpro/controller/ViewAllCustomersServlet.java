package com.aurionpro.controller;

import com.aurionpro.model.Customer;
import com.aurionpro.service.CustomerService;
import com.aurionpro.database.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin/viewCustomers")
public class ViewAllCustomersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerService customerService = new CustomerService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	 HttpSession session = request.getSession(false);
         if (session == null || session.getAttribute("admin") == null) {
             response.sendRedirect("login.jsp?msg=invalid");
             return;
         }
         
        List<Customer> customers = customerService.fetchAllCustomers();

        request.setAttribute("customersList", customers);
        request.getRequestDispatcher("/viewCustomers.jsp").forward(request, response);
    }
}
