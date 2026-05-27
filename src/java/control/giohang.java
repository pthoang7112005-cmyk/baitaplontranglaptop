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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.product;
import model.sanphamdao;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "giohang", urlPatterns = {"/giohang"})
public class giohang extends HttpServlet {

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
            out.println("<title>Servlet giohang</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet giohang at " + request.getContextPath() + "</h1>");
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
         String action = request.getParameter("action");
        HttpSession session = request.getSession();
        List<product> gioHang = (List<product>) session.getAttribute("gioHang");
        if (gioHang == null) {
            gioHang = new ArrayList<>();
            session.setAttribute("gioHang", gioHang);
        }
        if ("them".equals(action)) {
            // Thêm sản phẩm vào giỏ
            int id = Integer.parseInt(request.getParameter("id"));
            sanphamdao dao = new sanphamdao();
            product sp = dao.GetById(id); // bạn cần thêm method này vào sanphamdao
            if (sp != null) {
                gioHang.add(sp);
            }
            response.sendRedirect("giohang"); // quay lại trang giỏ hàng
            } else if ("xoa".equals(action)) {
            // Xóa sản phẩm khỏi giỏ
            int index = Integer.parseInt(request.getParameter("index"));
            if (index >= 0 && index < gioHang.size()) {
                gioHang.remove(index);
            }
            response.sendRedirect("giohang");

        } else {
            // Hiển thị giỏ hàng
            request.setAttribute("gioHang", gioHang);
            request.getRequestDispatcher("giohang.jsp").forward(request, response);
        }
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
        processRequest(request, response);
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
