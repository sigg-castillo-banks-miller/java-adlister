<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="All Ads"/>
        </jsp:include>
    </head>
    <body data-barba="wrapper">
        <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
        <main data-barba="container" data-barba-namespace="ads">
            <div class="container">
                <form action="/ads" method="GET" class="text-center" id="search-form">
                    <label>
                        Search:
                        <input name="query" placeholder="Search here..." class="p-2">
                    </label>
                    <input type="submit" value="Search" class="p-2 bg-black text-white border-0">
                </form>
                <div class="ads-container row justify-content-center">
                    <c:forEach var="i" items="${ads}">
                        <c:set var="ad" value="${i.key}" scope="request"/>
                        <c:set var="categories" value="${i.value}" scope="request"/>
                        <c:import url="/WEB-INF/partials/ad.jsp"/>
                    </c:forEach>
                </div>
            </div>
        </main>

        <script type="application/javascript">
            let cards = document.querySelectorAll(".ad-card");
            for (let card of cards) {
                card.addEventListener("click", function (e) {
                    e.stopPropagation();
                    const id = card.getAttribute("data-id")
                    window.location.href = "/ads/ad-details?id=" + id;
                })
            }
        </script>
    </body>
</html>
