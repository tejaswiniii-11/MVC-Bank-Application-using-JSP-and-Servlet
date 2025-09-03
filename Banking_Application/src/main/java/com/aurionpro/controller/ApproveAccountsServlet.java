package com.aurionpro.controller;

import com.aurionpro.model.Account;
import com.aurionpro.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ApproveAccountsServlet")
public class ApproveAccountsServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AccountService accountService = new AccountService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Account> pendingAccounts = accountService.getPendingAccounts();
        request.setAttribute("accounts", pendingAccounts);
        request.getRequestDispatcher("approveAccounts.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int accountId = Integer.parseInt(request.getParameter("accountId"));

        if ("approve".equalsIgnoreCase(action)) {
            accountService.approveAccount(accountId);
        } else if ("reject".equalsIgnoreCase(action)) {
            accountService.rejectAccount(accountId);
        }

        response.sendRedirect("ApproveAccountsServlet"); // reload
    }
}
