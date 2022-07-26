<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Viewing All The Ads"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="/WEB-INF/partials/navbar.jsp"/>

        <div class="container">
            <form action="/ads" method="GET" class="text-center">
                <label>
                    Search:
                    <input name="query" placeholder="Search here..." class="p-2">
                </label>
                <input type="submit" value="Search" class="p-2 bg-black text-white border-0">
            </form>
            <h1>Here Are all the ads!</h1>

            <div class="ads-container row">
                <c:forEach var="ad" items="${ads}">
                    <jsp:include page="/WEB-INF/partials/ad.jsp">
                        <jsp:param name="title" value="${ad.title}"/>
                        <jsp:param name="description" value="${ad.description}"/>
                        <jsp:param name="id" value="${ad.id}"/>
                    </jsp:include>
                </c:forEach>
            </div>
        </div>

    </body>
</html>
