<%@ tag description="Overall Page template" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ attribute name="head" fragment="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head> 
    <link rel="stylesheet" href="static/css/general.css">
    <script src="https://kit.fontawesome.com/e617f52b14.js" crossorigin="anonymous"></script>

    <%-- EXTRA HEAD COMPONENTS FOR DIFFERENT TITLE/CSS FILES --%>
    <jsp:invoke fragment="head"/> 
</head>

<body>
    <%-- BASE HEADER COMPONENT --%>
    <header>
        <div id="logo">
            <h1><a href="/">The Cat Meme Shop</a></h1>
        </div>

        <c:if test="${not empty accInfo}">
            <div><h2>Logged in as: ${accInfo.name}</h2></div>
        </c:if>
        <%-- <%
        User accInfo = (User)request.getSession().getAttribute("accInfo");
        if (accInfo != null) {
            out.println("<div><h2>Logged in as: " + accInfo.name + "</h2></div>");
        }
        %> --%>

        <div>
            <ul id="iconbar">
                <li><a href="/"><i class="fa-regular fa-heart"></i></a></li>
                <li><a href="/list"><i class="fa-solid fa-box"></i></a></li>
                <li><a href="/"><i class="fa-solid fa-cart-shopping"></i></a></li>
                <li>
                    <%-- <a href=<% if (accInfo==null) out.println("/login"); else out.println("/logout"); %>>
                        <i class="fa-solid fa-user"></i>
                    </a> --%>
                    <a href="
                        <c:choose>
                            <c:when test="${empty accInfo}">/login</c:when>
                            <c:otherwise>/logout</c:otherwise>
                        </c:choose>
                    ">
                        <i class="fa-solid fa-user"></i>
                    </a>
                </li>
            </ul>
        </div>
    </header>

    <%-- CONTENT COMPONENT --%>
    <div id="wrapper">
        <jsp:doBody/>
    </div>

    <%-- BASE FOOTER COMPONENT --%>
    <footer>
        <div class="marquee-container">
            <div class="marquee">
                DEVELOPED BY AVISENA GIBRALTAR AND SEAW ZHI YI &emsp; &emsp;
                DEVELOPED BY AVISENA GIBRALTAR AND SEAW ZHI YI &emsp; &emsp; 
                DEVELOPED BY AVISENA GIBRALTAR AND SEAW ZHI YI
            </div>
        </div>
    </footer>
</body>
</html>