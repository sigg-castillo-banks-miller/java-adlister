<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Your Profile"/>
        </jsp:include>
        <title>SingleAd</title>
    </head>
    <body data-barba="wrapper">
        <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
        <main data-barba="container" data-barba-namespace="single-ad">
            <div class="ad-container" id="single">
                <div>
                    <div>
                        <h5>
                            <c:out value="${ad.title}"/>
                        </h5>
                    </div>
                    <div>
                        <p class="card-text"><c:out value="${ad.description}"/></p>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
