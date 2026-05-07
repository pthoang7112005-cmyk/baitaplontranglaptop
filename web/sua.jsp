<%-- 
    Document   : sua
    Created on : Apr 22, 2026, 11:54:20 PM
    Author     : LENOVO
--%>

<%@page import="java.util.List"%>
<%@page import="model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sửa Người Dùng</title>
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
            .form-card {
                background: #ffffff;
                border-radius: 12px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
                width: 100%;
                max-width: 450px;
                overflow: hidden;
            }
            .form-header {
                text-align: center;
                padding: 30px 20px 20px;
            }
            .form-header h2 {
                font-weight: 700;
                /* Gradient text pink to blue */
                background: linear-gradient(to right, #e83e8c, #0d6efd);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                margin-bottom: 5px;
            }
            .form-header p {
                color: #6c757d;
                font-size: 0.95rem;
                margin-bottom: 0;
            }
            .form-body {
                padding: 0 30px 30px;
            }
            .form-control {
                border-radius: 8px;
                padding: 12px 15px;
                border: 1px solid #ced4da;
                font-size: 0.95rem;
            }
            .form-control:focus {
                border-color: #0d6efd;
                box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
            }
            .form-control[readonly] {
                background-color: #f8f9fa;
                cursor: not-allowed;
            }
            .form-select {
                border-radius: 8px;
                padding: 12px 15px;
                border: 1px solid #ced4da;
                font-size: 0.95rem;
            }
            .form-select:focus {
                border-color: #0d6efd;
                box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
            }
            .form-label {
                font-weight: 600;
                color: #495057;
                font-size: 0.9rem;
                margin-bottom: 6px;
            }
            .btn-submit {
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
            .btn-submit:hover {
                background: linear-gradient(to right, #0b5ed7, #d63384);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.2);
                color: white;
            }
            .btn-submit:active {
                transform: scale(0.98);
            }
            .btn-back {
                background-color: #6c757d;
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
                text-decoration: none;
                display: inline-block;
                text-align: center;
                margin-top: 10px;
            }
            .btn-back:hover {
                background-color: #5c636a;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.2);
                color: white;
            }
            .alert {
                border-radius: 8px;
                font-size: 0.9rem;
            }
            /* Animations */
            .page-enter {
                animation: fadeInSlideUp 0.5s ease-out forwards;
                opacity: 0;
            }
            @keyframes fadeInSlideUp {
                from { opacity: 0; transform: translateY(30px) scale(0.98); }
                to { opacity: 1; transform: translateY(0) scale(1); }
            }
        </style>
    </head>
    <body>
        <div class="form-card page-enter">
            <div class="form-header">
                <h2><i class="fas fa-user-edit me-2"></i>Sửa Người Dùng</h2>
                <p>Cập nhật thông tin chi tiết</p>
            </div>
            
            <div class="form-body">
                <%
                    // Lấy ID từ tham số URL
                    String id = request.getParameter("id");
                    String username = "";
                    String password = "";
                    String email = "";
                    String fullname = "";
                    int role = 1;

                    // Lấy dữ liệu user từ suadao
                    if (id != null && !id.trim().isEmpty()) {
                        model.suadao dao = new model.suadao();
                        List<user> list = dao.GetALL();
                        if (list != null) {
                            for (user u : list) {
                                if (String.valueOf(u.getId()).equals(id)) {
                                    username = u.getUsername() != null ? u.getUsername() : "";
                                    password = u.getPassword() != null ? u.getPassword() : "";
                                    email = u.getEmail() != null ? u.getEmail() : "";
                                    fullname = u.getFullnameString() != null ? u.getFullnameString() : "";
                                    role = u.getRole();
                                    break;
                                }
                            }
                        }
                    }
                %>

                <% 
                    String error = (String) request.getAttribute("error");
                    if(error != null) {
                %>
                    <div class="alert alert-danger py-2 text-center" role="alert">
                        <i class="fas fa-exclamation-circle me-1"></i> <%= error %>
                    </div>
                <% } %>
                
                <% 
                    String successMsg = (String) session.getAttribute("message");
                    if(successMsg != null) {
                %>
                    <div class="alert alert-success py-2 text-center" role="alert">
                        <i class="fas fa-check-circle me-1"></i> <%= successMsg %>
                    </div>
                <% 
                        session.removeAttribute("message");
                    } 
                %>

                <form action="sua" method="POST">
                    <div class="mb-3">
                        <label for="id" class="form-label"><i class="fas fa-id-badge me-2 text-primary"></i>ID Người Dùng</label>
                        <input type="text" id="id" name="id" class="form-control" value="<%= (id != null) ? id : "" %>" readonly>
                    </div>
                    
                    <div class="mb-3">
                        <label for="username" class="form-label"><i class="fas fa-user me-2 text-primary"></i>Tên Đăng Nhập</label>
                        <input type="text" id="username" name="username" class="form-control" value="<%= username %>" required placeholder="Nhập tên đăng nhập...">
                    </div>
                    
                    <div class="mb-3">
                        <label for="password" class="form-label"><i class="fas fa-lock me-2 text-primary"></i>Mật Khẩu</label>
                        <input type="text" id="password" name="password" class="form-control" value="<%= password %>" required placeholder="Nhập mật khẩu...">
                    </div>
                    
                    <div class="mb-3">
                        <label for="email" class="form-label"><i class="fas fa-envelope me-2 text-primary"></i>Email</label>
                        <input type="email" id="email" name="email" class="form-control" value="<%= email %>" required placeholder="Nhập địa chỉ email...">
                    </div>
                    
                    <div class="mb-3">
                        <label for="fullname" class="form-label"><i class="fas fa-id-card me-2 text-primary"></i>Họ và Tên</label>
                        <input type="text" id="fullname" name="fullname" class="form-control" value="<%= fullname %>" required placeholder="Nhập họ và tên...">
                    </div>
                    
                    <div class="mb-4">
                        <label for="role" class="form-label"><i class="fas fa-user-tag me-2 text-primary"></i>Vai Trò</label>
                        <select id="role" name="role" class="form-select">
                            <option value="0" <%= (role == 0) ? "selected" : "" %>>Admin</option>
                            <option value="1" <%= (role == 1) ? "selected" : "" %>>User</option>
                        </select>
                    </div>

                    <button type="submit" class="btn-submit">
                        <i class="fas fa-save me-2"></i>Lưu Thay Đổi
                    </button>
                </form>

                <a href="quanly" class="btn-back">
                    <i class="fas fa-arrow-left me-2"></i>Quay Lại
                </a>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </div>
    </body>
</html>