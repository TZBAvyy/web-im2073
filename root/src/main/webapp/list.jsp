<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>
	<jsp:attribute name="head">
		<title>The Cat Meme Shop - Home page</title>	
		<link rel="stylesheet" href="static/css/list.css">
    </jsp:attribute>

	<jsp:body>
		<div id="heroArea">
            <div id="ad">
                <h2>Cat Memes Gallery</h2>
            </div>
        </div>

        <!-- Cat Moving Area -->
        <div class="catBox">
            <div class="catObject" id="movingCat">
                <t:catobjects/>
            </div>
        </div>
	</jsp:body>
</t:base>