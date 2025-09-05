<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.aurionpro.model.Transaction"%>
<%@ page import="com.aurionpro.model.Admin"%>

<%
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp?msg=invalid");
        return;
    }
    Admin admin = (Admin) sess.getAttribute("admin");
%>
<html>
<head>
<title>All Transactions</title>
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

	<div class="container">
		<h2>📑 All Transactions</h2>

		<!-- Filter Form -->
		<form method="get" action="SeeAllTransactionsServlet"
			class="filter-form">
			<label for="fromDate">From Date:</label> <input type="date"
				id="fromDate" name="fromDate"
				value="<%=request.getAttribute("fromDate") != null ? request.getAttribute("fromDate") : ""%>" />

			<label for="toDate">To Date:</label> <input type="date" id="toDate"
				name="toDate"
				value="<%=request.getAttribute("toDate") != null ? request.getAttribute("toDate") : ""%>" />

			<label for="type">Type:</label> <select id="type" name="type">
				<option value=""
					<%=(request.getAttribute("type") == null || "".equals(request.getAttribute("type"))) ? "selected" : ""%>>All</option>
				<option value="DEBIT"
					<%="DEBIT".equals(request.getAttribute("type")) ? "selected" : ""%>>Debit</option>
				<option value="CREDIT"
					<%="CREDIT".equals(request.getAttribute("type")) ? "selected" : ""%>>Credit</option>
			</select>

			<button type="submit">Filter</button>
		</form>

		<!-- Transactions Table -->
		<table border="1" cellpadding="10" cellspacing="0"
			class="styled-table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Customer ID</th>
					<th>Account ID</th>
					<th>From Account</th>
					<th>To Account</th>
					<th>Amount</th>
					<th>Type</th>
					<th>Status</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
				if (transactions != null && !transactions.isEmpty()) {
					for (Transaction tx : transactions) {
				%>
				<tr>
					<td><%=tx.getTransactionId()%></td>
					<td><%=tx.getCustomerId()%></td>
					<td><%=tx.getAccountId()%></td>
					<td><%=tx.getFromAccount()%></td>
					<td><%=tx.getToAccount()%></td>
					<td>₹ <%=tx.getAmount()%></td>
					<td><%=tx.getTransactionType()%></td>
					<td><%=tx.getStatus()%></td>
					<td><%=tx.getCreatedAt()%></td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="9">No transactions found for the selected
						filters.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	</div>
	</div>
	</div>
		<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
