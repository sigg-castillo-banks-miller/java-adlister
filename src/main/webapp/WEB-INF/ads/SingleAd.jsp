<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>SingleAd</title>
</head>
<body>
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
</body>
</html>
