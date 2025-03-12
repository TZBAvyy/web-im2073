<%@ page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %> <%-- To use <t: > (.tag files in WEB-INF/tags) --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> <%-- To use <c: > tags from core JSTL library  --%>

<t:base>
	<jsp:attribute name="head">
		<title>Order Success!</title>	
		<link rel="stylesheet" href="static/css/loading.css">
    </jsp:attribute>

	<jsp:body>
		<div class="loading">
			<span class="dot"></span>
			<span class="dot"></span>
			<span class="dot"></span>
			<span class="dot"></span>
		</div>
        <h3>Order Received! Please wait a moment...</h3>
	</jsp:body>
</t:base>