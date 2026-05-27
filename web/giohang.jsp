<%@page import="model.product"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Giỏ hàng</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
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
            .cart-container {
                background-color: rgba(255, 255, 255, 0.95);
                border-radius: 8px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                padding: 30px;
                margin-top: 20px;
            }
            .table th {
                background-color: #343a40;
                color: #fff;
            }
            .btn-continue {
                background: linear-gradient(to right, #6c757d, #495057);
                color: white;
                border: none;
                transition: all 0.3s;
            }
            .btn-continue:hover {
                background: linear-gradient(to right, #5a6268, #343a40);
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            }
            .btn-checkout {
                background: linear-gradient(to right, #0d6efd, #e83e8c);
                color: white;
                border: none;
                transition: all 0.3s;
            }
            .btn-checkout:hover {
                background: linear-gradient(to right, #0b5ed7, #d63384);
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            }
            .btn-delete {
                transition: all 0.3s;
            }
            .btn-delete:hover {
                transform: scale(1.1);
            }
            
            /* CSS cho search bar trên navbar */
            .form-control {
                border-radius: 8px;
                padding: 10px 15px;
                border: 1px solid #ced4da;
            }
            .form-control:focus {
                border-color: #0d6efd;
                box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
            }
            .btn-search {
                background: linear-gradient(to right, #0d6efd, #e83e8c);
                border: none;
                border-radius: 8px;
                padding: 10px 20px;
                font-weight: 700;
                color: white;
                transition: all 0.3s ease;
            }
            .btn-search:hover {
                background: linear-gradient(to right, #0b5ed7, #d63384);
                color: white;
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
                
                <!-- Thanh tìm kiếm nằm giữa -->
                <form action="sanpham" method="GET" class="d-flex flex-grow-1 px-md-4 my-3 my-md-0" role="search" style="max-width: 500px;">
                    <div class="input-group shadow-sm" style="border-radius: 8px; overflow: hidden; background-color: #fff;">
                        <input name="tukhoa" class="form-control border-0" type="search" placeholder="Tìm kiếm sản phẩm..." aria-label="Search" style="box-shadow: none;">
                        <button class="btn-search rounded-0" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form> 
                
                <!-- Giỏ hàng & Tài khoản -->
                <div class="d-flex align-items-center gap-3">
                    <a href="giohang" class="text-decoration-none text-dark d-flex align-items-center fw-semibold">
                        <i class="fas fa-shopping-cart fs-5 me-1" style="color: #0d6efd;"></i> <span class="d-none d-md-inline text-primary">Giỏ hàng</span>
                    </a>
                    <a href="dangnhap.jsp" class="text-decoration-none text-dark d-flex align-items-center fw-semibold">
                        <i class="fas fa-user-circle fs-5 me-1" style="color: #e83e8c;"></i> <span class="d-none d-md-inline">Tài khoản</span>
                    </a>
                </div>
            </div>
        </header>

        <div class="container mb-5">
            <div class="cart-container">
                <h2 class="mb-4 text-center page-title pb-2">Giỏ hàng của bạn</h2>
                <%
                    List<product> gioHang = (List<product>) request.getAttribute("gioHang");
                    double tongTien = 0;
                    NumberFormat formatter = NumberFormat.getNumberInstance(new Locale("vi", "VN"));
                %>
                
                <div class="table-responsive">
                    <table class="table table-hover align-middle text-center" style="border-collapse: separate; border-spacing: 0;">
                        <thead class="table-dark" style="border-radius: 8px 8px 0 0; overflow: hidden;">
                            <tr>
                                <th scope="col" style="border-top-left-radius: 8px;">Hình ảnh</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Giá</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Thành tiền</th>
                                <th scope="col" style="border-top-right-radius: 8px;">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (gioHang != null && !gioHang.isEmpty()) {
                                for (int i = 0; i < gioHang.size(); i++) {
                                    product sp = gioHang.get(i); 
                                    double thanhTien = sp.getMoney() * sp.getSoluong();
                                    tongTien += thanhTien;
                            %>
                            <tr style="background: white; box-shadow: 0 2px 5px rgba(0,0,0,0.02);">
                                <td class="p-3"><img src="<%= sp.getImageString() %>" alt="<%= sp.getNameString() %>" class="img-thumbnail border-0 shadow-sm" style="width: 80px; height: 80px; object-fit: contain;"></td>
                                <td class="text-start fw-semibold" style="color: #333;"><%= sp.getNameString() %></td>
                                <td class="text-danger fw-bold"><%= formatter.format(sp.getMoney()) %> ₫</td>
                                <td>
                                    <span class="badge bg-light text-dark border fs-6 px-3 py-2 rounded-pill"><%= sp.getSoluong() %></span>
                                </td>
                                <td class="text-danger fw-bold"><%= formatter.format(thanhTien) %> ₫</td>
                                <td>
                                    <a href="giohang?action=xoa&index=<%= i %>" class="btn btn-outline-danger btn-sm btn-delete rounded-pill px-3" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?');">
                                        <i class="fas fa-trash-alt me-1"></i> Xóa
                                    </a>
                                </td>
                            </tr>
                            <%  }
                            } else { %>
                            <tr>
                                <td colspan="6" class="text-center py-5">
                                    <div class="d-flex flex-column align-items-center">
                                        <i class="fas fa-shopping-basket fa-4x mb-3 text-muted" style="opacity: 0.5;"></i>
                                        <p class="fs-5 text-muted mb-0">Giỏ hàng của bạn hiện đang trống!</p>
                                        <p class="text-muted">Hãy quay lại để chọn cho mình sản phẩm ưng ý nhé.</p>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                        <% if (gioHang != null && !gioHang.isEmpty()) { %>
                        <tfoot style="background-color: #f8f9fa;">
                            <tr>
                                <td colspan="4" class="text-end fw-bold fs-5 p-3">Tổng cộng:</td>
                                <td colspan="2" class="text-start text-danger fw-bold fs-4 p-3"><%= formatter.format(tongTien) %> ₫</td>
                            </tr>
                        </tfoot>
                        <% } %>
                    </table>
                </div>
                
                <div class="d-flex justify-content-between mt-4">
                    <a href="sanpham" class="btn btn-continue px-4 py-2 rounded-pill">
                        <i class="fas fa-arrow-left me-2"></i> Tiếp tục mua sắm
                    </a>
                    <% if (gioHang != null && !gioHang.isEmpty()) { %>
                    <button class="btn btn-checkout px-5 py-2 rounded-pill fw-bold fs-6">
                        Thanh toán <i class="fas fa-arrow-right ms-2"></i>
                    </button>
                    <% } %>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>