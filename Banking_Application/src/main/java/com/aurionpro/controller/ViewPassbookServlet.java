package com.aurionpro.controller;

//import com.aurionpro.model.Customer;	
import com.aurionpro.model.Transaction;
import com.aurionpro.service.PassbookService;
import com.aurionpro.database.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/viewPassbook")
public class ViewPassbookServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customer") == null) {
            response.sendRedirect("login.jsp?msg=invalid");
            return;
        }

//        Customer cust = (Customer) session.getAttribute("customer");

        try (Connection conn = DBConnection.getConnection()) {
            PassbookService service = new PassbookService();

            
            long fromAccount = (long) session.getAttribute("from_account");
            

            List<Transaction> transactions = service.getPassbook(fromAccount);

            request.setAttribute("transactions", transactions);
            request.getRequestDispatcher("viewPassbook.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error fetching passbook!");
            request.getRequestDispatcher("viewPassbook.jsp").forward(request, response);
        }
    }
}
