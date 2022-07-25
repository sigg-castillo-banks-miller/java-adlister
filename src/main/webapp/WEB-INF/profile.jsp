<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
    <div class="body-container">
        <div class="container mx-auto">
            <h1>Welcome, ${sessionScope.user.username}!</h1>
        </div>
        <div class="info-container  d-flex justify-content-between align-items-center mx-auto">
            <div class="info-block ">
                <div>
                    <h6>username: ${sessionScope.user.username}</h6>
                </div>
                <div>
                    <h6>email: ${sessionScope.user.email}</h6>
                </div>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Click to Edit</button>
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
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
        Launch static backdrop modal
    </button>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Understood</button>
                </div>
            </div>
        </div>
    </div>

<script>
    document.getElementById("button").addEventListener("click", function (){
        document.querySelector(".modal fade").style.display = "flex"
    })
</script>
</body>
</html>
