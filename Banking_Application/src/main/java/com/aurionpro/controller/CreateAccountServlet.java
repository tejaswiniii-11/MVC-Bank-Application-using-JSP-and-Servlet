package com.aurionpro.controller;

import com.aurionpro.model.Account;	
import com.aurionpro.model.Customer;
import com.aurionpro.service.AccountService;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/CreateAccountServlet")
public class CreateAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AccountService accountService = new AccountService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customer") == null) {
            response.sendRedirect("login.jsp?msg=invalid");
            return;
        }

        Customer customer = (Customer) session.getAttribute("customer");

        Account account = new Account();
        account.setCustomerId(customer.getCustomerId());
        account.setAccountType(request.getParameter("accountType"));
        account.setBalance(Double.parseDouble(request.getParameter("balance")));

        boolean success = accountService.createAccount(account);

        if (success) {
            response.sendRedirect("createAccount.jsp?msg=success");
        } else {
            response.sendRedirect("createAccount.jsp?msg=error");
        }
    }
}
