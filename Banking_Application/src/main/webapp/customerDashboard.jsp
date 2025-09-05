<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.aurionpro.model.Customer" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("customer") == null) {
        response.sendRedirect("login.jsp?msg=invalid");
        return;
    }
    Customer cust = (Customer) sess.getAttribute("customer");
%>

  <%
    com.aurionpro.model.Customer customer = (com.aurionpro.model.Customer) session.getAttribute("customer");
    if (customer == null) {
        response.sendRedirect("login.jsp?msg=invalid"); // session expired or not logged in
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard - Tej Bank</title>
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
        /* Cards for Features */
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
        .bank-info {
            margin-top: 2rem;
            padding: 1.5rem;
            background: #f8f0fc;
            border-left: 5px solid #a64ca6;
            border-radius: 0.5rem;
        }
    </style>
</head>
<body>

<!-- Customer Username display at top right corner -->
         
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Tej Bank</a>
    <div class="collapse navbar-collapse justify-content-end">
      <ul class="navbar-nav">
        <li class="nav-item">
          <span class="nav-link">👤 Welcome, <b><%= customer.getUsername() %></b></span>
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
           
        </div>
        
         

        <!-- Main Content -->
        <div class="col-md-9 col-lg-10 dashboard-content">
            <!-- Welcome Section -->
            <div class="welcome-box">
                <h2>Welcome, <%= cust.getFullName() %> </h2>
                <h4>To <b>Tej Bank</b> - Your Trusted Financial Partner</h4>
                <p>Thank you for banking with us. At Tej Bank, we prioritize <b>security, innovation, and customer satisfaction</b>. Explore the services on your left and manage your finances with ease.</p>
            </div>
            
          
            

            <!-- Feature Highlights -->
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card feature-card">
                        <div class="card-body">
                            <h5>Open New Account</h5>
                            <p>Quickly open savings or current accounts with attractive benefits.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card">
                        <div class="card-body">
                            <h5>Instant Payments</h5>
                            <p>Transfer money securely and instantly to beneficiaries worldwide.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card">
                        <div class="card-body">
                            <h5>Digital Passbook</h5>
                            <p>Track all your transactions and balances anytime, anywhere.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- About Bank Section -->
            <div class="bank-info">
                <h5>Why Choose Tej Bank?</h5>
                <ul>
                    <li>24x7 secure online banking services</li>
                    <li>Trusted by thousands of happy customers</li>
                    <li>Easy payments, savings, and financial growth</li>
                    <li>Dedicated customer support for your needs</li>
                </ul>
                <p>With Tej Bank, your money is not just safe, it grows. Thank you for trusting us with your financial journey!</p>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
