document.querySelectorAll(".qtyInput").forEach(input => {
    input.addEventListener("input", updateOrderSummary);
});

function updateOrderSummary() {
    let orderSummaryBody = document.querySelector("tbody");
    orderSummaryBody.innerHTML = "";
    let totalAmount = 0;

    document.querySelectorAll(".qtyInput").forEach(input => {
        let qty = parseInt(input.value);
        if (qty > 0) {
            let productCard = input.closest(".productcard");
            let productName = productCard.dataset.productname;
            let unitPrice = parseFloat(productCard.dataset.price);
            let subtotal = unitPrice * qty;
            totalAmount += subtotal;

            let row = 
            `<tr>
                <td>${productName} x${qty}</td>
                <td>$${subtotal.toFixed(2)}</td>
            </tr>`;
            orderSummaryBody.innerHTML += row;
        }
    });

    document.getElementById("totalAmount").textContent = totalAmount.toFixed(2);
}

document.querySelectorAll(".plus, .minus").forEach(button => {
    button.addEventListener("click", function() {
        let input = this.parentNode.querySelector(".qtyInput");
        let value = parseInt(input.value) || 0;

        if (this.classList.contains("plus")) {
            input.value = value + 1;
        } else if (this.classList.contains("minus") && value > 0) {
            input.value = value - 1;
        }

        updateOrderSummary();
    });
});