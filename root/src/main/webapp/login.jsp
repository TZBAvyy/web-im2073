<%@ page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<t:base>
	<jsp:attribute name="head">
		<title>The Cat Meme Shop - Login</title>	
		<link rel="stylesheet" href="static/css/login.css">
    </jsp:attribute>

	<jsp:body>
		<div class="login-signup-container">
            <div class="tab">
                <a href="login.jsp"><h3>Login</h3></a>
                <a href="signup.jsp"><h3>Sign Up</h3></a>
            </div>
            <div class="inner-form">
                <form action="/login" method="POST">
                    <c:if test="${not empty error}">
                        <h2 class='error'><c:out value="${error}"/></h2>
                    </c:if>

                    <label for="email">Email:</label>
                    <input type="text" id="email" name="email" value="" placeholder="Email" required>
        
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" value="" placeholder="Password" required>
        
                    <button type="submit">Login</button>
                    <div class="signup-link">Not yet registered? <a href="/signup">Sign Up NOW</a></div>
                </form>
            </div>
        </div>
	</jsp:body>
</t:base>