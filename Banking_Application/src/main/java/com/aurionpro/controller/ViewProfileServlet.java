package com.aurionpro.controller;

import com.aurionpro.model.Customer;
import com.aurionpro.model.Account;
import com.aurionpro.service.AccountService;
import com.aurionpro.service.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewProfileServlet")
public class ViewProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CustomerService customerService = new CustomerService();
    private AccountService accountService = new AccountService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customer") == null) {
            response.sendRedirect("login.jsp?msg=invalid");
            return;
        }

        Customer customer = (Customer) session.getAttribute("customer");
        int customerId = customer.getCustomerId();

        // Fetch all accounts for this customer, pass ServletContext
        List<Account> accounts = accountService.getAccountsByCustomerId(customerId);

        // Debug: check if accounts are fetched
        getServletContext().log("Fetched " + accounts.size() + " accounts for customer: " + customer.getUsername());

        // Set attributes for JSP
        request.setAttribute("accounts", accounts);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}
