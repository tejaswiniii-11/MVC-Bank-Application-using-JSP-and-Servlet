package com.aurionpro.controller;

import com.aurionpro.service.TransactionService;
import com.aurionpro.model.Transaction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/SeeAllTransactionsServlet")
public class SeeAllTransactionsServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TransactionService transactionService = new TransactionService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String fromDate = request.getParameter("fromDate");
	    String toDate = request.getParameter("toDate");
	    String type = request.getParameter("type");

	    List<Transaction> transactions = transactionService.getFilteredTransactions(fromDate, toDate, type);

	    request.setAttribute("transactions", transactions);
	    request.setAttribute("fromDate", fromDate);
	    request.setAttribute("toDate", toDate);
	    request.setAttribute("type", type);

	    request.getRequestDispatcher("viewTransactions.jsp").forward(request, response);
	}

}
