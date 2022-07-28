<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Your Profile"/>
        </jsp:include>
        <title>SingleAd</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
        <div id="page-container">
            <div class="ad-container" id="single">
                <div id="ad-title">
                    <h1 id="ad-title-title">
                        <c:out value="${ad.title}"/>
                    </h1>
                </div>
                <div id="ad-info">
                    <h6><c:out value="${user.username}"/></h6>
                    <h6><c:out value="${user.id}"/></h6>
                </div>
                <div id="ad-description">
                    <p class="card-text"><c:out value="${ad.description}"/></p>
                </div>
            </div>
        </div>
    </body>
</html>
