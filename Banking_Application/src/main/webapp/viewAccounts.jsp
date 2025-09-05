<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.aurionpro.model.Admin" %>
<%@ page import="com.aurionpro.model.Account"%>
<%@ page import="java.util.List"%>
<%@ page import="com.aurionpro.service.AccountService"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp?msg=invalid");
        return;
    }
    Admin admin = (Admin) sess.getAttribute("admin");
    AccountService accountService = new AccountService();
    List<Account> accounts = accountService.fetchAllAccounts();
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Accounts - Tej Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #fdfcff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .sidebar {
            height: 100vh;
            background: linear-gradient(180deg, #6f42c1, #a64ca6, #d63384);
            color: white;
            padding-top: 2rem;
            position: fixed;
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
        .dashboard-content {
            margin-left: 17%;
            padding: 2rem;
        }
        .table-container {
            background: white;
            padding: 1.5rem;
            border-radius: 1rem;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #fafafa;
        }
    </style>
</head>
<body>
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
            <a href="viewAccounts">🏦 See All Accounts</a>
            <a href="viewTransactions.jsp">💸 See All Transactions</a>
            <a href="approveAccounts.jsp">✅ Approve Accounts</a>
        </div>

        <!-- Main Content -->
        <div class="col-md-9 col-lg-10 dashboard-content">
            <div class="table-container">
                <h2>👥 All Accounts</h2>
                <% if(accounts.isEmpty()) { %>
                    <div class="alert alert-info">No Accounts added yet.</div>
                <% } else { %>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Customer ID</th>
                                <th>Account Number</th>
                                <th>Type</th>
                                <th>Balance</th>
                                <th>Status</th>
                                <th>Branch</th>
                                <th>IFSC</th>
                                <th>Created At</th>
                            </tr>
                            
                        </thead>
                        <tbody>
                            <%
									for (Account a : accounts) {
									%>
                                <tr>
                                   
                                    
                                    <td><%=a.getAccountId()%></td>
										<td><%=a.getCustomerId()%></td>
										<td><%=a.getAccountNumber()%></td>
										<td><%=a.getAccountType()%></td>
										<td><%=a.getBalance()%></td>
										<td><%=a.getStatus()%></td>
										<td><%=a.getBranch()%></td>
										<td><%=a.getIfscCode()%></td>
										<td><%=a.getCreatedAt()%></td>
                                </tr>
                            <%
									}
									%>
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
