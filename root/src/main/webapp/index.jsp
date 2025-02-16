<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>
	<jsp:attribute name="head">
		<title>The Cat Meme Shop - Home page</title>	
		<link rel="stylesheet" href="static/css/home.css">

		<script>
            const obj = document.document.querySelector(".catObject");
            const container = document.querySelector(".catBox");

            function moveRandom() {
                const maxX = container.clientWidth - obj.clientWidth;
                const maxY = container.clientHeight - obj.clientHeight;

                const randomX = Math.random() * maxX;
                const randomY = Math.random() * maxY;

                object.style.transition = "top 0.5s linear, left 0.5s linear";
                obj.style.left = `${randomX}px`;
                obj.style.top = `${randomY}px`;
            }

            setInterval(moveRandom, 1000);
        </script>
    </jsp:attribute>

	<jsp:body>
		<div id="heroArea">
                <div id="ad">
                    <h2>the Purr-fect place <br> for Cat Meme Lovers</h2>
                    </div>
                <div id="trolley">
                    <img src="static/asset/trolley.png" alt="Trolley" style="width: 250px; height: auto; padding-top: 10px;">
                </div>
        </div>

        <!-- Drag and Drop Marquee -->
        <div class="marquee-container">
            <div class="marquee">
                DRAG AND DROP YOUR FAVOURITE CAT INTO THE SHOPPING CART &emsp; &emsp;
                DRAG AND DROP YOUR FAVOURITE CAT INTO THE SHOPPING CART &emsp; &emsp; 
                DRAG AND DROP YOUR FAVOURITE CAT INTO THE SHOPPING CART
            </div>
        </div>

        <!-- Cat Moving Area -->
        <div class="catBox">
            <div class="catObject" id="movingCat"><img src="static/asset/politeCat.png" alt="happyCat" style="width: 200px; height: auto;"></div>
        </div>
	</jsp:body>
</t:base>