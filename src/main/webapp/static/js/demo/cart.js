window.onload = () =>{
   const add = document.querySelector("#add-to-cart")
   if(add){
       add.addEventListener("click", () => {
           addToCart();
        });
      }
      listCart();
    
}

const listCart = () => {
  if(!window.location.href.includes('shopping_cart')) return;
  
    const cart = JSON.parse(localStorage.getItem("cart")) || [];
    let html = '';
    let totalOrder = 0;
    cart.forEach((item, index) => {
        totalOrder += item.totalPrice;
        html += `
            <tr>
                <td>${index}</td>
                    <td>
                      <div class="table_cart_img">
                        <figure>
                          <img
                            src="${item.product.thumbnail}"
                            alt="" height="75px" />
                        </figure>
                      </div>
                      <div class="table_cart_cntnt">
                        <h1>${item.product.name}</h1>
                        <p></p>
                      </div>
                    </td>
                    <td></td>
                    <td class="cart_page_price">${item.product.price}</td>
                    <td>
                      <input value="${item.quantity}" type="number" />
                    </td>
                    <td class="cart_page_totl">${item.totalPrice}</td>
                    <td>
                      <a href="#"> <i class="fa fa-trash"></i></a>
                    </td>
                  </tr>
        `;
    });
    
    html += `
    <tr>
                    <td></td>
                    <td class="shop_btn_wrapper shop_car_btn_wrapper">
                      <ul>
                        <li><a href="#">Tiếp tục mua sắm</a></li>
                      </ul>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>

                    <td class="cart_btn_cntnt">
                      Tổng cộng : <span>${totalOrder}đ </span>
                    </td>
                    <td></td>
                  </tr>
    `
    
    document.querySelector("#cart-body").innerHTML = html;

    document.querySelector("#table-total").innerHTML = `
    <tbody>
                  <tr>
                    <th>Tạm tính :</th>
                    <td><span class="price">${totalOrder}đ</span></td>
                  </tr>
                  <tr>
                    <th>Giảm giá :</th>
                    <td><span class="price">0</span></td>
                  </tr>
                  <tr>
                    <th class="cart_btn_cntnt">Tạm tính :</th>
                    <td>
                      <span class="cart_btn_cntnt_clr">${totalOrder}đ </span>
                    </td>
                  </tr>
                </tbody>
    `;

    
}

const addToCart = () => {
    
    const quantity = Number(document.querySelector("#input-quantity").value);
    //giả sử ta nhận được sản phẩm này từ server
    const product = {
        id: 2,
        name: 'Kem Dưỡng Ẩm Skin1004 Làm Dịu Da Chiết Xuất Rau Má Madagascar Centella Soothing Cream 75Ml',
        price: '259000',
        cost_price: '200000',
        description: 'Giới Thiệu Kem Dưỡng Ẩm Skin1004 Làm Dịu Da Chiết Xuất Rau Má 75ml là kem dưỡng đến từ thương hiệu mỹ phẩm Skin1004 của Hàn Quốc, thành phần chứa 72% chiết xuất rau má cùng với 4 loại Ceramide có nguồn gốc từ thực vật làm dịu làn da mụn, kích ứng, giúp tăng cường hàng rào bảo vệ da, nuôi dưỡng làn da khỏe mạnh.',
        thumbnail: 'https://www.guardian.com.vn/media/catalog/product/cache/30b2b44eba57cd45fd3ef9287600968e/3/0/3023960_gqyugemvie8iz6za.png'
    }
   
    //tạo và lưu trữ sản phẩm vào giỏ hàng

    let cart = JSON.parse(localStorage.getItem("cart")) || [];
    //kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
    const index = cart.findIndex(item => item.product.id === product.id);
    if(index !== -1){
        cart[index].quantity += quantity;
        cart[index].totalPrice = product.price * cart[index].quantity;
    }
    else{
        cart.push({product, quantity, totalPrice: product.price * quantity});
    }
    //lưu giỏ hàng vào localStorage
    localStorage.setItem("cart", JSON.stringify(cart));
    Toastify({
        text: "Thêm sản phẩm vào giỏ hàng thành công",
        duration: 3000,
        newWindow: true,
        close: true,
        gravity: "top", // `top` or `bottom`
        position: "center", // `left`, `center` or `right`
        stopOnFocus: true, // Prevents dismissing of toast on hover
        style: {
        //   background: "linear-gradient(to right, #00b09b, #96c93d)",
        },
        onClick: function(){} // Callback after click
      }).showToast();
}