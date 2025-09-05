package com.aurionpro.controller;

import com.aurionpro.service.TransactionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/MakePaymentServlet")
public class MakePaymentServlet extends HttpServlet {

    private TransactionService transactionService;

    @Override
    public void init() throws ServletException {
        transactionService = new TransactionService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            long fromAccount = Long.parseLong(request.getParameter("fromAccount"));
            long toAccount = Long.parseLong(request.getParameter("toAccount"));
            BigDecimal amount = new BigDecimal(request.getParameter("amount"));

            boolean result = transactionService.debitMoney(fromAccount, toAccount, amount);

            if (result) {
                request.setAttribute("message", "Transaction Successful!");
            } else {
                request.setAttribute("message", "Transaction Failed. Please try again.");
            }

            // Forward to JSP (you can change to your actual JSP path)
            request.getRequestDispatcher("paymentResult.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error processing transaction: " + e.getMessage());
            request.getRequestDispatcher("paymentResult.jsp").forward(request, response);
        }
    }
}
