<%@page import="model.product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Giỏ hàng</title>
    </head>
    <body>
        <%
            List<product> gioHang = (List<product>) request.getAttribute("gioHang");
        %>
        <h2>Giỏ hàng của bạn</h2>
        <table border="1">
            <tr>
                <th>Ảnh</th>
                <th>Tên</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Xóa</th>
            </tr>
            <% if (gioHang != null && !gioHang.isEmpty()) {
                for (int i = 0; i < gioHang.size(); i++) {
                    product sp = gioHang.get(i); %>
            <tr>
                <td><img src="<%= sp.getImageString() %>" width="60"></td>
                <td><%= sp.getNameString() %></td>
                <td><%= sp.getMoney() %></td>
                <td><%= sp.getSoluong() %></td>
                <td><a href="giohang?action=xoa&index=<%= i %>">Xóa</a></td>
            </tr>
            <% }
            } else { %>
            <tr><td colspan="5">Giỏ hàng trống</td></tr>
            <% } %>
        </table>
        <a href="sanpham">Tiếp tục mua sắm</a>
    </body>
</html>