<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <<<<<<< HEAD
    <head>
        <jsp:include page="partials/head.jsp">
            <jsp:param name="title" value="Register For Our Site!"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="partials/navbar.jsp"/>
        <% String msg;
            if (session.getAttribute("msg") != null) {
                response.setContentType("text/html");
                PrintWriter output = response.getWriter();
                msg = (String) session.getAttribute("msg");
                output.print("<p style='color:red;'> " + msg + " </p>");
            }
        %>
        <div class="container">
            <h1>Please fill in your information.</h1>
            <form action="/register" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input id="username" name="username" class="form-control" type="text" required value=<c:out
                            value="${uName}"/>>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input id="email" name="email" class="form-control" type="email" required
                           pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" value=<c:out value="${emailAddy}"/>>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input id="password" name="password" class="form-control" type="password" pattern=".{8,}"
                           title="Eight or more characters" required>
                </div>
                <div class="form-group">
                    <label for="confirm_password">Confirm Password</label>
                    <input id="confirm_password" name="confirm_password" class="form-control" type="password" required>
                </div>
                <input type="submit" class="btn btn-primary btn-block">
            </form>
        </div>
    </body>
</html>
