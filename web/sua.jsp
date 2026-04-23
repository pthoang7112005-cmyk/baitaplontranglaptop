<%-- 
    Document   : sua
    Created on : Apr 22, 2026, 11:54:20 PM
    Author     : LENOVO
--%>

<%@page import="java.util.List"%>
<%@page import="model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sửa người dùng</title>
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            body {
                background-color: #f4f7f6;
                display: flex;
                height: 100vh;
                overflow: hidden;
            }
            .app-container {
                display: flex;
                width: 100%;
                height: 100%;
            }
            /* Sidebar đồng bộ với quanly.jsp */
            .admin-panel {
                width: 250px;
                background-color: #212529;
                color: white;
                display: flex;
                flex-direction: column;
                height: 100%;
            }
            .admin-panel h2 {
                padding: 20px;
                font-size: 22px;
                font-weight: 600;
                margin-bottom: 10px;
                text-align: center;
                border-bottom: 1px solid #343a40;
            }
            .admin-panel a {
                color: #ffffff;
                text-decoration: none;
                padding: 15px 20px;
                display: block;
                font-size: 15px;
                transition: 0.3s;
            }
            .admin-panel a:hover, .admin-panel a.active {
                background-color: #343a40;
                border-left: 4px solid #0d6efd;
            }
            
            /* Main Content */
            .main-content {
                flex: 1;
                background-image: url('img/1354206.jpeg');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                padding: 40px;
                overflow-y: auto;
                display: flex;
                justify-content: center;
                align-items: flex-start;
            }

            /* Form Card */
            .form-card {
                background-color: rgba(255, 255, 255, 0.95);
                border-radius: 10px;
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
                width: 100%;
                max-width: 600px;
                padding: 35px 40px;
                margin-top: 20px;
            }
            .form-header {
                text-align: center;
                margin-bottom: 30px;
            }
            .form-header h1 {
                font-size: 28px;
                color: #212529;
                font-weight: 600;
            }
            .form-header p {
                color: #6c757d;
                font-size: 15px;
                margin-top: 5px;
            }

            .form-group {
                margin-bottom: 20px;
            }
            .form-group label {
                display: block;
                font-weight: 600;
                margin-bottom: 8px;
                color: #495057;
                font-size: 14px;
            }
            .form-control {
                width: 100%;
                padding: 12px 15px;
                font-size: 15px;
                border: 1px solid #ced4da;
                border-radius: 6px;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }
            .form-control:focus {
                border-color: #86b7fe;
                outline: 0;
                box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
            }
            .form-control:disabled, .form-control[readonly] {
                background-color: #e9ecef;
                color: #6c757d;
                cursor: not-allowed;
            }

            .btn-container {
                display: flex;
                justify-content: space-between;
                margin-top: 30px;
                gap: 15px;
            }
            .btn {
                padding: 12px 20px;
                font-size: 16px;
                font-weight: 600;
                border-radius: 6px;
                border: none;
                cursor: pointer;
                transition: 0.3s;
                text-align: center;
                text-decoration: none;
                flex: 1;
            }
            .btn-save {
                background-color: #0d6efd;
                color: white;
            }
            .btn-save:hover {
                background-color: #0b5ed7;
            }
            .btn-cancel {
                background-color: #6c757d;
                color: white;
            }
            .btn-cancel:hover {
                background-color: #5c636a;
            }
        </style>
    </head>
    <body>
        <div class="app-container">
            <div class="admin-panel">
                <h2>Admin Panel</h2>
                <a href="quanly" class="active">Quản lý người dùng</a>
                <a href="quanlysanpham">Quản lý sản phẩm</a>
                <a href="quanlydonhang">Quản lý đơn hàng</a>
            </div>
            
            <div class="main-content">
                <div class="form-card">
                    <div class="form-header">
                        <h1>Sửa Người Dùng</h1>
                        <p>Cập nhật thông tin chi tiết của người dùng</p>
                    </div>

                    <%
                        // Lấy ID từ tham số URL
                        String id = request.getParameter("id");
                        String username = "";
                        String password = "";
                        String email = "";
                        String fullname = "";
                        int role = 1;

                        // Lấy dữ liệu user trực tiếp từ suadao để đảm bảo luôn có dữ liệu khi gọi từ quanly.jsp
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

                    <form action="sua" method="POST">
                        <div class="form-group">
                            <label for="id">ID Người Dùng</label>
                            <input type="text" id="id" name="id" class="form-control" value="<%= (id != null) ? id : "" %>" readonly>
                        </div>
                        
                        <div class="form-group">
                            <label for="username">Tên Đăng Nhập</label>
                            <input type="text" id="username" name="username" class="form-control" value="<%= username %>" required placeholder="Nhập tên đăng nhập...">
                        </div>
                        
                        <div class="form-group">
                            <label for="password">Mật Khẩu</label>
                            <input type="text" id="password" name="password" class="form-control" value="<%= password %>" required placeholder="Nhập mật khẩu...">
                        </div>
                        
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" class="form-control" value="<%= email %>" required placeholder="Nhập địa chỉ email...">
                        </div>
                        
                        <div class="form-group">
                            <label for="fullname">Họ và Tên</label>
                            <input type="text" id="fullname" name="fullname" class="form-control" value="<%= fullname %>" required placeholder="Nhập họ và tên...">
                        </div>
                        
                        <div class="form-group">
                            <label for="role">Vai Trò</label>
                            <select id="role" name="role" class="form-control">
                                <option value="0" <%= (role == 0) ? "selected" : "" %>>Admin</option>
                                <option value="1" <%= (role == 1) ? "selected" : "" %>>User</option>
                            </select>
                        </div>

                        <div class="btn-container">
                            <a href="quanly" class="btn btn-cancel">Hủy Bỏ</a>
                            
                           <button type="submit" class="btn btn-save">Lưu Thay Đổi</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>