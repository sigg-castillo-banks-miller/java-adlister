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
        <title>Search</title>
    </head>
    <body>
        <h1>Search</h1>
        <c:forEach var="ad" items="${ads}">
        <div class="ads-container ">

            <jsp:include page="/WEB-INF/partials/ad.jsp">
                <jsp:param name="title" value="${ad.getTitle()}"/>
                <jsp:param name="description" value="${ad.getDescription()}"/>
            </jsp:include>
            </c:forEach>
        </div>
    </body>
</html>
