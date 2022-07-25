<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dalton
  Date: 7/25/22
  Time: 11:59 AM
  To change this template use File | Settings | File Templates.
--%>
<div class="ad-card">
    <h1><c:out value="${param.title}"/></h1>
    <p><c:out value="${param.description}"/></p>
</div>
