<%-- 
    Document   : quanlysanpham
    Created on : (Current Date)
    Author     : LENOVO
--%>

<%@page import="java.util.List"%>
<%@page import="model.product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý sản phẩm</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- FontAwesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            body {
                background: linear-gradient(135deg, #ff7eb3 0%, #4facfe 100%);
                display: flex;
                height: 100vh;
                overflow: hidden;
            }
            .app-container {
                display: flex;
                width: 100%;
                height: 100%;
                padding: 20px;
                gap: 20px;
            }
            .admin-panel {
                width: 250px;
                background-color: #ffffff;
                border-radius: 12px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
                display: flex;
                flex-direction: column;
                height: 100%;
                overflow: hidden;
            }
            .admin-panel h2 {
                padding: 20px;
                font-size: 22px;
                font-weight: 700;
                margin-bottom: 10px;
                background: linear-gradient(to right, #e83e8c, #0d6efd);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                text-align: center;
            }
            .admin-panel a {
                color: #495057;
                text-decoration: none;
                padding: 15px 20px;
                display: block;
                font-size: 15px;
                font-weight: 600;
                transition: all 0.3s ease;
                border-left: 4px solid transparent;
            }
            .admin-panel a:hover, .admin-panel a.active {
                background-color: #f8f9fa;
                color: #0d6efd;
                border-left-color: #e83e8c;
            }
            .main-content {
                flex: 1;
                background-color: #ffffff;
                border-radius: 12px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
                padding: 30px;
                overflow-y: auto;
            }
            .header-top {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 25px;
                padding-bottom: 15px;
                border-bottom: 1px solid #dee2e6;
            }
            .header-top h1 {
                font-size: 24px;
                font-weight: 700;
                background: linear-gradient(to right, #e83e8c, #0d6efd);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                margin-bottom: 0;
            }
            .user-info {
                display: flex;
                align-items: center;
                gap: 15px;
                font-size: 15px;
                color: #495057;
                font-weight: 600;
            }
            .user-info a {
                color: #e83e8c;
                text-decoration: none;
                font-weight: 600;
                font-size: 14px;
                transition: color 0.3s;
            }
            .user-info a:hover {
                text-decoration: underline;
                color: #d63384;
            }
            
            .btn-add {
                display: inline-block;
                padding: 12px 20px;
                background: linear-gradient(to right, #0d6efd, #e83e8c);
                color: white;
                text-decoration: none;
                border-radius: 8px;
                margin-bottom: 20px;
                font-size: 14px;
                font-weight: 700;
                border: none;
                cursor: pointer;
                transition: all 0.3s ease;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }
            .btn-add:hover {
                background: linear-gradient(to right, #0b5ed7, #d63384);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.2);
                color: white;
            }

            table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                background-color: white;
                border-radius: 8px;
                overflow: hidden;
                border: 1px solid #dee2e6;
            }
            th, td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #dee2e6;
                vertical-align: middle;
            }
            th {
                background: #f8f9fa;
                color: #495057;
                font-weight: 700;
                font-size: 14px;
                text-transform: uppercase;
            }
            tr:last-child td {
                border-bottom: none;
            }
            tr:hover {
                background-color: #f1f3f5;
            }
            .btn-edit {
                display: inline-block;
                padding: 8px 15px;
                background-color: #4facfe;
                color: #fff;
                text-decoration: none;
                border-radius: 6px;
                font-size: 13px;
                font-weight: 600;
                margin-right: 5px;
                border: none;
                transition: all 0.3s ease;
            }
            .btn-edit:hover {
                background-color: #00f2fe;
                color: #fff;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            }
            .btn-delete {
                display: inline-block;
                padding: 8px 15px;
                background-color: #e83e8c;
                color: white;
                text-decoration: none;
                border-radius: 6px;
                font-size: 13px;
                font-weight: 600;
                border: none;
                transition: all 0.3s ease;
            }
            .btn-delete:hover {
                background-color: #d63384;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            }
            .product-img {
                width: 60px;
                height: 60px;
                object-fit: cover;
                border-radius: 6px;
                border: 1px solid #dee2e6;
            }
            .price-tag {
                font-weight: bold;
                color: #e83e8c;
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
        <div class="app-container page-enter">
            <div class="admin-panel">
                <h2><i class="fas fa-user-shield me-2"></i>Admin</h2>
                <a href="quanly"><i class="fas fa-users me-2"></i>Quản lý người dùng</a>
                <a href="quanlysanpham" class="active"><i class="fas fa-box-open me-2"></i>Quản lý sản phẩm</a>
                <a href="quanlydonhang"><i class="fas fa-shopping-cart me-2"></i>Quản lý đơn hàng</a>
            </div>
            
            <div class="main-content">
                <div class="header-top">
                    <h1><i class="fas fa-box me-2"></i>Danh sách sản phẩm</h1>
                    <div class="user-info">
                        <span><i class="fas fa-user-circle fs-5 me-1"></i> admin01 ▾</span>
                        <a href="dangnhap.jsp" style="margin-left: 15px;"><i class="fas fa-sign-out-alt me-1"></i>Đăng xuất</a>
                    </div>
                </div>

                <a href="themsanpham.jsp" class="btn-add"><i class="fas fa-plus me-1"></i> Thêm mới sản phẩm</a>

                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Thương hiệu</th>
                            <th>Số lượng</th>
                            <th>Giá (VNĐ)</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<product> list = (List<product>) request.getAttribute("ds");
                            if (list != null && !list.isEmpty()) {
                                for (product p : list) {
                        %>
                        <tr>
                            <td><%= p.getId()%></td>
                            <td>
                                <img src="<%= p.getImageString() %>" alt="<%= p.getNameString() %>" class="product-img" onerror="this.src='img/download.jpg';">
                            </td>
                            <td><strong><%= p.getNameString() %></strong></td>
                            <td><%= p.getBrandString() %></td>
                            <td><%= p.getSoluong() %></td>
                            <td class="price-tag"><%= String.format("%,.0f", p.getMoney()) %> đ</td>
                            <td>
                                <a href="suasanpham.jsp?id=<%= p.getId() %>" class="btn-edit"><i class="fas fa-edit"></i> Sửa</a>
                                <a href="xoasanpham?id=<%= p.getId() %>" class="btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?');"><i class="fas fa-trash-alt"></i> Xóa</a>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="7" style="text-align: center; color: #777; padding: 20px;">Không có dữ liệu sản phẩm</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>