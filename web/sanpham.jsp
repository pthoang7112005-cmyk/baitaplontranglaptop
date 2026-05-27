<%-- 
    Document   : sanpham
    Created on : May 6, 2026, 9:25:12 PM
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
        <title>Danh sách sản phẩm</title>
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
                white-space: nowrap;
            }
            .btn-search:hover {
                background: linear-gradient(to right, #0b5ed7, #d63384);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.2);
                color: white;
            }
            .category-menu::-webkit-scrollbar {
                height: 4px;
            }
            .category-menu::-webkit-scrollbar-thumb {
                background: #ccc;
                border-radius: 10px;
            }
            .category-pill {
                background: rgba(255,255,255,0.7);
                color: #495057;
                border-radius: 20px;
                padding: 8px 16px;
                text-decoration: none;
                font-weight: 600;
                font-size: 14px;
                white-space: nowrap;
                transition: all 0.2s;
                border: 1px solid rgba(255,255,255,0.5);
            }
            .category-pill:hover, .category-pill.active {
                background: linear-gradient(to right, #0d6efd, #e83e8c);
                color: white;
                border-color: transparent;
                box-shadow: 0 4px 10px rgba(0,0,0,0.15);
            }
            .product-card {
                border-radius: 8px;
                transition: transform 0.2s ease, box-shadow 0.2s ease;
                overflow: hidden;
                border: none;
                background: #fff;
            }
            .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.15) !important;
            }
            .product-img {
                height: 180px;
                object-fit: contain;
                transition: transform 0.3s;
            }
            .product-card:hover .product-img {
                transform: scale(1.05);
            }
            .product-name {
                font-size: 14px;
                color: #333;
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                text-align: left;
                line-height: 1.4;
                height: 39px;
                margin-bottom: 8px;
                font-weight: 600;
            }
            .product-price {
                color: #d70018;
                font-weight: 700;
                font-size: 17px;
                text-align: left;
                margin-bottom: 5px;
            }
            .product-rating {
                font-size: 11px;
                color: #f5b50a;
                text-align: left;
                margin-bottom: 12px;
            }
            .btn-buy {
                background-color: #fff;
                border: 1px solid #0d6efd;
                color: #0d6efd;
                border-radius: 4px;
                width: 100%;
                font-weight: 600;
                font-size: 13px;
                padding: 6px 0;
                transition: all 0.2s;
            }
            .btn-buy:hover {
                background: linear-gradient(to right, #0d6efd, #e83e8c);
                color: #fff;
                border-color: transparent;
            }
            .discount-badge {
                position: absolute;
                top: 10px;
                left: 10px;
                background: linear-gradient(to right, #ff416c, #ff4b2b);
                color: white;
                font-size: 11px;
                font-weight: bold;
                padding: 3px 8px;
                border-radius: 12px;
                z-index: 2;
            }

            /* CSS cho hiệu ứng placeholder trượt của ô tìm kiếm */
            .dynamic-placeholder {
                position: absolute;
                top: 0;
                left: 15px;
                height: 100%;
                display: flex;
                align-items: center;
                color: #6c757d;
                pointer-events: none; /* Bỏ qua sự kiện click chuột để nhấp lọt xuống thẻ input */
                z-index: 3;
            }
            .dynamic-placeholder span {
                transition: transform 0.4s ease, opacity 0.4s ease;
                display: block;
            }
            .suggestion-box {
                position: absolute;
                top: calc(100% + 5px);
                left: 0;
                right: 0;
                width: 100%;
                box-sizing: border-box;
                background: white;
                border: 1px solid #ddd;
                border-top: none;
                border-radius: 0 0 8px 8px;
                z-index: 1000;
                max-height: 350px;
                overflow-y: auto;
                box-shadow: 0 8px 20px rgba(0,0,0,0.1);
                display: none;
            }
            .suggestion-item {
                display: block;
                padding: 10px 12px;
                cursor: pointer;
                border-bottom: 1px solid #f0f0f0;
                text-decoration: none;
                color: #333;
            }
            .suggestion-item:hover {
                background: #f8f9ff;
            }
            .suggestion-item img {
                width: 45px;
                height: 45px;
                object-fit: contain;
                margin-right: 10px;
                border-radius: 4px;
            }
            .suggestion-item .sug-name {
                font-size: 13px;
                font-weight: 600;
                flex: 1;
            }
            .suggestion-item .sug-price {
                font-size: 13px;
                color: #d70018;
                font-weight: 700;
            }
        </style>
    </head>
    <body>
        <!-- Header dạng dàn hàng ngang như TGDD -->
        <header class="navbar mb-4 p-3 sticky-top">
            <div class="container d-flex flex-wrap align-items-center justify-content-between">
                <!-- Logo -->
                <a href="sanpham" class="text-decoration-none me-3">
                    <h2 class="mb-0 page-title"><i class="fas fa-laptop-code me-2"></i>LapTopFake</h2>
                </a>
                <!-- Thanh tìm kiếm nằm giữa -->
                <form action="sanpham" method="GET" class="d-flex flex-grow-1 px-md-4 my-3 my-md-0" role="search" style="max-width: 500px;">
                    <div class="input-group shadow-sm" style="border-radius: 8px; overflow: visible; position: relative; background-color: #fff;">
                        <div id="dynamicPlaceholder" class="dynamic-placeholder">
                            <span>Tìm MacBook Pro...</span>
                        </div>
                        <input 
                            name="tukhoa" 
                            id="dynamicSearchInput" 
                            class="form-control border-0" 
                            type="search" 
                            value="<%= request.getParameter("tukhoa") != null ? request.getParameter("tukhoa") : ""%>"
                            aria-label="Search" 
                            style="box-shadow: none; padding-left: 15px; background: transparent; z-index: 2;" 
                            />
                        <button class="btn-search rounded-0" type="submit" style="z-index: 4;">
                            <i class="fas fa-search"></i>
                        </button>
                        <div id="suggestionBox" class="suggestion-box"></div>
                    </div>
                </form> 
                <!-- Giỏ hàng & Tài khoản -->
                <div class="d-flex align-items-center gap-3">
                    <a href="giohang" class="text-decoration-none text-dark d-flex align-items-center fw-semibold">
                        <i class="fas fa-shopping-cart fs-5 me-1" style="color: #0d6efd;"></i> <span class="d-none d-md-inline">Giỏ hàng</span>
                    </a>
                    <a href="dangnhap.jsp" class="text-decoration-none text-dark d-flex align-items-center fw-semibold">
                        <i class="fas fa-user-circle fs-5 me-1" style="color: #e83e8c;"></i> <span class="d-none d-md-inline">Tài khoản</span>
                    </a>
                </div>
            </div>
        </header>

        <div class="container mb-5">
            <!-- Thanh Danh mục dạng viên nén (Pills) -->
            <div class="category-menu mb-4 d-flex gap-2 overflow-auto pb-2">
                <a href="#" class="category-pill active">Tất cả</a>
                <a href="#" class="category-pill">MacBook</a>
                <a href="#" class="category-pill">Dell XPS</a>
                <a href="#" class="category-pill">Lenovo</a>
                <a href="#" class="category-pill">HP</a>
                <a href="#" class="category-pill">Asus</a>
            </div>

            <!-- Lưới Sản Phẩm -->
            <div class="row g-3">
                <%
                    List<product> list = (List<product>) request.getAttribute("ds");
                    if (list == null || list.isEmpty()) {
                %>
                <div class="col-12 text-center py-5">
                    <i class="fas fa-search fa-3x mb-3" style="color: rgba(255,255,255,0.5);"></i>
                    <p class="fs-5 text-white fw-semibold">Không tìm thấy sản phẩm phù hợp</p>
                    <a href="sanpham" class="btn btn-light mt-2">Xem tất cả sản phẩm</a>
                </div>
                <%
                } else {
                    for (product a : list) {
                %>
                
                <div class="col-6 col-md-4 col-lg-3 d-flex align-items-stretch">
                    <a href="chitiet?id=<%= a.getId()%>" class="text-decoration-none text-dark w-100">
                        <div class="card w-100 shadow-sm product-card position-relative">
                            <span class="discount-badge">-10%</span>
                            <div class="p-3 pb-0 text-center">
                                <img src="<%= a.getImageString()%>" class="card-img-top product-img" alt="<%= a.getNameString()%>">
                            </div>
                            <div class="card-body d-flex flex-column">
                                <h6 class="product-name"><%= a.getNameString()%></h6>
                                <p class="product-price">
                                    <%= NumberFormat.getNumberInstance(new Locale("vi", "VN")).format(a.getMoney())%> ₫
                                </p>
                                <div class="product-rating">
                                    <i class="fas fa-star"></i><i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i><i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                    <span class="text-muted ms-1">(42)</span>
                                </div>
                               
                                <button class="btn btn-buy mt-auto"><i class="fas fa-cart-plus me-1"></i> Mua ngay</button>
                            </div>
                        </div>
                    </a>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Script tạo hiệu ứng luân chuyển từ khóa trượt lên (giống Thế Giới Di Động) -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const placeholders = [
                    "Tìm MacBook Pro...",
                    "Tìm Dell XPS...",
                    "Tìm Lenovo ThinkPad...",
                    "Tìm HP Envy...",
                    "Tìm Asus ROG..."
                ];

                const placeholderSpan = document.querySelector('#dynamicPlaceholder span');
                const placeholderContainer = document.getElementById('dynamicPlaceholder');
                const searchInput = document.getElementById('dynamicSearchInput');
                let index = 0;

                setInterval(() => {

                    if (document.activeElement === searchInput || searchInput.value.length > 0)
                        return;


                    placeholderSpan.style.transform = 'translateY(-100%)';
                    placeholderSpan.style.opacity = '0';

                    setTimeout(() => {

                        index = (index + 1) % placeholders.length;
                        placeholderSpan.textContent = placeholders[index];
                        placeholderSpan.style.transition = 'none';
                        placeholderSpan.style.transform = 'translateY(100%)';


                        void placeholderSpan.offsetWidth;

                        // Bước 3: Trượt chữ mới vào giữa
                        placeholderSpan.style.transition = 'transform 0.4s ease, opacity 0.4s ease';
                        placeholderSpan.style.transform = 'translateY(0)';
                        placeholderSpan.style.opacity = '1';
                    }, 400);
                }, 2500);


                searchInput.addEventListener('focus', () => {
                    placeholderContainer.style.display = 'none';
                });


                searchInput.addEventListener('blur', () => {
                    if (searchInput.value.length === 0) {
                        placeholderContainer.style.display = 'flex';
                    }
                });

                searchInput.addEventListener('input', () => {
                    if (searchInput.value.length > 0) {
                        placeholderContainer.style.display = 'none';
                    } else if (document.activeElement !== searchInput) {
                        placeholderContainer.style.display = 'flex';
                    }
                });

                // ===== AUTOCOMPLETE GỢI Ý =====
                const suggestionBox = document.getElementById('suggestionBox');
                let debounceTimer;

                searchInput.addEventListener('input', function () {
                    const keyword = this.value.trim();

                    // Ẩn/hiện placeholder
                    if (keyword.length > 0) {
                        placeholderContainer.style.display = 'none';
                    } else {
                        suggestionBox.style.display = 'none';
                        suggestionBox.innerHTML = '';
                        return;
                    }

                    // Debounce: chờ 300ms sau khi ngừng gõ mới gọi API
                    clearTimeout(debounceTimer);
                    debounceTimer = setTimeout(() => {
                        fetch('goiy?q=' + encodeURIComponent(keyword))
                                .then(res => res.json())
                                .then(data => {
                                    suggestionBox.innerHTML = '';

                                    if (data.length === 0) {
                                        suggestionBox.style.display = 'none';
                                        return;
                                    }

                                    data.forEach(item => {
                                        const div = document.createElement('a');
                                        div.href = 'sanpham?tukhoa=' + encodeURIComponent(item.name);
                                        div.className = 'suggestion-item';
                                        div.textContent = item.name;
                                        div.addEventListener('click', () => {
                                            searchInput.value = item.name;
                                            suggestionBox.style.display = 'none';
                                        });
                                        suggestionBox.appendChild(div);
                                    });

                                    suggestionBox.style.display = 'block';
                                })
                                .catch(err => console.error('Lỗi gợi ý:', err));
                    }, 300);
                });

                // Ẩn dropdown khi click ra ngoài
                document.addEventListener('click', function (e) {
                    if (!searchInput.contains(e.target) && !suggestionBox.contains(e.target)) {
                        suggestionBox.style.display = 'none';
                    }
                });

                // Ẩn dropdown khi submit form
                searchInput.closest('form').addEventListener('submit', function () {
                    suggestionBox.style.display = 'none';
                });
            });
        </script>
    </body>
</html>
