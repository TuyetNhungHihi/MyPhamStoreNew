window.onload = () =>{
    displayCart();
}

const displayCart = () =>{
    cart = JSON.parse(localStorage.getItem('cart'));
    let orderTotal = 0;
    let html = '';
    cart.forEach(item => {
        html += `
            <tr>
                <td>${item.product.name}</td>
                <td>${item.product.price}</td>
                <td>${item.quantity}</td>
            </tr>
        `;
        orderTotal += item.product.price * item.quantity;
    });

    document.querySelector('tbody').innerHTML = html;
    document.querySelector('tfoot').innerHTML = `
                        <tr>
                            <td>Tổng cộng</td>
                            <td col-span="2">${orderTotal} đ</td>
                        </tr>
                        `;
}