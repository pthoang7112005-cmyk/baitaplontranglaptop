<%-- 
    Document   : dangnhap
    Created on : Apr 21, 2026, 9:41:04 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            body {
                background-image: url('img/hoang-hon-tren-bien-1.jpg');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                background-attachment: fixed;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                /* Thêm thuộc tính giúp hiển thị ảnh sắc nét hơn khi bị phóng to */
                image-rendering: -webkit-optimize-contrast;
                image-rendering: crisp-edges;
            }
            .login-container {
                background-color: rgba(255, 255, 255, 0.9);
                padding: 40px;
                border-radius: 12px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
                width: 380px;
            }
            .login-container h1 {
                margin-bottom: 30px;
                color: #333;
                text-align: center;
                font-size: 28px;
            }
            .input-group {
                margin-bottom: 20px;
            }
            .input-group label {
                display: block;
                margin-bottom: 8px;
                color: #555;
                font-weight: 600;
            }
            .input-group input {
                width: 100%;
                padding: 12px;
                border: 1px solid #ddd;
                border-radius: 6px;
                outline: none;
                transition: border-color 0.3s, box-shadow 0.3s;
                font-size: 14px;
            }
            .input-group input:focus {
                border-color: #007bff;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
            }
            .forgot-password {
                text-align: right;
                margin-bottom: 15px;
                margin-top: -10px;
                font-size: 13px;
            }
            .forgot-password a {
                color: #007bff;
                text-decoration: none;
                transition: color 0.3s;
            }
            .forgot-password a:hover {
                color: #0056b3;
                text-decoration: underline;
            }
            .btn-submit {
                width: 100%;
                padding: 14px;
                background-color: #007bff;
                border: none;
                border-radius: 6px;
                color: white;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s, transform 0.1s;
                margin-top: 10px;
            }
            .btn-submit:hover {
                background-color: #0056b3;
            }
            .btn-submit:active {
                transform: scale(0.98);
            }
            .register-link {
                text-align: center;
                margin-top: 20px;
                font-size: 14px;
                color: #555;
            }
            .register-link a {
                color: #007bff;
                text-decoration: none;
                font-weight: 600;
                transition: color 0.3s;
            }
            .register-link a:hover {
                color: #0056b3;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>

        <div class="login-container">
            <h1>Đăng nhập</h1>
            <% 
                String error = (String) request.getAttribute("error");
                if(error != null) {
            %>
                <div style="color: red; text-align: center; margin-bottom: 15px; font-weight: bold;">
                    <%= error %>
                </div>
            <% } %>
            <form action="dangnhap" method="POST">
                <div class="input-group">
                    <label for="username">Tên đăng nhập</label>
                    <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập" required />
                </div>
                <div class="input-group">
                    <label for="password">Mật khẩu</label>
                    <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required />
                </div>
                <div class="forgot-password">
                    <a href="quenmatkhau.jsp">Quên mật khẩu?</a>
                </div>
                <button type="submit" class="btn-submit">Đăng nhập</button>
                <div class="register-link">
                    Chưa có tài khoản? <a href="dangky.jsp">Đăng ký ngay</a>
                </div>
            </form>
        </div>

    </body>
</html>