<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>
	<jsp:attribute name="head">
		<title>The Cat Meme Shop - Logout</title>	
		<link rel="stylesheet" href="static/css/login.css">
    </jsp:attribute>

	<jsp:body>
		<div id="heroArea">
            <div id="ad">
                <h2>Logout - Are you sure?</h2>
            </div>
        </div>

        <form action="/logout" method="post" class="form-container">
            <input type="submit" value="Yes, logout">
            <a href="/">Cancel</a>
        </form>
	</jsp:body>
</t:base>