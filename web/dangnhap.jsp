<%-- 
    Document   : dangnhap
    Created on : Apr 21, 2026, 9:41:04 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng nhập</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- FontAwesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            body {
                /* Gradient Pink & Blue background */
                background: linear-gradient(135deg, #ff7eb3 0%, #4facfe 100%);
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
            }
            .login-card {
                background: #ffffff;
                border-radius: 12px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
                width: 100%;
                max-width: 400px;
                overflow: hidden;
            }
            .login-header {
                text-align: center;
                padding: 30px 20px 20px;
            }
            .login-header h2 {
                font-weight: 700;
                /* Gradient text pink to blue */
                background: linear-gradient(to right, #e83e8c, #0d6efd);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                margin-bottom: 5px;
            }
            .login-header p {
                color: #6c757d;
                font-size: 0.95rem;
                margin-bottom: 0;
            }
            .login-body {
                padding: 0 30px 30px;
            }
            .form-control {
                border-radius: 8px;
                padding: 12px 15px;
                border: 1px solid #ced4da;
            }
            .form-control:focus {
                border-color: #0d6efd;
                box-shadow: none;
            }
            .input-group {
                border: 1px solid #ced4da;
                border-radius: 8px;
                transition: border-color 0.3s, box-shadow 0.3s;
                overflow: hidden;
            }
            .input-group:focus-within {
                border-color: #0d6efd;
                box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
            }
            .input-group .form-control {
                border: none;
                border-radius: 0;
                padding-left: 0;
            }
            .input-group-text {
                background-color: transparent;
                border: none;
                color: #0d6efd;
                padding-right: 10px;
            }
            .icon-pink {
                color: #e83e8c !important;
            }
            .btn-login {
                /* Thegioididong style button: bold, large, vibrant */
                background: linear-gradient(to right, #0d6efd, #e83e8c);
                border: none;
                border-radius: 8px;
                padding: 14px;
                font-weight: 700;
                font-size: 1rem;
                width: 100%;
                color: white;
                transition: all 0.3s ease;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }
            .btn-login:hover {
                background: linear-gradient(to right, #0b5ed7, #d63384);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.2);
                color: white;
            }
            .btn-login:active {
                transform: scale(0.98);
            }
            .forgot-password {
                font-size: 0.85rem;
                text-align: right;
                margin-top: 8px;
                margin-bottom: 25px;
            }
            .forgot-password a {
                color: #e83e8c;
                text-decoration: none;
                font-weight: 600;
            }
            .forgot-password a:hover {
                text-decoration: underline;
                color: #d63384;
            }
            .register-link {
                text-align: center;
                font-size: 0.95rem;
                margin-top: 25px;
                color: #495057;
            }
            .register-link a {
                color: #0d6efd;
                font-weight: 600;
                text-decoration: none;
            }
            .register-link a:hover {
                text-decoration: underline;
                color: #0b5ed7;
            }
            /* Animations */
            .page-enter {
                animation: fadeInSlideUp 0.5s ease-out forwards;
                opacity: 0;
            }
            .page-exit {
                animation: fadeOutSlideDown 0.4s ease-in forwards;
            }
            @keyframes fadeInSlideUp {
                from { opacity: 0; transform: translateY(30px) scale(0.98); }
                to { opacity: 1; transform: translateY(0) scale(1); }
            }
            @keyframes fadeOutSlideDown {
                from { opacity: 1; transform: translateY(0) scale(1); }
                to { opacity: 0; transform: translateY(-30px) scale(0.98); }
            }
        </style>
    </head>
    <body>

        <div class="login-card page-enter">
            <div class="login-header">
                <h2>Đăng nhập</h2>
                <p>Chào mừng bạn quay trở lại!</p>
            </div>
            
            <div class="login-body">
                <% 
                    String error = (String) request.getAttribute("error");
                    if(error != null) {
                %>
                    <div class="alert alert-danger py-2 text-center" role="alert" style="font-size: 0.9rem;">
                        <i class="fas fa-exclamation-circle me-1"></i> <%= error %>
                    </div>
                <% } %>
                
                <% 
                    String successMsg = (String) session.getAttribute("message");
                    if(successMsg != null) {
                %>
                    <div class="alert alert-success py-2 text-center" role="alert" style="font-size: 0.9rem;">
                        <i class="fas fa-check-circle me-1"></i> <%= successMsg %>
                    </div>
                <% 
                        session.removeAttribute("message");
                    } 
                %>

                <form action="dangnhap" method="POST">
                    <div class="mb-3">
                        <label for="username" class="form-label fw-bold" style="color: #495057; font-size: 0.9rem;">Tên đăng nhập</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <input type="text" class="form-control" id="username" name="username" placeholder="Nhập tên đăng nhập" required />
                        </div>
                    </div>
                    
                    <div class="mb-2">
                        <label for="password" class="form-label fw-bold" style="color: #495057; font-size: 0.9rem;">Mật khẩu</label>
                        <div class="input-group">
                            <span class="input-group-text icon-pink"><i class="fas fa-lock"></i></span>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required />
                        </div>
                    </div>
                    
                    <div class="forgot-password">
                        <a href="quenmatkhau.jsp">Quên mật khẩu?</a>
                    </div>
                    
                    <button type="submit" class="btn btn-login">
                        ĐĂNG NHẬP
                    </button>
                    
                    <div class="register-link">
                        Chưa có tài khoản? <a href="dangky.jsp">Đăng ký ngay</a>
                    </div>
                </form>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const container = document.querySelector('.login-card');
                
                const links = document.querySelectorAll('.register-link a, .forgot-password a');
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

                const form = document.querySelector('form');
                if (form) {
                    form.addEventListener('submit', function (e) {
                        e.preventDefault();
                        const btn = form.querySelector('.btn-login');
                        if (btn) {
                            btn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Đang xử lý...';
                            btn.style.opacity = '0.8';
                            btn.style.cursor = 'not-allowed';
                        }

                        if (container) {
                            container.classList.remove('page-enter');
                            container.classList.add('page-exit');
                        }

                        setTimeout(() => {
                            form.submit();
                        }, 400); 
                    });
                }
            });

            window.addEventListener('pageshow', function (event) {
                if (event.persisted) {
                    const container = document.querySelector('.login-card');
                    const btn = document.querySelector('.btn-login');
                    if (container) {
                        container.classList.remove('page-exit');
                        container.classList.add('page-enter');
                    }
                    if (btn) {
                        btn.innerHTML = 'ĐĂNG NHẬP';
                        btn.style.opacity = '1';
                        btn.style.cursor = 'pointer';
                    }
                }
            });
        </script>
    </body>
</html>