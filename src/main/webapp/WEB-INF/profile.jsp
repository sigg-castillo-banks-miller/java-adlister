<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Your Profile"/>
        </jsp:include>
    </head>
    <body data-barba="wrapper">
        <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
        <main data-barba="container" data-barba-namespace="profile">
            <c:if test="${param.success != null && param.error == null}">
                <div class="alert alert-success" role="alert">
                    Successfully updated profile!
                </div>
            </c:if>
            <c:if test="${param.error != null && param.success == null}">
                <div class="alert alert-danger" role="alert">
                    Error updating profile :( try again soon.
                </div>
            </c:if>
            <div class="card w-50 mx-auto">
                <div class="card-body p-4">
                    <div class="d-flex align-items-center">
                        <div class="flex-shrink-0">
                            <img src="https://icon-library.com/images/default-profile-icon/default-profile-icon-24.jpg"
                                 alt="Profile Image" class="img-fluid"
                                 style="width: 13vw"
                            >
                        </div>
                        <div class="flex-grow-1 ms-3">
                            <h5 class="mb-1"><c:out value="${sessionScope.user.username}"/></h5>
                            <div class="d-flex justify-content-start rounded-3 p-2 mb-2 gap-3">
                                <div>
                                    <p class="small text-muted mb-1">Ads</p>
                                    <p class="mb-0">${ads.size()}</p>
                                </div>
                                <div>
                                    <p class="small text-muted mb-1">Charisma</p>
                                    <p class="mb-0">100</p>
                                </div>
                            </div>
                            <div class="d-flex pt-1">
                                <button type="button" class="btn btn-primary me-1 flex-grow-1" data-bs-toggle="modal" data-bs-target="#editProfileModal">Edit Profile</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <hr>
            <%--AD CARDS--%>
            <div class="ads-container row justify-content-center">
                <c:forEach var="i" items="${ads}">
                    <c:set var="ad" value="${i.key}" scope="request"/>
                    <c:set var="categories" value="${i.value}" scope="request"/>
                    <c:import url="/WEB-INF/partials/ad.jsp"/>
                </c:forEach>
        </main>

        <!-- Modal -->
        <form action="${pageContext.request.contextPath}/profile" method="post">
            <div class="modal fade" id="editProfileModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                 aria-labelledby="staticBackdropLabel">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">

                            <h5 class="modal-title" id="staticBackdropLabel" style="margin-left: auto">Edit Profile</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form method="post" action="/profile">
                            <div class="modal-body">

                                <div class="mb-3">
                                    <label for="recipient-name" class="col-form-label">Edit Username:</label>
                                    <input type="text" class="form-control" id="recipient-name" name="username"
                                           value="${sessionScope.user.username}">
                                </div>
                                <div class="mb-3">
                                    <label for="email-change" class="col-form-label">Edit email:</label>
                                    <input type="email" class="form-control" id="email-change" name="email"
                                           value="${sessionScope.user.email}">
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="col-form-label">New Password:</label>
                                    <input type="password" class="form-control" id="password" name="password">
                                </div>
                                <div class="mb-3">
                                    <label for="password-confirm" class="col-form-label">Confirm Password:</label>
                                    <input type="password" class="form-control" id="password-confirm" name="password-confirm">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" id="save-btn" value="save-btn" class="btn btn-primary">Save Changes
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </form>
        <jsp:include page="/WEB-INF/partials/edit-ad-modal.jsp"/>
        <script>
            const editBtns = document.querySelectorAll('.edit-btn');
            for (let btn of editBtns) {
                btn.addEventListener('click', (e) => {
                    console.log('clicked');
                    document.querySelector('#ads-save-btn').value = btn.getAttribute('data-ad-id');
                })
            }
        </script>
    </body>
</html>
