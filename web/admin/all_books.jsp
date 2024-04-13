<%-- 
    Document   : all_books
    Created on : Feb 24, 2024, 7:11:50 PM
    Author     : datla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.DBContext" %>
<%@page import="controller.*" %>
<%@page import="model.*" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
    <head>
        <%@ include file="cdn.jsp"%>
      
        <!--Block access to admin/all_books.jsp-->
        <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp"/>
        </c:if>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Books</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>

        <h3 class="text-center">All Books</h3>

    <c:if test="${not empty succMess}">
        <p class="text-center text-success">${succMess}</p>
        <c:remove var="succMess" scope="session"/>
    </c:if>

    <c:if test="${not empty failMess}">
        <p class="text-center text-danger">${failMess}</p>
        <c:remove var="failMess" scope="session"/>
    </c:if>

    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Image</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Categories</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                BookDAOimpl d = new BookDAOimpl(DBContext.getConn());
                List<BookInfo> list = d.getAllBooks();
                for (BookInfo b : list) {
            %>
            <tr>
                <td><%= b.getBookId() %></td>
                <td><img src="../book/<%= b.getPhotoName() %>" style="width: 50px; height: 50px" alt="photo name"/></td>
                <td><%= b.getBookName() %></td>
                <td><%= b.getAuthor() %> </td>
                <td><%= b.getPrice() %> </td>
                <td><%= b.getBookCategory() %> </td>
                <td><%= b.getStatus() %> </td>

                <td>
                    <a href="edit_book.jsp?id=<%= b.getBookId() %>" class="btn btn-sm btn-primary">Edit</a>
                    <a href="../deletebook?id=<%= b.getBookId() %>" class="btn btn-sm btn-danger">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>

    </table>
</body>
</html>
