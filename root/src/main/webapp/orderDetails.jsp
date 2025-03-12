<%@ page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<t:base>
	<jsp:attribute name="head">
		<title>The Cat Meme Shop - Order Details</title>	
		<link rel="stylesheet" href="static/css/orderDetails.css">
    </jsp:attribute>

	<jsp:body>
        <h3><i class="fa-solid fa-list-check"></i>&nbsp; My Order</h3>
        <div class="orders">
            <c:choose>
                <c:when test="${not empty orders}">
                    <c:forEach var="order" items="${orders}">
                        <div class="orderContainer">
                            <h3>Order ID: ${String.format("%04d", order.id)}</h3>
                            <p>Order Date: ${order.purchaseDatetime}</p>
                            <div class="orderItems">
                                <c:forEach var="item" items="${order.items}">
                                    <div class="orderItem">
                                        <div class="orderDetails">
                                            <img src="${item.meme.imagelink}" alt="Product Image">
                                            <div class="orderInfo">
                                                <h3>${item.meme.name}</h3>
                                                <p>${item.meme.desc}</p>
                                                <p>Quantity: ${item.meme_qty}</p>
                                            </div>
                                            <div class="orderPrice">$${String.format("%.2f", item.subtotal)}</div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="total"><h3>Total: $${String.format("%.2f", order.total_price)}</h3></div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p>No orders found.</p>
                </c:otherwise>
            </c:choose>
        </div>
	</jsp:body>
</t:base>