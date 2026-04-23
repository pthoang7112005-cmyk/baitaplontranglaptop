<%-- 
    Document   : quanly
    Created on : Apr 22, 2026, 5:03:35 PM
    Author     : LENOVO
--%>

<%@page import="java.util.List"%>
<%@page import="model.user"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý người dùng</title>
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            body {
                background-color: #ffffff;
                display: flex;
                height: 100vh;
                overflow: hidden;
            }
            .app-container {
                display: flex;
                width: 100%;
                height: 100%;
            }
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
            }
            .main-content {
                flex: 1;
                background-image: url('img/1354206.jpeg');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                padding: 30px;
                overflow-y: auto;
            }
            .header-top {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }
            .header-top h1 {
                font-size: 24px;
                color: #212529;
                font-weight: 500;
            }
            .user-info {
                display: flex;
                align-items: center;
                gap: 10px;
                font-size: 15px;
                color: #ffffff;
                font-weight: 600;
            }
            .user-info a {
                color: #dc3545;
                text-decoration: none;
                font-weight: normal;
                font-size: 14px;
            }
            .user-info a:hover {
                text-decoration: underline;
            }
            
            .btn-add {
                display: inline-block;
                padding: 10px 16px;
                background-color: #0d6efd;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                margin-bottom: 20px;
                font-size: 14px;
                border: none;
                cursor: pointer;
            }
            .btn-add:hover {
                background-color: #0b5ed7;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background-color: white;
            }
            th, td {
                padding: 12px 15px;
                text-align: left;
                border: 1px solid #dee2e6;
            }
            th {
                background-color: #212529;
                color: white;
                font-weight: 600;
                font-size: 14px;
            }
            tr:nth-child(even) {
                background-color: #f8f9fa;
            }
            tr:hover {
                background-color: #f1f3f5;
            }
            .btn-edit {
                display: inline-block;
                padding: 6px 12px;
                background-color: #ffc107;
                color: #000;
                text-decoration: none;
                border-radius: 4px;
                font-size: 14px;
                margin-right: 5px;
                border: none;
            }
            .btn-edit:hover {
                background-color: #e0a800;
            }
            .btn-delete {
                display: inline-block;
                padding: 6px 12px;
                background-color: #dc3545;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                font-size: 14px;
                border: none;
            }
            .btn-delete:hover {
                background-color: #c82333;
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
                <div class="header-top">
                    <h1>Danh sách người dùng</h1>
                    <div class="user-info">
                        <span>👤 admin01 ▾</span>
                        <a href="dangnhap.jsp" style="margin-left: 15px;">Đăng xuất</a>
                    </div>
                </div>

                <a href="#" class="btn-add">+ Thêm mới người dùng</a>

                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>User Name</th>
                            <th>Password</th>
                            <th>Email</th>
                            <th>Full Name</th>
                            <th>Role</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<user> list = (List<user>) request.getAttribute("ds");
                            if (list != null && !list.isEmpty()) {
                                for (user dsxm : list) {
                        %>
                        <tr>
                            <td><%=dsxm.getId()%></td>
                            <td><%=dsxm.getUsername()%></td>
                            <td><%=dsxm.getPassword()%></td>
                            <td><%=dsxm.getEmail()%></td>
                            <td><%=dsxm.getFullnameString()%></td>
                            <td>
                                <% if (dsxm.getRole() == 0) { %>
                                <span style="color: red; font-weight: bold;">Admin</span>
                                <% } else { %>
                                User
                                <% }%>
                            </td>
                            <td>
                                <a href="sua.jsp?id=<%=dsxm.getId()%>" class="btn-edit">Sửa</a>
                                <a href="#" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa user này không?');">Xóa</a>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="7" style="text-align: center; color: #777;">Không có dữ liệu người dùng</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>