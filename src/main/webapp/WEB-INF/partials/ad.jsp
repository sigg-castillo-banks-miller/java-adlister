<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dalton
  Date: 7/25/22
  Time: 11:59 AM
  To change this template use File | Settings | File Templates.
--%>

<div class="card col-4 m-3">
    <div class="card-body">
        <h5 class="card-title">
            <a href="/ad?id=${requestScope.ad.id}"><c:out value="${requestScope.ad.title}"/></a>
        </h5>
        <p class="card-text"><c:out value="${requestScope.ad.description}"/></p>
        <p class="card-text">
            <c:forEach var="category" items="${requestScope.categories}">
                <small class="text-muted">
                    <a href="/ads?category=${category.id}">${category.name}</a>
                </small>
                &nbsp;
            </c:forEach>
        </p>
        <a href="/SingleAd?id=${requestScope.ad.id}">
            <button type="button" id="view-ad" class="btn btn-primary">
                Click to View
            </button>
        </a>
    </div>
</div>
