/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DBContext;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author datla
 */
public class Register extends HttpServlet {

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
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
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
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phno = request.getParameter("phno");
            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");
            String check = request.getParameter("check");

//            System.out.println(name + "" + email+ "" +phno+ "" +password+ "" +check);
            User us = new User();
            us.setName(name);
            us.setEmail(email);
            us.setPhno(phno);
            us.setPassword(password);

            HttpSession session = request.getSession();

            // Validate email
//            if (!email.contains("@")) {
//                session.setAttribute("name", name);
//                session.setAttribute("phno", phno);
//                session.setAttribute("password", password);
//                session.setAttribute("failMess", "Email must contain '@'");
//                response.sendRedirect("register.jsp");
//                return; 
//            }
//
//            // Validate password
//            if (password.length() < 8) {
//                session.setAttribute("name", name);
//                session.setAttribute("email", email);
//                session.setAttribute("phno", phno);
//                session.setAttribute("failMess", "Password must be at least 8 characters long");
//                response.sendRedirect("register.jsp");
//                return; 
//            }
            if (!password.equals(repassword)) {
                session.setAttribute("name", name);
                session.setAttribute("email", email);
                session.setAttribute("phno", phno);
                session.setAttribute("password", password);
                // Re-Password does not match
                request.setAttribute("failMess", "Re-Password does not match");
                RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
                dispatcher.forward(request, response);

            } else if (check != null) {
                UserDAOImpl d = new UserDAOImpl(DBContext.getConn());
                boolean f = d.userRegister(us);
                if (f) {
                    // User Register Success
                    response.sendRedirect("login.jsp");
                } else {
                    // Something Wrong
                    session.setAttribute("name", name);
                    session.setAttribute("email", email);
                    session.setAttribute("phno", phno);
                    session.setAttribute("password", password);

                    session.setAttribute("failMess", "Something Wrong");
                    response.sendRedirect("register.jsp");
                }
            } else {
                // Please check Agree
                session.setAttribute("name", name);
                session.setAttribute("email", email);
                session.setAttribute("phno", phno);
                session.setAttribute("password", password);

                session.setAttribute("failMess", "Please check Agree");
                response.sendRedirect("register.jsp");
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
