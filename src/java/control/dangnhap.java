/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.dangnhapdao;
import model.user;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "dangnhap", urlPatterns = {"/dangnhap"})
public class dangnhap extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet dangnhap</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet dangnhap at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Lấy thông tin từ form đăng nhập
        String u = request.getParameter("username");
        String p = request.getParameter("password");
        
        // Khởi tạo DAO
        dangnhapdao dao = new dangnhapdao();
        
        // Kiểm tra thông tin đăng nhập trong cơ sở dữ liệu
        user loggedInUser = dao.checkLogin(u, p);
        
        if (loggedInUser != null) {
            // Đăng nhập thành công, lấy role từ database
            int role = loggedInUser.getRole();
            
            // Lưu thông tin user vào session (tùy chọn nhưng thường làm để dùng sau này)
            request.getSession().setAttribute("user", loggedInUser);
            
            // Sử dụng if else để phân quyền
            if (role == 0) {
                // Role 0: Đăng nhập vào trang quản lý
                response.sendRedirect("quanly.jsp"); // Bạn có thể đổi lại trang tương ứng của bạn
            } else if (role == 1) {
                // Role 1: Đăng nhập vào trang sản phẩm
                response.sendRedirect("sanpham.jsp"); // Bạn có thể đổi lại trang tương ứng của bạn
            } else {
                // Các role khác nếu có
                response.sendRedirect("index.jsp");
            }
        } else {
            // Đăng nhập thất bại
            request.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!");
            request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
