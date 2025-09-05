<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Tej Bank Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #6a11cb, #b721ff, #8e2de2);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .login-card {
            background: #fff;
            padding: 2rem 2.5rem;
            border-radius: 1.2rem;
            box-shadow: 0 10px 25px rgba(0,0,0,0.25);
            width: 400px;
            animation: fadeIn 1s ease-in-out;
        }
        .login-card h2 {
            font-weight: bold;
            color: #6a11cb;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        .form-label {
            font-weight: 500;
            color: #5a189a;
        }
        .form-control {
            border-radius: 0.6rem;
            border: 1px solid #d1c4e9;
            padding: 10px;
        }
        .form-control:focus {
            border-color: #6a11cb;
            box-shadow: 0 0 6px rgba(106,17,203,0.5);
        }
        .btn-login {
            background: linear-gradient(90deg, #8e2de2, #6a11cb, #b721ff);
            border: none;
            color: white;
            font-weight: bold;
            border-radius: 0.6rem;
            padding: 10px;
            transition: 0.3s;
        }
        .btn-login:hover {
            transform: scale(1.03);
            box-shadow: 0 6px 18px rgba(138,43,226,0.5);
        }
        .link-register {
            text-align: center;
            margin-top: 1.2rem;
            font-size: 0.95rem;
        }
        .link-register a {
            color: #6a11cb;
            font-weight: bold;
            text-decoration: none;
        }
        .link-register a:hover {
            text-decoration: underline;
        }
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-20px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>

    <div class="login-card">
        <h2>🔐 Tej Bank Login</h2>

        <!-- Alert messages -->
        <%
            String msg = request.getParameter("msg");
            if ("registered".equals(msg)) {
        %>
            <div class="alert alert-success" role="alert">🎉 Registration successful! Please login.</div>
        <% } else if ("invalid".equals(msg)) { %>
            <div class="alert alert-danger" role="alert">❌ Invalid username or password. Try again.</div>
        <% } else if ("logout".equals(msg)) { %>
            <div class="alert alert-info" role="alert">👋 You have been logged out successfully.</div>
        <% } %>

        <!-- Login Form -->
        <form action="LoginServlet" method="post">
            <div class="mb-3 text-start">
                <label class="form-label">Username</label>
                <input type="text" name="username" class="form-control" placeholder="Enter your username" required>
            </div>
            <div class="mb-3 text-start">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn btn-login w-100">🚀 Login</button>
        </form>

        <div class="link-register">
            <p>New user? <a href="register.jsp">Register here</a></p>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
