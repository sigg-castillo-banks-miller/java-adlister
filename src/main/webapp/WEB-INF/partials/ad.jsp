<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dalton
  Date: 7/25/22
  Time: 11:59 AM
  To change this template use File | Settings | File Templates.
--%>
<div class="card col-4 m-3 ad-card" data-id="${requestScope.ad.id}">
    <div class="card-body clickable d-flex flex-column ">
        <h5 class="card-title clickable">
            <c:out value="${requestScope.ad.title}"/>
        </h5>
        <p class="card-text clickable"><c:out value="${requestScope.ad.description}"/></p>
        <p class="card-text mt-auto">
            <c:forEach var="category" items="${requestScope.categories}">
                <small class="text-muted ad-category">
                    <a href="${pageContext.request.contextPath}/ads?category=${category.id}">${category.name}</a>
                </small>
            </c:forEach>
        </p>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <c:if test="${requestScope.ad.userId == sessionScope.user.id && requestScope.showAdOptions}">
                <button type="button" data-ad-id="${requestScope.ad.id}" class="btn btn-primary btn-sm edit-btn"
                        data-bs-toggle="modal" data-bs-target="#editModal">
                    Edit Ad
                </button>
                <form method="post" action="${pageContext.request.contextPath}/ads/delete" class="m-0">
                    <button type="submit" name="id" value="${requestScope.ad.id}" class="btn btn-primary btn-sm">Delete Ad</button>
                </form>
            </c:if>
        </div>
    </div>
</div>
