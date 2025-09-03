package com.aurionpro.controller;

import com.aurionpro.model.Account;
import com.aurionpro.service.AccountService;
import com.aurionpro.database.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/viewAccounts")
public class ViewAccountsServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private  AccountService service = new AccountService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = DBConnection.getConnection()) {
           
            List<Account> accountsList = service.fetchAllAccounts();
            request.setAttribute("accountsList", accountsList);
            request.getRequestDispatcher("viewAccounts.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
