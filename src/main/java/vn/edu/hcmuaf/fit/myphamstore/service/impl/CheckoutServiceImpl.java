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
import vn.edu.hcmuaf.fit.myphamstore.service.ICheckoutService;
import vn.edu.hcmuaf.fit.myphamstore.service.IProductService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

@ApplicationScoped
public class CheckoutServiceImpl implements ICheckoutService {
    @Inject
    private ICheckoutService checkoutService;
    @Inject
    private IProductService productService;

    @Override
    public void displayCheckout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartModel> listCartItems = (List<CartModel>) session.getAttribute("cart");
        if (listCartItems == null) {
            request.setAttribute("errorMessage", "Your cart is empty.");
            request.getRequestDispatcher("/frontend/shopping_cart.jsp").forward(request, response);
        return;
        }
        List<CartModelHelper> listCartDisplay = new ArrayList<>();
        AtomicLong totalAmount = new AtomicLong(0);
        try {
            for (CartModel cartItem : listCartItems) {
                ProductModel product = productService.findProductById(cartItem.getProductId());
                if (product == null) {
                    request.setAttribute("errorMessage", "Product not found: " + cartItem.getProductId());
                    request.getRequestDispatcher("/frontend/shopping_cart.jsp").forward(request, response);
                    return;
                }
                totalAmount.addAndGet(product.getPrice() * cartItem.getQuantity());
                listCartDisplay.add(new CartModelHelper(product, cartItem.getQuantity()));
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An error occurred while processing your cart.");
            request.getRequestDispatcher("/frontend/shopping_cart.jsp").forward(request, response);
            return;
        }
        request.setAttribute("listCart", listCartDisplay);
        request.setAttribute("totalAmount", totalAmount);
        request.getRequestDispatcher("/frontend/checkout.jsp").forward(request, response);
    }

    @Override
    public void checkout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartModel> listCartItems = (List<CartModel>) session.getAttribute("cart");
        if (listCartItems == null) {
            request.setAttribute("errorMessage", "Your cart is empty.");
            request.getRequestDispatcher("/frontend/shopping_cart.jsp").forward(request, response);
            return;
        }
        List<CartModelHelper> listCartDisplay = new ArrayList<>();
        AtomicLong totalAmount = new AtomicLong(0);
        try {
            for (CartModel cartItem : listCartItems) {
                ProductModel product = productService.findProductById(cartItem.getProductId());
                if (product == null) {
                    request.setAttribute("errorMessage", "Product not found: " + cartItem.getProductId());
                    request.getRequestDispatcher("/frontend/shopping_cart.jsp").forward(request, response);
                    return;
                }
                totalAmount.addAndGet(product.getPrice() * cartItem.getQuantity());
                listCartDisplay.add(new CartModelHelper(product, cartItem.getQuantity()));
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An error occurred while processing your cart.");
            request.getRequestDispatcher("/frontend/shopping_cart.jsp").forward(request, response);
            return;
        }

    }
}
