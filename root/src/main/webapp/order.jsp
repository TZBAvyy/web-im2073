<%@ page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<t:base>
	<jsp:attribute name="head">
		<title>The Cat Meme Shop - Meme Catalogue</title>	
		<link rel="stylesheet" href="static/css/order.css">
        <script src="static/js/order.js" defer></script>
    </jsp:attribute>

	<jsp:body>
        <!-- Left column -- Product catalogue -->
        <div id="leftCol">

            <h3><i class="fa fa-shopping-bag" aria-hidden="true"></i>&nbsp; Product Catalogue</h3>

            <div id="products">
                <c:choose>
                    <c:when test="${empty memes}">
                        <p>No Products available</p>
                    </c:when>

                    <c:otherwise>
                        <c:forEach var="meme" items="${memes}">
                            <t:productCard 
                                id="${meme.id}" 
                                name="${meme.name}" 
                                imagelink="${meme.imagelink}" 
                                price="${meme.price}"
                                description="${meme.desc}"
                            />
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>
        

        <!-- Right column -- Order summary -->
        <div id="rightCol">
            <h3><i class="fa-solid fa-list"></i>&nbsp; Order Summary</h3>
            <div class="orderSummary">
                <!-- 
                    loop and show every product quanntity > 0
                    No. product name | qty | unit price | subtotal
                    -----------------------------------------------
                    Total: $
                    Place order button 
                -->
                <table>
                    <thead>
                        <tr>
                            <th>Cat(s)</th>
                            <th>Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Order summary will be dynamically updated here -->
                    </tbody>
                    <tr>
                    <td><strong>Total</strong></td>
                    <td><strong>$<span id="totalAmount">0.00</span></strong></td>
                    </tr>
                </table>

                <form class="placeOrder" action="/order" method="post">
                    <%-- 
                    <input type="hidden"> for meme items and quantity will be dynamically updated here 
                    --%>
                    <input type="hidden" name="total_price" id="total_price" value="0">
                    <button type="submit">Place Order</button>
                </form>

            </div>
        </div>
        
	</jsp:body>
</t:base>