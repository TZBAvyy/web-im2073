<%@ page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<t:base>
	<jsp:attribute name="head">
		<title>The Cat Meme Shop - Sign Up</title>	
		<link rel="stylesheet" href="static/css/login.css">
    </jsp:attribute>

	<jsp:body>
		<div class="login-signup-container">
            <div class="tab">
                <a href="login.jsp"><h3>Login</h3></a>
                <a href="signup.jsp"><h3>Sign Up</h3></a>
            </div>
            <div class="inner-form">
                <form action="/signup" method="POST">
                    <c:if test="${not empty error}">
                        <h2 class='error'><c:out value="${error}"/></h2>
                    </c:if>

                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="" placeholder="Username" required>

                    <label for="address">Address:</label>
                    <input type="text" name="address" value="" placeholder="Address" required>

                    <label for="phoneNumber">Phone Number:</label>
                    <input type="text" name="phoneNumber" value="" placeholder="Phone No." required>
        
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="" placeholder="Email" required>
                    
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" value="" placeholder="Password" required minlength=4>
        
                    <button type="submit">Sign Up</button>
                </form>
            </div>
        </div>
	</jsp:body>
</t:base>