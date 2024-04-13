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
import model.Cart;
import model.ProductInfo;

/**
 *
 * @author datla
 */
public class AddCart extends HttpServlet {

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
            out.println("<title>Servlet AddCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            int ProductID = Integer.parseInt(request.getParameter("ProductID"));
            int userID = Integer.parseInt(request.getParameter("userID"));
//            Float price = Float.valueOf(request.getParameter("price"));
//            Float totalPrice = Float.valueOf(request.getParameter("total_price"));

            ProductDAOimpl dao = new ProductDAOimpl(DBContext.getConn());
            ProductInfo p = dao.getProductById(ProductID);

            Cart c = new Cart();
            c.setProductID(ProductID);
            c.setUserID(userID);
            c.setProductName(p.getProductName());
            c.setPrice(Float.parseFloat(p.getPrice()));
            c.setTotalPrice(Float.parseFloat(p.getPrice()));

            CartDAOimpl dao2 = new CartDAOimpl(DBContext.getConn());
            boolean f = dao2.addCart(c);

            HttpSession session = request.getSession();

            if (f) {
                session.setAttribute("addCart", "Book Added To Cart");
                response.sendRedirect("product-detail/v1.14.0/cart.jsp");
            } else {
                session.setAttribute("failed", "Something Wrong");
                response.sendRedirect("product-detail/v1.14.0/cart.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

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
