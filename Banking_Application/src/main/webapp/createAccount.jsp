<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.aurionpro.model.Customer" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("customer") == null) {
        response.sendRedirect("login.jsp?msg=invalid");
        return;
    }
    Customer customer = (Customer) sess.getAttribute("customer");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Create Account - Tej Bank</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        .sidebar a { color: white; text-decoration: none; display: block; padding: 12px 20px; }
        .dashboard-content { margin-left: 17%; padding: 2rem; }
        .form-card { border: none; border-radius: 1rem; box-shadow: 0 5px 15px rgba(0,0,0,0.1); padding: 2rem; background: #fff; }
        .form-card h3 { color: #6f42c1; font-weight: bold; margin-bottom: 1.5rem; }
        .btn-success { background: linear-gradient(90deg, #6f42c1, #a64ca6, #d63384); border: none; font-weight: bold; }
    </style>
    <script>
        function generateAccountNumber() {
            let branch = document.getElementById("branch").value;
            if(branch) {
                let prefix = branch.substring(0, 2).toUpperCase();
                let random = Math.floor(10000000 + Math.random() * 90000000);
                let accNo = prefix + random;
                document.getElementById("accountNumber").value = accNo;
            }
        }
    </script>
</head>
<body>

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
            
          
            
            
                <h3>➕ Create New Account</h3>
           <div class="container mt-5">
    <h2>Create New Bank Account</h2>
    <form action="${pageContext.request.contextPath}/CreateAccountServlet" method="post">
        <div class="mb-3">
            <label>Account Type</label>
            <select name="accountType" class="form-control" required>
                <option value="">Select Type</option>
                <option value="SAVINGS">SAVINGS</option>
                <option value="CURRENT">CURRENT</option>
            </select>
        </div>
        <div class="mb-3">
            <label>Initial Deposit</label>
            <input type="number" name="balance" class="form-control" min="0" placeholder="Enter initial deposit" required>
        </div>
        <button type="submit" class="btn btn-primary">Create Account</button>
    </form>
            </div>
        </div>
    </div>
    
      
            <% 
    String msg = request.getParameter("msg");
    if ("success".equals(msg)) { 
%>
    <div class="alert alert-success" role="alert">
        🎉 Account created successfully!
    </div>
<% 
    } else if ("fail".equals(msg)) { 
%>
    <div class="alert alert-danger" role="alert">
        ❌ Account not created successfully. Please try again.
    </div>
<% 
    } 
%>
    
</div></div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
