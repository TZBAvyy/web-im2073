<%@ page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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

        <form action="/login" method="post" class="form-container">
            <c:if test="${not empty error}">
                <h2 class='error'><c:out value="${error}"/></h2>
            </c:if>

            <label for="email">Email:</label>
            <input type="email" name="email" value="" required>

            <label for="password">Password:</label>
            <input type="password" name="password" value="" required minlength=4>

            <input type="submit" value="Submit">
            <a href="/signup">Sign up</a>
        </form>
	</jsp:body>
</t:base>