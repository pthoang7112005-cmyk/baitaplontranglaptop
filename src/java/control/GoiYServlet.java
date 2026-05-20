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
import model.product;
import model.timkiemdao;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "GoiYServlet", urlPatterns = {"/goiy"})
public class GoiYServlet extends HttpServlet {

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
            out.println("<title>Servlet GoiYServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GoiYServlet at " + request.getContextPath() + "</h1>");
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
         response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        String tukhoa = request.getParameter("q");
        PrintWriter out = response.getWriter();
        
        if (tukhoa == null || tukhoa.trim().isEmpty()) {
            out.print("[]");
            return;
        }
        
        List<product> list = timkiemdao.timKiem(tukhoa.trim());
        
        // Trả về JSON
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < list.size(); i++) {
            product p = list.get(i);
            json.append("{")
                .append("\"id\":").append(p.getId()).append(",")
                .append("\"name\":\"").append(p.getNameString().replace("\"", "\\\"")).append("\",")
                .append("\"image\":\"").append(p.getImageString()).append("\",")
                .append("\"money\":").append(p.getMoney())
                .append("}");
            if (i < list.size() - 1) json.append(",");
        }
        json.append("]");
        
        out.print(json.toString());
    
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
