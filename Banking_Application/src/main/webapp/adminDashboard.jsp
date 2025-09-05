<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.aurionpro.model.Admin" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp?msg=invalid");
        return;
    }
    Admin admin = (Admin) sess.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Tej Bank</title>
    <!-- Bootstrap CSS -->
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
        .welcome-box {
            background: linear-gradient(135deg, #6f42c1, #a64ca6, #d63384);
            color: white;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            text-align: center;
            margin-bottom: 2rem;
        }
        .welcome-box h2 {
            font-weight: bold;
            font-size: 2rem;
        }
        .welcome-box p {
            margin-top: 1rem;
            font-size: 1.1rem;
        }
        .feature-card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        .feature-card:hover {
            transform: translateY(-5px);
        }
        .feature-card .card-body {
            text-align: center;
            padding: 2rem 1rem;
        }
        .feature-card h5 {
            color: #6f42c1;
            font-weight: bold;
        }
    </style>
</head>
<body>

<!-- Admin Username display at top right corner -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Tej Bank Admin</a>
    <div class="collapse navbar-collapse justify-content-end">
      <ul class="navbar-nav">
        <li class="nav-item">
          <span class="nav-link">👑 Welcome, <b><%= admin.getFullName() %></b></span>
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
            <h4 class="text-center mb-4">🏦 Admin Panel</h4>
            <a href="adminDashboard.jsp">🏠 Home</a>
            <a href="viewCustomers.jsp">👥 See All Customers</a>
            <a href="viewAccounts.jsp">🏦 See All Accounts</a>
            <a href="viewTransactions.jsp">💸 See All Transactions</a>
            <a href="approveAccounts.jsp">✅ Approve Accounts</a>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 col-lg-10 dashboard-content">
            <!-- Welcome Section -->
            <div class="welcome-box">
                <h2>Welcome, <%= admin.getFullName() %> </h2>
                <h4>To <b>Tej Bank Admin Panel</b></h4>
                <p>Manage customers, accounts, transactions, and approvals efficiently. Your actions here help keep Tej Bank secure and organized.</p>
            </div>

            <!-- Feature Highlights -->
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card feature-card">
                        <div class="card-body">
                            <h5>Customer Management</h5>
                            <p>View all registered customers and manage their profiles effectively.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card">
                        <div class="card-body">
                            <h5>Account Oversight</h5>
                            <p>Monitor all accounts, approve or reject new account requests.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card">
                        <div class="card-body">
                            <h5>Transactions Overview</h5>
                            <p>Track all transactions and ensure smooth financial operations.</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
