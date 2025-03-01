// Add EventListener to change orderSummary

// for every <input> tag when user types in a number
document.querySelectorAll(".qtyInput").forEach(input => {
    input.addEventListener("input", updateOrderSummary);
});

// for every +/- <button> tag when user clicks a button
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

// Function to update summary table on the right/bottom of screen
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

            let productId = "meme_" + productCard.dataset.productid;
            let hiddenInput = document.getElementById(productId);
            if (hiddenInput) {
                // If hidden input for the meme_ID exists, update value only
                hiddenInput.value = qty;
            } else {
                // else add new <input type="hidden"> to <form> children
                let form = document.querySelector(".placeOrder");
                form.innerHTML += `<input type="hidden" name="${productId}" id="${productId}" value="${qty}">`
            }
        }
    });
    
    document.getElementById("total_price").value = totalAmount.toFixed(2); // Update hidden <input> for total_price
    document.getElementById("totalAmount").textContent = totalAmount.toFixed(2);
}

