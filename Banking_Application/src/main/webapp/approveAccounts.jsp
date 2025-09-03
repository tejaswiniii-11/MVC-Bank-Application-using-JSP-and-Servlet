<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.aurionpro.model.Account" %>
<%@ page import="com.aurionpro.model.Admin" %>
<%@ page import="com.aurionpro.service.AccountService" %>

<%
    HttpSession sess = request.getSession(false);
    if(sess == null || sess.getAttribute("admin") == null){
        response.sendRedirect("login.jsp?msg=invalid");
        return;
    }

    Admin admin = (Admin) sess.getAttribute("admin");
    List<Account> accounts = (List<Account>) request.getAttribute("accounts");
%>

<html>
<head>
    <title>Approve Accounts</title>
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
            <a href="ApproveAccountsServlet">✅ Approve Accounts</a>
        </div>




 <div class="col-md-9 col-lg-10 dashboard-content">
            <div class="table-card">
                <h3>✅ Approve / Reject Accounts</h3>
<%
    if (accounts == null || accounts.isEmpty()) {
%>
    <div class="alert alert-info">No accounts added yet.</div>
<%
    } else {
%>
    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>Account ID</th>
            <th>Customer ID</th>
            <th>Account Number</th>
            <th>Type</th>
            <th>Balance</th>
            <th>Status</th>
            <th>Branch</th>
            <th>IFSC</th>
            <th>Created At</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Account acc : accounts) {
        %>
        <tr>
            <td><%= acc.getAccountId() %></td>
            <td><%= acc.getCustomerId() %></td>
            <td><%= acc.getAccountNumber() %></td>
            <td><%= acc.getAccountType() %></td>
            <td>₹ <%= acc.getBalance() %></td>
            <td><%= acc.getStatus() %></td>
            <td><%= acc.getBranch() %></td>
            <td><%= acc.getIfscCode() %></td>
            <td><%= acc.getCreatedAt() %></td>
            <td>
                <form method="post" action="ApproveAccountsServlet" style="display:inline;">
                    <input type="hidden" name="accountId" value="<%= acc.getAccountId() %>" />
                    <button type="submit" name="action" value="approve">Approve</button>
                </form>
                <form method="post" action="ApproveAccountsServlet" style="display:inline;">
                    <input type="hidden" name="accountId" value="<%= acc.getAccountId() %>" />
                    <button type="submit" name="action" value="reject" class="btn-reject">Reject</button>
                </form>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
<%
    }
%>

</div>
</div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
