<%@ page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
            <c:forEach items="${result}" var="cat">
                <div class='catObject'>
                    <img 
                        src="<c:out value="${cat.imagelink}"/>" 
                        alt="<c:out value="${cat.name}"/>"
                        style='width: 200px; height: auto;'
                    >
                    <p>
                        <c:out value="${cat.name}"/> (<c:out value="${cat.price}"/>)
                    </p>
                </div>
            </c:forEach>
        </div>
	</jsp:body>
</t:base>