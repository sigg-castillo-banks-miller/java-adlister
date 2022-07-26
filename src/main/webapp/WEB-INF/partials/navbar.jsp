<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg bg-light mb-3">
    <div class="container-fluid">
        <a class="navbar-brand" href="/ads"><i class="bi bi-newspaper" style="font-size: 2rem"></i>
            <span class="fw-bold text-xxl-start">Adlister</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item loggedIn" style=display:none>
                    <a class="nav-link active" aria-current="page" href="/ads/create">Create an Ad</a>
                </li>
            </ul>
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item loggedOut">
                    <a class="nav-link active" aria-current="page" href="/login">Login</a>
                </li>
                <li class="nav-item loggedOut">
                    <a class="nav-link active" aria-current="page" href="/register">Register</a>
                </li>
                <li class="nav-item loggedIn" style=display:none>
                    <a class="nav-link active" aria-current="page" href="/profile">View Profile</a>
                </li>
                <li class="nav-item loggedIn" style=display:none>
                    <a class="nav-link" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<c:if test="${user != null && user != ' there'}">
    <script>
        const elem = document.getElementsByClassName("loggedIn");
        for (let i = 0; i < elem.length; i++) {
            elem[i].style.display = "block";
        }
        const elem2 = document.getElementsByClassName("loggedOut");
        for (let i = 0; i < elem2.length; i++) {
            elem2[i].style.display = "none";
        }
    </script>
</c:if>
