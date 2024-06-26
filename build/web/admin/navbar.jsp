<%--  
    Document   : navbar
    Created on : Feb 23, 2024, 5:48:28 PM
    Author     : datla
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-3 text-success">
            <h3>
                <a href="../index.jsp" style="cursor: pointer; color: green">
                <i class="fa-solid fa-book-open-reader"></i> Book Store
                </a>
            </h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>

        <div class="col-md-3">
            <c:if test="${not empty userobj}">
                <a class="btn btn-success">
                    <i class="fas fa-user"></i> ${ userobj.name } </a> 
                <a data-toggle="modal" data-target="#staticBackdrop" class="btn btn-primary text-white">
                    <i class="fas fa-sign-in-alt"></i> Logout</a>

            </c:if>

            <c:if test="${empty userobj}">
                <a href="../login.jsp" class="btn btn-success">
                    <i class="fas fa-sign-in-alt"></i> Login </a> 
                <a href="../register.jsp" class="btn btn-primary text-white">
                    <i class="fas fa-user-plus"></i> Register</a>
                </c:if>

        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">${ userobj.name }</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Do you want to Logout
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-danger" data-dismiss="modal">Close</button>
                <a href="../login.jsp" type="button" class="btn btn-primary">Logout</a>
            </div>
        </div>
    </div>
</div>



<nav class="navbar navbar-expand-lg navbar-dark bg-primary  ">
    <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i> </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="../index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>

        </ul>

    </div>
</nav>