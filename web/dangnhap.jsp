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
                background-color: rgba(0, 0, 0, 0.2);
                background-blend-mode: darken;
            }
            .login-container {
                background: rgba(255, 255, 255, 0.85);
                padding: 40px;
                border-radius: 12px;
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
                width: 100%;
                max-width: 380px;
                backdrop-filter: blur(10px);
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

            /* Hiệu ứng chuyển trang */
            .page-enter {
                animation: fadeInSlideUp 0.5s ease-out forwards;
                opacity: 0; /* Bắt đầu ẩn */
            }

            .page-exit {
                animation: fadeOutSlideDown 0.4s ease-in forwards;
            }

            @keyframes fadeInSlideUp {
                from {
                    opacity: 0;
                    transform: translateY(30px) scale(0.98);
                }
                to {
                    opacity: 1;
                    transform: translateY(0) scale(1);
                }
            }

            @keyframes fadeOutSlideDown {
                from {
                    opacity: 1;
                    transform: translateY(0) scale(1);
                }
                to {
                    opacity: 0;
                    transform: translateY(-30px) scale(0.98);
                }
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

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const container = document.querySelector('.login-container');
                if (container) {
                    container.classList.add('page-enter');
                }

                const links = document.querySelectorAll('a[href="dangky.jsp"]');
                links.forEach(link => {
                    link.addEventListener('click', function (e) {
                        e.preventDefault();
                        const targetUrl = this.href;

                        if (container) {
                            container.classList.remove('page-enter');
                            container.classList.add('page-exit');
                        }

                        setTimeout(() => {
                            window.location.href = targetUrl;
                        }, 350); 
                    });
                });
            });

            // Xử lý lỗi khi người dùng ấn nút Back của trình duyệt (bfcache)
            window.addEventListener('pageshow', function (event) {
                if (event.persisted) {
                    const container = document.querySelector('.login-container');
                    if (container) {
                        container.classList.remove('page-exit');
                        container.classList.add('page-enter');
                    }
                }
            });
        </script>
    </body>
</html>