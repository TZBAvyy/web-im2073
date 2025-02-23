<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>
	<jsp:attribute name="head">
		<title>The Cat Meme Shop - Login</title>	
		<link rel="stylesheet" href="static/css/login.css">
    </jsp:attribute>

	<jsp:body>
		<div id="heroArea">
            <div id="ad">
                <h2>Login</h2>
            </div>
        </div>

        <t:loginform />
	</jsp:body>
</t:base>