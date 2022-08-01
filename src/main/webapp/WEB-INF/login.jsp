<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Please Log In"/>
        </jsp:include>
    </head>
    <body data-barba="wrapper">
        <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
        <main data-barba="container" data-barba-namespace="login">
            <% String msg;
                if (session.getAttribute("msg") != null) {
                    response.setContentType("text/html");
                    PrintWriter output = response.getWriter();
                    msg = (String) session.getAttribute("msg");
                    output.print("<p style='color:red;'> " + msg + " </p>");
                }
            %>

            <div class="container w-50">
                <form action="/login" method="POST">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input id="username" name="username" class="form-control" type="text" required value=<c:out value="${uName}"/>>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input id="password" name="password" class="form-control" type="password" required pattern=".{8,}" title="Eight or more characters">
                    </div>
                    <input type="submit" class="btn btn-primary btn-block" value="Log In">
                </form>
            </div>
        </main>
    </body>
</html>
