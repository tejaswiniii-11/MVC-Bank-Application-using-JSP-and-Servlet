package com.aurionpro.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aurionpro.database.DBConnection;
import com.aurionpro.model.Customer;
//import com.aurionpro.model.Customer;	
import com.aurionpro.model.Transaction;
import com.aurionpro.service.TransactionService;

@WebServlet("/viewPassbook")
public class ViewPassbookServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int customerId;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customer") == null) {
            response.sendRedirect("login.jsp?msg=invalid");
            return;
        }

//       

        try (Connection conn = DBConnection.getConnection()) {
            TransactionService service = new TransactionService();

            
//            long fromAccount = (long) session.getAttribute("from_account");
            Customer cust = (Customer) session.getAttribute("customer");

            
			List<Transaction> transactions = service.showPassbook(customerId);

            request.setAttribute("transactions", transactions);
            request.getRequestDispatcher("viewPassbook.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error fetching passbook!");
            request.getRequestDispatcher("viewPassbook.jsp").forward(request, response);
        }
    }
}
