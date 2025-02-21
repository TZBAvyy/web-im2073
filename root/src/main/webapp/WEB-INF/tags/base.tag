<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="head" fragment="true" %>

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

        <div>
            <ul id="iconbar">
                <li><a href="/"><i class="fa-regular fa-heart"></i></a></li>
                <li><a href="/list"><i class="fa-solid fa-box"></i></a></li>
                <li><a href="/"><i class="fa-solid fa-cart-shopping"></i></a></li>
                <li><a href="/"><i class="fa-solid fa-user"></i></a></li>
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