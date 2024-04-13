/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.File;
import model.VariantInfo;

/**
 *
 * @author datla
 */
public class Add_Variant extends HttpServlet {

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
            out.println("<title>Servlet Add_Variant</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Add_Variant at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            int ProductID = Integer.parseInt(request.getParameter("ProductID"));
            String size = request.getParameter("size");
            String ProductColor = request.getParameter("color");
            String Material = request.getParameter("material");

            VariantInfo variantInfo = new VariantInfo(ProductID, ProductColor, size, Material);
            ProductDAOimpl d = new ProductDAOimpl(DBContext.getConn());
            boolean f = d.addVariant(variantInfo);

            HttpSession session = request.getSession();
            if (f) {

                session.setAttribute("succMess", "Book Added Successfully");
                response.sendRedirect("admin/add-variant.jsp");
            } else {
                session.setAttribute("failMess", "Something Wrong");
                response.sendRedirect("admin/add-product.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
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
