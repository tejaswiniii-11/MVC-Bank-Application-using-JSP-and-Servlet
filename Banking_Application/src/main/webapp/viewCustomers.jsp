<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.aurionpro.model.Admin"%>
<%@ page import="com.aurionpro.model.Customer"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.aurionpro.service.CustomerService"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
HttpSession sess = request.getSession(false);
if (sess == null || sess.getAttribute("admin") == null) {
	response.sendRedirect("login.jsp?msg=invalid");
	return;
}
Admin admin = (Admin) sess.getAttribute("admin");
CustomerService customerService = new CustomerService();
List<Customer> customers = customerService.fetchAllCustomers();
%>

<!DOCTYPE html>
<html>
<head>
<title>All Customers - Tej Bank</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	height: 100vh;
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
	background: rgba(255, 255, 255, 0.2);
	transform: translateX(5px);
}

.dashboard-content {
	margin-left: 17%;
	padding: 2rem;
}

.table-container {
	background: white;
	padding: 2rem;
	border-radius: 1rem;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

table {
	border-collapse: collapse;
	width: 100%;
}

th {
	background-color: #6f42c1;
	color: white;
}

tr:hover {
	background-color: #f9f9f9;
}

h2 {
	font-weight: bold;
	color: #6f42c1;
	margin-bottom: 1.5rem;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Tej Bank Admin</a>
			<div class="collapse navbar-collapse justify-content-end">
				<ul class="navbar-nav">
					<li class="nav-item"><span class="nav-link">👑 Welcome,
							<b><%=admin.getFullName()%></b>
					</span></li>
					<li class="nav-item"><a class="nav-link" href="LogoutServlet">🚪
							Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<!-- Sidebar -->
			<div class="col-md-3 col-lg-2 sidebar d-flex flex-column">
				<h4 class="text-center mb-4">🏦 Admin Panel</h4>
				<a href="adminDashboard.jsp">🏠 Home</a> <a href="viewCustomers.jsp"
					class="fw-bold bg-white text-dark">👥 See All Customers</a> <a
					href="viewAccounts.jsp">🏦 See All Accounts</a> <a
					href="viewTransactions.jsp">💸 See All Transactions</a> <a
					href="approveAccounts.jsp">✅ Approve Accounts</a>
			</div>

			<!-- Main Content -->
			<div class="col-md-9 col-lg-10 dashboard-content">
				<div class="table-container">
					<h2>👥 All Customers</h2>
					 <% if(customers.isEmpty()) { %>
                    <div class="alert alert-info">No Customers added yet.</div>
                <% } else { %>
                    
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>Customer Id</th>
										<th>Username</th>
										<th>Full Name</th>
										<th>Email</th>
										<th>Phone</th>
										<th>Created At</th>
									</tr>
									 </thead>
									 <tbody>
									<%
									for (Customer c : customers) {
									%>
									<tr>
										<td><%=c.getCustomerId()%></td>
										<td><%=c.getUsername()%></td>
										<td><%=c.getFullName()%></td>
										<td><%=c.getEmail()%></td>
										<td><%=c.getPhone()%></td>
										<td><%=c.getCreatedAt()%></td>
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
	

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
