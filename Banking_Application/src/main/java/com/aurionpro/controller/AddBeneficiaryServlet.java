package com.aurionpro.controller;

import com.aurionpro.model.Beneficiary;
import com.aurionpro.model.Customer;
import com.aurionpro.service.BeneficiaryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddBeneficiaryServlet")
public class AddBeneficiaryServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private BeneficiaryService service = new BeneficiaryService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("customer") == null){
            response.sendRedirect("login.jsp?msg=invalid");
            return;
        }

        Customer customer = (Customer) session.getAttribute("customer");

        Beneficiary b = new Beneficiary();
        b.setCustomerId(customer.getCustomerId());
        b.setIfscCode(request.getParameter("ifscCode"));
        b.setBranch(request.getParameter("branch"));
        b.setAccountNumber(request.getParameter("accountNumber"));
        b.setNickname(request.getParameter("nickname"));

        boolean success = service.addBeneficiary(b);
        if(success){
            response.sendRedirect("addBeneficiary.jsp?msg=success");
        } else {
            response.sendRedirect("addBeneficiary.jsp?msg=fail");
        }
    }
}
