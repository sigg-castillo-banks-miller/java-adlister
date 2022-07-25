<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dalton
  Date: 7/25/22
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Search"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
        <div class="container mx-auto">
            <div class="ads-container row">
                <c:forEach var="ad" items="${ads}">
                    <jsp:include page="/WEB-INF/partials/ad.jsp">
                        <jsp:param name="title" value="${ad.title}"/>
                        <jsp:param name="description" value="${ad.description}"/>
                    </jsp:include>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
