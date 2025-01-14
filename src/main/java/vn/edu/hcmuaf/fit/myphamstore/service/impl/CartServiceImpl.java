package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.myphamstore.model.CartModel;
import vn.edu.hcmuaf.fit.myphamstore.model.CartModelHelper;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.service.ICartService;
import vn.edu.hcmuaf.fit.myphamstore.service.IProductService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

@ApplicationScoped
public class CartServiceImpl implements ICartService {
    @Inject
    private IProductService productService;
    @Override
    public void addToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long productId = Long.parseLong(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity")==null?"1":request.getParameter("quantity"));
        CartModel item = CartModel.builder().productId(productId).quantity(quantity).build();

        HttpSession session = request.getSession();
        List<CartModel> listCartItems = session.getAttribute("cart")==null ? new ArrayList<>() : (List<CartModel>) session.getAttribute("cart");
        System.out.println("TRuoc khi them: "+listCartItems);
        listCartItems.forEach(cartItem -> {
            if (cartItem.equals(item)) { //check xem sản phẩm đã có trong giỏ hàng chưa
                cartItem.setQuantity(cartItem.getQuantity() + quantity);
                return;
            }
        });
        //nếu sản phẩm chưa có trong giỏ hàng thì thêm vào
        if(!listCartItems.contains(item)){
            listCartItems.add(item);
        }

        System.out.println("Sau khi them: "+listCartItems);
        session.setAttribute("cart", listCartItems);
        response.sendRedirect(request.getHeader("referer"));
    }

    @Override
    public void updateCart(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    public void removeCartItem(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    public void clearCart(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    public void displayCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartModel> listCartItems = (List<CartModel>)session.getAttribute("cart");
        if(listCartItems == null){
            request.getRequestDispatcher("/frontend/shopping_cart.jsp").forward(request, response);
            return;
        }
        //khi giỏ hàng có sản phẩm thì hiển thị ra
        List<CartModelHelper> listCartDisplay = new ArrayList<>();
        AtomicLong totalAmount = new AtomicLong(0);
        listCartItems.forEach(cartItem -> {
            ProductModel product = productService.findProductById(cartItem.getProductId());
            totalAmount.addAndGet(product.getPrice() * cartItem.getQuantity());
            listCartDisplay.add(new CartModelHelper(product, cartItem.getQuantity()));
        });
        request.setAttribute("listCartDisplay", listCartDisplay);
        request.setAttribute("totalAmount", totalAmount);
        request.getRequestDispatcher("/frontend/shopping_cart.jsp").forward(request, response);
    }
}
