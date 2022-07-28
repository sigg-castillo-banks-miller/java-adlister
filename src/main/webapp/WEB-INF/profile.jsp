
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
    <title>User-Profile</title></head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
    <div class="body-container">
        <div class="container mx-auto">
            <h1>Welcome ${sessionScope.user.username}!</h1>
        </div>
        <div class="info-container  d-flex justify-content-between align-items-center mx-auto">
            <div class="info-block ">
                <div>
                    <h6>username: ${sessionScope.user.username}</h6>
                </div>
                <div>
                    <h6>email: ${sessionScope.user.email}</h6>
                </div>
                <br>
                <!-- Button trigger modal -->
                <button type="button" id="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                   Click to Edit
                </button>
            </div>
        </div>
    </div>
    <br>
    <hr>

    <div class="ads-container row justify-content-center">
        <c:forEach var="i" items="${ads}">
            <c:set var="ad" value="${i.key}" scope="request"/>
            <c:set var="categories" value="${i.value}" scope="request"/>
            <c:import url="/WEB-INF/partials/ad.jsp"/>
        </c:forEach>

<%--    <div class="ad-container">--%>
<%--        <div class="ad-name">--%>
<%--            <div class="ad-description">--%>
<%--                <h3> Description</h3>--%>
<%--                <h4>${sessionScope.ad.description}</h4>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <!-- Modal -->
   <form action="${pageContext.request.contextPath}/profile" method="post">
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel" style="margin-left: auto">Edit Profile</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label" >Edit Username:</label>
                            <input type="text" class="form-control" id="recipient-name" name="username" value="${sessionScope.user.username}">
                        </div>
                        <div class="mb-3">
                            <label for="email-change" class="col-form-label">Edit email:</label>
                            <input type="email" class="form-control" id="email-change" name="email" value="${sessionScope.user.email}">
                        </div>
                        <div class="mb-3">
                            <label for="password-change" class="col-form-label">New Password:</label>
                            <input type="password" class="form-control" id="password-change" name="password">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" id="save-btn" value="save-btn" class="btn btn-primary">Save Changes</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    document.getElementById("button").addEventListener("click", function (){
        document.querySelector("#staticBackdrop").style.display = "flex"
    })
</script>
</body>
</html>
