package com.aurionpro.controller;

import com.aurionpro.model.Customer;
import com.aurionpro.model.Admin;
import com.aurionpro.service.CustomerService;
import com.aurionpro.service.AdminService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private CustomerService customerService = new CustomerService();
    private AdminService adminService = new AdminService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Try customer login
        Customer customer = customerService.loginCustomer(username, password);
        if (customer != null) {
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);
            response.sendRedirect("customerDashboard.jsp");
            return;
        }

        // Try admin login
        Admin admin = adminService.loginAdmin(username, password);
        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect("adminDashboard.jsp");
            return;
        }

        // Login failed
        response.sendRedirect("login.jsp?msg=invalid");
    }
}
