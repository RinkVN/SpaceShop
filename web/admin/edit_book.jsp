<%-- 
    Document   : edit_book
    Created on : Feb 27, 2024, 1:51:30 PM
    Author     : datla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.DBContext" %>
<%@page import="controller.*" %>
<%@page import="model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="cdn.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Books</title>
    </head>
    <body style="background-color: #f0f2f2">

        <%@include file="navbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card ">
                        <div class="card-body">

                            <h4 class="text-center">Edit Book</h4>

                            <% 
                                int id = Integer.parseInt(request.getParameter("id"));
                                BookDAOimpl dao = new BookDAOimpl(DBContext.getConn());
                                BookInfo b = dao.getBookById(id);
                            %>    


                            <form action="../editbook" method="post">
                                <input type="hidden" name="id" value="<%= b.getBookId() %>">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name</label>
                                    <input
                                        name="bname"
                                        type="text"
                                        class="form-control"
                                        id="exampleInputEmail1"
                                        aria-describedby="emailHelp"
                                        value="<%= b.getBookName() %>"
                                        />
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Author Name</label>
                                    <input
                                        name="author"
                                        type="text"
                                        class="form-control"
                                        id="exampleInputEmail1"
                                        aria-describedby="emailHelp"
                                        value="<%= b.getAuthor() %>"
                                        />
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Price*</label>
                                    <input
                                        name="price"
                                        type="number"
                                        class="form-control"
                                        id="exampleInputEmail1"
                                        aria-describedby="emailHelp"
                                        value="<%= b.getPrice() %>"
                                        />
                                </div>

<!--                                <div class="form-group">
                                    <label for="inputState">Book Categories</label>
                                    <select name="categories" class="form-control" id="inputState">
                                        <option selected>--select--</option>
                                        <option value="New">New Book</option>
                                    </select>
                                </div>-->

                                <div class="form-group">
                                    <label for="inputState">Book Status</label>
                                    <select name="bstatus" class="form-control" id="inputState">
                                        <%
                                            if("Active".equals(b.getStatus())) {
                                        %>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                        <%
                                            } else {
                                        %>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>

<!--                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Upload Photo</label>
                                    <input
                                        type="file"
                                        name="bimg"
                                        class="form-control-file"
                                        id="exampleFormControlFile1"
                                        />
                                </div>-->

                                <button type="submit" class="btn btn-primary">Update</button>

                            </form>


                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
