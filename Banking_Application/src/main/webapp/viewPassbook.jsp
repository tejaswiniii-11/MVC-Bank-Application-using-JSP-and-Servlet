<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.aurionpro.model.Transaction" %>
<%@ page import="com.aurionpro.model.Customer" %>
<%@ page import="java.util.List" %>
<%@ page import="com.aurionpro.service.TransactionService" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("customer") == null) {
        response.sendRedirect("login.jsp?msg=invalid");
        return;
    }

    Customer customer = (Customer) sess.getAttribute("customer");
    TransactionService transactionService = new TransactionService();
    List<Transaction> transactions = transactionService.showPassbook(customer.getCustomerId());
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Passbook - Tej Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { height: 100vh; background: #fdfcff; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .sidebar { height: 100vh; background: linear-gradient(180deg, #6f42c1, #a64ca6, #d63384); color: white; padding-top: 2rem; position: fixed; }
        .sidebar a { color: white; text-decoration: none; display: block; padding: 12px 20px; }
        .dashboard-content { margin-left: 17%; padding: 2rem; }
        .form-card { border: none; border-radius: 1rem; box-shadow: 0 5px 15px rgba(0,0,0,0.1); padding: 2rem; background: #fff; }
        .form-card h3 { color: #6f42c1; font-weight: bold; margin-bottom: 1.5rem; }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 col-lg-2 sidebar d-flex flex-column">
            <h4 class="text-center mb-4">🏦 Tej Bank</h4>
            <a href="customerDashboard.jsp">🏠 Home</a>
            <a href="createAccount.jsp">➕ Create Account</a>
            <a href="addBeneficiary.jsp">👥 Add Beneficiary</a>
            <a href="viewBeneficiary.jsp">📄 View Beneficiaries</a>
            <a href="makePayment.jsp">📑 Transactions</a>
            <a href="viewPassbook.jsp">📖 View Passbook</a>
            <a href="profile.jsp">🙍 View Profile</a>
            <a href="LogoutServlet">🚪 Logout</a>
        </div>

        <!-- Content -->
        <div class="col-md-9 col-lg-10 dashboard-content">
            <div class="form-card">
                <h3>📖 Your Passbook</h3>

                <% if (transactions == null || transactions.isEmpty()) { %>
                    <div class="alert alert-info">No transaction done yet.</div>
                <% } else { %>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Transaction ID</th>
                                <th>Source Account</th>
                                <th>Beneficiary Account</th>
                                <th>Amount</th>
                                <th>Transaction Type</th>
                                <th>Status</th>
                                <th>Timestamp</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Transaction t : transactions) { %>
                                <tr>
                                    <td><%= t.getTransactionId() %></td>
                                    <td><%= t.getFromAccount() %></td>
                                    <td><%= t.getToAccount() %></td>
                                    <td><%= t.getAmount() %></td>
                                    <td><%= t.getTransactionType() %></td>
                                    <td><%= t.getStatus() %></td>
                                    <td><%= t.getCreatedAt() %></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                <% } %>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
