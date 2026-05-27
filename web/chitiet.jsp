<%-- 
    Document   : chitiet
    Created on : May 7, 2026, 10:24:10 AM
    Author     : LENOVO
--%>

<%@page import="model.product"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi tiết sản phẩm</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            body {
                background: linear-gradient(135deg, #ff7eb3 0%, #4facfe 100%);
                min-height: 100vh;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
            }
            .page-title {
                font-weight: 800;
                background: linear-gradient(to right, #e83e8c, #0d6efd);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                margin: 0;
            }
            .navbar {
                background: rgba(255, 255, 255, 0.95) !important;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            }
            .detail-card {
                background: #ffffff;
                border-radius: 12px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
                overflow: hidden;
                margin-bottom: 2rem;
            }
            .product-image-container {
                padding: 2rem;
                text-align: center;
                background-color: #f8f9fa;
                border-right: 1px solid #dee2e6;
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .product-img {
                max-width: 100%;
                max-height: 400px;
                object-fit: contain;
                transition: transform 0.3s;
            }
            .product-img:hover {
                transform: scale(1.05);
            }
            .product-info {
                padding: 2rem;
            }
            .product-name {
                font-size: 1.8rem;
                font-weight: 700;
                color: #333;
                margin-bottom: 1rem;
            }
            .product-price {
                color: #d70018;
                font-weight: 700;
                font-size: 1.5rem;
                margin-bottom: 1rem;
            }
            .info-item {
                margin-bottom: 0.5rem;
                font-size: 1rem;
                color: #495057;
            }
            .info-label {
                font-weight: 600;
                color: #333;
                width: 120px;
                display: inline-block;
            }
            .btn-buy {
                background: linear-gradient(to right, #0d6efd, #e83e8c);
                border: none;
                border-radius: 8px;
                padding: 14px 20px;
                font-weight: 700;
                font-size: 1.1rem;
                color: white;
                transition: all 0.3s ease;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                width: 100%;
                margin-top: 1.5rem;
            }
            .btn-buy:hover {
                background: linear-gradient(to right, #0b5ed7, #d63384);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.2);
                color: white;
            }
            .btn-buy:active {
                transform: scale(0.98);
            }
            /* Animations */
            .page-enter {
                animation: fadeInSlideUp 0.5s ease-out forwards;
                opacity: 0;
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
            .breadcrumb-item a {
                color: rgba(255, 255, 255, 0.8) !important;
                font-weight: 500;
            }
            .breadcrumb-item.active {
                color: #ffffff !important;
                font-weight: 600;
            }
            .breadcrumb-item + .breadcrumb-item::before {
                color: rgba(255, 255, 255, 0.8);
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <header class="navbar mb-4 p-3 sticky-top">
            <div class="container d-flex flex-wrap align-items-center justify-content-between">
                <!-- Logo -->
                <a href="sanpham" class="text-decoration-none me-3">
                    <h2 class="mb-0 page-title"><i class="fas fa-laptop-code me-2"></i>LapTopFake</h2>
                </a>
                <!-- Giỏ hàng & Tài khoản -->
                <div class="d-flex align-items-center gap-3 ms-auto">
                    <a href="#" class="text-decoration-none text-dark d-flex align-items-center fw-semibold">
                        <i class="fas fa-shopping-cart fs-5 me-1" style="color: #0d6efd;"></i> <span class="d-none d-md-inline">Giỏ hàng</span>
                    </a>
                    <a href="dangnhap.jsp" class="text-decoration-none text-dark d-flex align-items-center fw-semibold">
                        <i class="fas fa-user-circle fs-5 me-1" style="color: #e83e8c;"></i> <span class="d-none d-md-inline">Tài khoản</span>
                    </a>
                </div>
            </div>
        </header>

        <div class="container mb-5 page-enter">
            <nav aria-label="breadcrumb" class="mb-3">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="sanpham" class="text-decoration-none">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Chi tiết sản phẩm</li>
                </ol>
            </nav>

            <%
                product p = (product) request.getAttribute("product");
                if (p != null) {
            %>
            <div class="detail-card row g-0">
                <div class="col-md-5">
                    <div class="product-image-container">
                        <img src="<%= p.getImageString()%>" alt="<%= p.getNameString()%>" class="product-img img-fluid">
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="product-info">
                        <h1 class="product-name"><%= p.getNameString()%></h1>
                        <div class="mb-3">
                            <span class="badge bg-danger me-2">Mới</span>
                            <span class="badge bg-success">Còn hàng (<%= p.getSoluong()%>)</span>
                        </div>
                        <p class="product-price">
                            <%= NumberFormat.getNumberInstance(new Locale("vi", "VN")).format(p.getMoney())%> ₫
                        </p>

                        <hr>

                        <h5 class="mb-3 fw-bold"><i class="fas fa-info-circle me-2 text-primary"></i>Thông tin sản phẩm</h5>
                        <div class="info-item">
                            <span class="info-label"><i class="fas fa-tag me-2 text-secondary"></i>Thương hiệu:</span>
                            <span class="fw-semibold"><%= p.getBrandString()%></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label"><i class="fas fa-laptop me-2 text-secondary"></i>Loại:</span>
                            <span><%= p.getLoaiString()%></span>
                        </div>
                        <div class="info-item">
                            <span class="info-label"><i class="fas fa-globe me-2 text-secondary"></i>Xuất xứ:</span>
                            <span><%= p.getXuatxuString()%></span>
                        </div>

                        <div class="mt-4">
                            <h5 class="fw-bold mb-2"><i class="fas fa-align-left me-2 text-primary"></i>Mô tả chi tiết</h5>
                            <p class="text-muted" style="line-height: 1.6;">
                                <%= p.getMotaString()%>

                                <!-- ✅ Thay bằng cái này -->
                                <a href="giohang?action=them&id=<%= p.getId()%>" class="btn btn-buy mt-4">
                                    <i class="fas fa-cart-plus me-2"></i>Thêm vào giỏ hàng
                                </a>
                        </div>
                    </div>
                </div>
                <%
                } else {
                %>
                <div class="alert alert-warning text-center">
                    <i class="fas fa-exclamation-triangle me-2"></i>Không tìm thấy thông tin sản phẩm.
                </div>
                <%
                    }
                %>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
