<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.aurionpro.model.Customer"%>
<%@ page import="com.aurionpro.model.Account"%>
<%@ page import="com.aurionpro.model.Beneficiary"%>
<%@ page import="com.aurionpro.service.AccountService"%>
<%@ page import="com.aurionpro.service.BeneficiaryService"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.List"%>

<%
    HttpSession sess = request.getSession(false);
    if(sess == null || sess.getAttribute("customer") == null){
        response.sendRedirect("login.jsp?msg=invalid");
        return;
    }
    Customer customer = (Customer) sess.getAttribute("customer");

    // Fetch customer accounts
    AccountService accountService = new AccountService();
    List<Account> accounts = accountService.getAccountsByCustomerId(customer.getCustomerId());


    // Fetch beneficiaries
    BeneficiaryService beneficiaryService = new BeneficiaryService();
    List<Beneficiary> beneficiaries = beneficiaryService.getBeneficiariesByCustomerId(customer.getCustomerId());
%>

<!DOCTYPE html>
<html>
<head>
    <title>Make Payment - Tej Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #fdfcff; }
        .sidebar { height: 100vh; background: linear-gradient(180deg, #6f42c1, #a64ca6, #d63384); color: white; padding-top: 2rem; position: fixed; }
        .sidebar h4 { font-weight: bold; letter-spacing: 1px; }
        .sidebar a { color: white; text-decoration: none; display: block; padding: 12px 20px; border-radius: 8px; margin: 5px 15px; transition: all 0.3s; }
        .sidebar a:hover { background: rgba(255,255,255,0.2); transform: translateX(5px); }
        .dashboard-content { margin-left: 17%; padding: 2rem; }
        .form-card { border-radius: 1rem; box-shadow: 0 5px 15px rgba(0,0,0,0.1); padding: 2rem; background: #fff; }
        .form-card h3 { color: #6f42c1; font-weight: bold; margin-bottom: 1.5rem; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Tej Bank</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item"><span class="nav-link">👤 <b><%= customer.getUsername() %></b></span></li>
                <li class="nav-item"><a class="nav-link" href="LogoutServlet">🚪 Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-3 col-lg-2 sidebar d-flex flex-column">
            <h4 class="text-center mb-4">🏦 Tej Bank</h4>
            <a href="customerDashboard.jsp">🏠 Home</a>
            <a href="createAccount.jsp">➕ Create Account</a>
            <a href="addBeneficiary.jsp">👥 Add Beneficiary</a>
            <a href="viewBeneficiary.jsp">📄 View Beneficiaries</a>
            <a href="makePayment.jsp">💸 Make Payment</a>
            <a href="viewPassbook.jsp">📖 View Passbook</a>
            <a href="profile.jsp">🙍 View Profile</a>
            <a href="LogoutServlet">🚪 Logout</a>
        </div>

        <div class="col-md-9 col-lg-10 dashboard-content">
            <div class="form-card">
                <h3>💸 Make Payment</h3>

                <% String msg = request.getParameter("msg");
                   if("success".equals(msg)){ %>
                    <div class="alert alert-success">Transaction successful!</div>
                <% } else if("fail".equals(msg)){ %>
                    <div class="alert alert-danger">Transaction failed! Check balance or account details.</div>
                <% } %>

                <form method="post" action="MakePaymentServlet">
                    <div class="mb-3">
                        <label for="fromAccount" class="form-label">From Account</label>
                        <select class="form-select" name="fromAccount" id="fromAccount" required>
                            <% if(accounts != null && !accounts.isEmpty()) {
                                for(Account acc : accounts){ %>
                                    <option value="<%= acc.getAccountNumber() %>">
                                        <%= acc.getAccountNumber() %> | Balance: ₹<%= acc.getBalance() %>
                                    </option>
                            <% } } else { %>
                                <option value="">No accounts available</option>
                            <% } %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="toAccount" class="form-label">Beneficiary</label>
                        <select class="form-select" name="toAccount" id="toAccount" required>
                            <% if(beneficiaries != null && !beneficiaries.isEmpty()){
                                for(Beneficiary b : beneficiaries){ %>
                                    <option value="<%= b.getAccountNumber() %>"><%= b.getNickname() %> - <%= b.getAccountNumber() %></option>
                            <% } } else { %>
                                <option value="">No beneficiaries added</option>
                            <% } %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="amount" class="form-label">Amount</label>
                        <input type="number" step="0.01" min="1" class="form-control" id="amount" name="amount" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Transfer Money</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
