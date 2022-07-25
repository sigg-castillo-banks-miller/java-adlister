<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>
    <div class="info-container">
        <div class="info-block">
            <div>
                <h6>username: ${sessionScope.user.username}</h6>
            </div>
            <div>
                <h6>email: ${sessionScope.user.email}</h6>
            </div>
        </div>
    </div>
    <div class="ad-container">
        <div class="ad-name">
            <div class="ad-description">
                <h3> Description</h3>
                <h4>${sessionScope.ad.description}</h4>
            </div>
        </div>
    </div>

</body>
</html>
