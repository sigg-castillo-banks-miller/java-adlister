<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dalton
  Date: 7/25/22
  Time: 11:59 AM
  To change this template use File | Settings | File Templates.
--%>

<div class="card col-4 m-3" style="width: 18rem;">
    <div class="card-body">
        <h5 class="card-title">
            <a href="/ad?id=${param.id}">${param.title}</a>
        </h5>
        <p class="card-text">${param.description}</p>
    </div>
</div>