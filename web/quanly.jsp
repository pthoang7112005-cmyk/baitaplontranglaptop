<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Sản Phẩm Laptop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .table-container { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        .img-product { width: 60px; height: 60px; object-fit: cover; border-radius: 5px; }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="table-container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="text-primary">Quản Lý Kho Laptop</h2>
            <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addModal">
                <i class="fas fa-plus"></i> Thêm Laptop Mới
            </button>
        </div>

        <table class="table table-hover align-middle">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Hình ảnh</th>
                    <th>Tên Laptop</th>
                    <th>Giá (VNĐ)</th>
                    <th>Số lượng</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listP}" var="p">
                    <tr>
                        <td>${p.id}</td>
                        <td><img src="${p.image}" class="img-product" alt="laptop"></td>
                        <td><strong>${p.name}</strong></td>
                        <td class="text-danger fw-bold">${p.price}</td>
                        <td>${p.quantity}</td>
                        <td>
                            <a href="loadProduct?pid=${p.id}" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i></a>
                            <a href="delete?pid=${p.id}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc muốn xóa?')"><i class="fas fa-trash"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div class="modal fade" id="addModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="add" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Thêm Laptop Mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Tên Laptop</label>
                        <input name="name" type="text" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Hình ảnh (URL)</label>
                        <input name="image" type="text" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Giá</label>
                        <input name="price" type="number" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Số lượng</label>
                        <input name="quantity" type="number" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Lưu lại</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>aaaaaaaaaaaaaaaaaaa