<%@ tag description="Product Card Template for Meme Item" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ attribute name="id" required="true" %>
<%@ attribute name="imagelink" required="true" %>
<%@ attribute name="name" required="true" %>
<%@ attribute name="price" required="true" %>

<div class="productcard"  
    data-productId="${id}"
    data-productImage="${imagelink}"
    data-productName="${name}"
    data-description="Nil"
    data-price="${price}"
>
    <img src="${imagelink}" alt="${name}">

    <div class="qty">
        <button class="minus">-</button>

        <input type="number" class="qtyInput" name="${id}" min="0" value="0">

        <button class="plus">+</button>
    </div>

    <div class="description">
        <div class="name-price">
            <h2>
            ${name}
            </h2>
            <h4 class="unitPrice">
            ${price}
            </h4>
        </div>
        
        <p>Nil (For now)</p>
    </div>
</div>