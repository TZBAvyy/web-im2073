<%@ page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<t:base>
	<jsp:attribute name="head">
		<title>The Cat Meme Shop - Order Details</title>	
		<link rel="stylesheet" href="static/css/orderDetails.css">
    </jsp:attribute>

	<jsp:body>
        <div id="wrapper">
            <h3><i class="fa-solid fa-list-check"></i>&nbsp; My Order</h3>
            <div class="orders">
                <c:choose>
                    <c:when test="${not empty orders}">
                        <c:forEach var="order" items="${orders}">
                            <div class="orderContainer">
                                <h3>Order ID: ${String.format("%04d", order.orderId)}</h3>
                                <p>Order Date: ${order.orderDate}</p>
                                <div class="orderItems">
                                    <c:forEach var="item" items="${order.items}">
                                        <div class="orderItem">
                                            <div class="orderDetails">
                                                <img src="${item.productImage}" alt="Product Image">
                                                <div class="orderInfo">
                                                    <h3>${item.productName}</h3>
                                                    <p>${item.description}</p>
                                                    <p>Quantity: ${item.quantity}</p>
                                                </div>
                                                <div class="orderPrice">$${String.format("%.2f", item.subTotal)}</div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="total"><h3>Total: $${String.format("%.2f", order.totalPrice)}</h3></div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p>No orders found.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
	</jsp:body>
</t:base>