<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Ad"/>
        </jsp:include>
    </head>
    <body data-barba="wrapper">
        <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
        <main data-barba="container" data-barba-namespace="single-ad">
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
        </main>
    </body>
</html>
