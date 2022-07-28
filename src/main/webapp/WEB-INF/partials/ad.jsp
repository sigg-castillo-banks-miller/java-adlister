<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dalton
  Date: 7/25/22
  Time: 11:59 AM
  To change this template use File | Settings | File Templates.
--%>

<div class="card col-4 m-3 ad-card" data-id="${requestScope.ad.id}">
    <div class="card-body">
        <h5 class="card-title">
            <c:out value="${requestScope.ad.title}"/>
        </h5>
        <c:if test="${requestScope.ad.userId == sessionScope.user.id}">
            <button type="button" data-ad-id=${requestScope.ad.id} id="button" class="btn btn-primary edit-btn" data-bs-toggle="modal" data-bs-target="#editModal">
                Click to Edit
            </button>

            <form method="post" action="/ads/delete">
                <button name="id" value="${requestScope.ad.id}">Delete Ad</button>
            </form>
        </c:if>
        <p class="card-text"><c:out value="${requestScope.ad.description}"/></p>
        <p class="card-text">
            <c:forEach var="category" items="${requestScope.categories}">
                <small class="text-muted">
                    <a href="/ads?category=${category.id}">${category.name}</a>
                </small>
                &nbsp;
            </c:forEach>
        </p>
    </div>
</div>




