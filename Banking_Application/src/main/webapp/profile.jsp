<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.aurionpro.model.Customer" %>
<%@ page import="com.aurionpro.model.Account" %>
<%@ page import="com.aurionpro.service.AccountService" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("customer") == null) {
        response.sendRedirect("login.jsp?msg=invalid");
        return;
    }
    Customer customer = (Customer) sess.getAttribute("customer");
    
   
    AccountService accountService = new AccountService();
    List<Account> accounts = accountService.getAccountsByCustomerId(customer.getCustomerId());
    
    
%>

<!DOCTYPE html>
<html>
<head>
    <title>Profile - Tej Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            height: 100vh;
            background: #fdfcff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        /* Sidebar Styling */
        .sidebar {
            height: 100vh;
            background: linear-gradient(180deg, #6f42c1, #a64ca6, #d63384);
            color: white;
            padding-top: 2rem;
            position: fixed;
        }
        .sidebar h4 {
            font-weight: bold;
            letter-spacing: 1px;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 12px 20px;
            border-radius: 8px;
            margin: 5px 15px;
            transition: all 0.3s;
        }
        .sidebar a:hover {
            background: rgba(255,255,255,0.2);
            transform: translateX(5px);
        }
        /* Dashboard Content */
        .dashboard-content {
            margin-left: 17%;
            padding: 2rem;
        }
        .form-card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            padding: 2rem;
            background: #fff;
        }
        .form-card h3 {
            color: #6f42c1;
            font-weight: bold;
            margin-bottom: 1.5rem;
        }
        .account-card {
            border-radius: 1rem;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            padding: 1rem;
            margin-bottom: 1rem;
            background: #f8f0fc;
        }
        .account-card h5 {
            color: #6f42c1;
            font-weight: bold;
        }
        table th, table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Tej Bank</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <span class="nav-link">👤 <b><%= customer.getUsername() %></b></span>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet">🚪 Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
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

        <!-- Main Content -->
        <div class="col-md-9 col-lg-10 dashboard-content">
            <div class="form-card">
                <h3>🙍 Customer Profile</h3>

                <!-- Customer Info -->
                <table class="table table-bordered">
                    <tr><th>Full Name</th><td><%= customer.getFullName() %></td></tr>
                    <tr><th>Username</th><td><%= customer.getUsername() %></td></tr>
                    <tr><th>Email</th><td><%= customer.getEmail() %></td></tr>
                </table>

                <!-- Accounts Info -->
                <h4 class="mt-4">🏦 Accounts</h4>
                <div class="row">
                    <% if (accounts != null && !accounts.isEmpty()) {
                        for(Account acc : accounts) { %>
                            <div class="col-md-4">
                                <div class="account-card">
                                    <h5>Account No: <%= acc.getAccountNumber() %></h5>
                                    <p>Type: <%= acc.getAccountType() %></p>
                                    <p>Balance: ₹<%= acc.getBalance() %></p>
                                    <p>Status: <%= acc.getStatus() %></p>
                                    <p>IFSC: <%= acc.getIfscCode() %></p>
                                    <p>Branch: <%= acc.getBranch() %></p>
                                </div>
                            </div>
                    <%  } } else { %>
                        <p>No accounts found.</p>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
