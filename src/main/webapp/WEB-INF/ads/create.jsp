<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Create a new Ad"/>
        </jsp:include>
        <script src="${pageContext.request.contextPath}/scripts/ads/create.js" defer></script>
    </head>
    <body data-barba="wrapper">
        <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
        <main data-barba="container" data-barba-namespace="create-ad">
            <div class="container">
                <c:if test="${param.msg != null}">
                    <div class="alert alert-danger">
                        <strong><c:out value="${param.msg}"/></strong>
                    </div>
                </c:if>
                <h1>Create a new Ad</h1>
                <form action="/ads/create" method="post" class="d-flex flex-column gap-2">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input id="title" name="title" class="form-control" type="text" value="${param.title}" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" name="description" class="form-control" type="text"
                                  required>${param.description}</textarea>
                    </div>
                    <div class="form-group">
                        <p>Category:</p>
                        <div>
                            <c:forEach var="category" items="${categories}">
                                <div>
                                    <label for="${category.name}">
                                        <input type="checkbox" id="${category.name}" name="categories" value="${category.id}">
                                            ${category.name}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <input type="submit" class="btn btn-block btn-primary">
                </form>
            </div>
        </main>
    </body>
</html>
