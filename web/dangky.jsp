<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng ký</title>
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;

                background-image: url('img/1354206.jpeg');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                background-repeat: no-repeat;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;

                background-color: rgba(0, 0, 0, 0.2);
                background-blend-mode: darken;
            }

            .register-container {
                background: rgba(255, 255, 255, 0.85);
                padding: 40px;
                border-radius: 12px;
                box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
                width: 100%;
                max-width: 420px;
                backdrop-filter: blur(10px);
            }

            .register-container h1 {
                text-align: center;
                color: #333;
                margin-bottom: 30px;
                font-size: 28px;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .input-group {
                margin-bottom: 20px;
            }

            .input-group input {
                width: 100%;
                padding: 14px 15px;
                border: 1px solid #ccc;
                border-radius: 6px;
                font-size: 16px;
                transition: border-color 0.3s ease, box-shadow 0.3s ease;
                background: rgba(255, 255, 255, 0.9);
            }

            .input-group input:focus {
                outline: none;
                border-color: #007bff;
                box-shadow: 0 0 8px rgba(0, 123, 255, 0.5);
            }

            .btn-register {
                width: 100%;
                padding: 14px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 6px;
                font-size: 18px;
                cursor: pointer;
                transition: background-color 0.3s ease, transform 0.1s ease;
                font-weight: bold;
                margin-top: 10px;
            }

            .btn-register:hover {
                background-color: #0056b3;
            }

            .btn-register:active {
                transform: scale(0.98);
            }

            .login-link {
                text-align: center;
                margin-top: 20px;
                font-size: 14px;
                color: #555;
            }

            .login-link a {
                color: #007bff;
                text-decoration: none;
                font-weight: bold;
                transition: color 0.3s ease;
            }

            .login-link a:hover {
                color: #0056b3;
                text-decoration: underline;
            }


            .page-enter {
                animation: fadeInSlideUp 0.5s ease-out forwards;
                opacity: 0;
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
        <div class="register-container">
            <h1>Đăng ký</h1>
            <form action="dangky" method="POST">

                <%
                    String error = (String) request.getAttribute("error");
                    if (error != null) {
                %>
                <div style="color: #721c24; background-color: #f8d7da; border: 1px solid #f5c6cb; padding: 10px; border-radius: 5px; margin-bottom: 20px; text-align: center;">
                    <%= error%>
                </div>
                <% } %>

                <%

                    String successMsg = (String) session.getAttribute("message");
                    if (successMsg != null) {
                %>
                <div style="color: #155724; background-color: #d4edda; border: 1px solid #c3e6cb; padding: 10px; border-radius: 5px; margin-bottom: 20px; text-align: center;">
                    <%= successMsg%>
                </div>
                <%

                        session.removeAttribute("message");
                    }
                %>
                <div class="input-group">
                    <input type="text" name="username" placeholder="Nhập tên đăng nhập" required>
                </div>
                <div class="input-group">
                    <input type="password" name="password" placeholder="Nhập mật khẩu" required>
                </div>
                <div class="input-group">
                    <input type="password" name="repassword" placeholder="Nhập lại mật khẩu" required>
                </div>
                <div class="input-group">
                    <input type="email" name="email" placeholder="Email" required>
                </div>
                <div class="input-group">
                    <input type="text" name="fullname" placeholder="Nhập đầy đủ họ tên" required>
                </div>
                <button type="submit" class="btn-register">Đăng ký tài khoản</button>
            </form>
            <div class="login-link">
                Đã có tài khoản? <a href="dangnhap.jsp">Đăng nhập ngay</a>
            </div>
        </div>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const container = document.querySelector('.register-container');
                if (container) {
                    container.classList.add('page-enter');
                }

                const links = document.querySelectorAll('a[href="dangnhap.jsp"]');
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


            window.addEventListener('pageshow', function (event) {
                if (event.persisted) {
                    const container = document.querySelector('.register-container');
                    if (container) {
                        container.classList.remove('page-exit');
                        container.classList.add('page-enter');
                    }
                }
            });
        </script>
    </body>
</html>