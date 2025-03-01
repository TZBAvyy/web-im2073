<%@ page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %> <%-- To use <t: > (.tag files in WEB-INF/tags) --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> <%-- To use <c: > tags from core JSTL library  --%>

<t:base>
	<jsp:attribute name="head">
		<title>The Cat Meme Shop - Home page</title>	
		<link rel="stylesheet" href="static/css/home.css">
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
            
        </div>
	</jsp:body>
</t:base>