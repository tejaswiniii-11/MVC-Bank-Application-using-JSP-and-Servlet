<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Registration - Tej Bank</title>
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
        .register-card {
            background: #fff;
            padding: 1.5rem 2rem;
            border-radius: 1rem;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            width: 360px; /* Reduced width */
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }
        .register-card h2 {
            font-weight: bold;
            color: #6a11cb;
            margin-bottom: 0.8rem;
            font-size: 1.5rem;
        }
        .register-card p {
            font-size: 0.9rem;
            margin-bottom: 1.2rem;
            color: #6c757d;
        }
        .form-label {
            font-weight: 500;
            font-size: 0.9rem;
            color: #5a189a;
        }
        .form-control {
            border-radius: 0.5rem;
            border: 1px solid #d1c4e9;
            padding: 8px;
            font-size: 0.9rem;
        }
        .form-control:focus {
            border-color: #6a11cb;
            box-shadow: 0 0 5px rgba(106,17,203,0.4);
        }
        .btn-register {
            background: linear-gradient(90deg, #8e2de2, #6a11cb, #b721ff);
            border: none;
            color: white;
            font-weight: 600;
            border-radius: 0.5rem;
            padding: 8px;
            margin-top: 0.5rem;
            font-size: 0.95rem;
            transition: 0.3s;
        }
        .btn-register:hover {
            transform: scale(1.03);
            box-shadow: 0 6px 15px rgba(138,43,226,0.4);
        }
        .link-login {
            margin-top: 0.8rem;
            font-size: 0.9rem;
        }
        .link-login a {
            color: #6a11cb;
            font-weight: bold;
            text-decoration: none;
        }
        .link-login a:hover {
            text-decoration: underline;
        }
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-15px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>
</head>
<body>

    <div class="register-card">
        <h2>✨ Tej Bank Registration</h2>
        <p>Open your account with us and enjoy smart banking!</p>

        <!-- Registration Form -->
        <form action="RegisterServlet" method="post">
            <div class="mb-2 text-start">
                <label class="form-label">Full Name</label>
                <input type="text" name="full_name" class="form-control" placeholder="Enter full name" required>
            </div>
            <div class="mb-2 text-start">
                <label class="form-label">Username</label>
                <input type="text" name="username" class="form-control" placeholder="Choose a username" required>
            </div>
            <div class="mb-2 text-start">
                <label class="form-label">Email Address</label>
                <input type="email" name="email" class="form-control" placeholder="Enter email" required>
            </div>
            <div class="mb-2 text-start">
                <label class="form-label">Phone Number</label>
                <input type="text" name="phone" class="form-control" placeholder="Enter phone" required>
            </div>
            <div class="mb-2 text-start">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" placeholder="Create password" required>
            </div>
            <button type="submit" class="btn btn-register w-100">🚀 Register</button>
        </form>

        <div class="link-login">
            <p>Already a customer? <a href="login.jsp">Login here</a></p>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
