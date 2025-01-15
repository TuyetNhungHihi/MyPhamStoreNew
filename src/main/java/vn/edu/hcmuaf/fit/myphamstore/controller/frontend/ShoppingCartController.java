package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.myphamstore.service.ICartService;
import vn.edu.hcmuaf.fit.myphamstore.service.IProductService;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ShoppingCartController", value = "/gio-hang")
public class ShoppingCartController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Inject
    private ICartService cartService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        cartService.displayCart(request, response);
//        HttpSession session = request.getSession();
//        @SuppressWarnings("unchecked")
//        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute("cart");
//        if (cart == null) {
//            cart = new HashMap<>();
//            session.setAttribute("cart", cart);
//        }
//        request.setAttribute("cart", cart);
//        request.setAttribute("productService", productService); // Pass productService to JSP
//        request.getRequestDispatcher("/frontend/shopping_cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            cartService.addToCart(request, response);
        } else if ("updateCart".equals(action)) {
            cartService.updateCart(request, response);
        } else if ("remove".equals(action)) {
            cartService.removeCartItem(request, response);
        } else if ("clear".equals(action)) {
            cartService.clearCart(request, response);
        }

//        HttpSession session = request.getSession();
//        @SuppressWarnings("unchecked")
//        Map<Long, Integer> cart = (Map<Long, Integer>) session.getAttribute("cart");
//        if (cart == null) {
//            cart = new HashMap<>();
//            session.setAttribute("cart", cart);
//        }
//
//        String action = request.getParameter("action");
//        String productIdStr = request.getParameter("productId");
//        Long productId = null;

//        try {
//            productId = Long.parseLong(productIdStr);
//        } catch (NumberFormatException e) {
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
//            return;
//        }

//        // Kiểm tra sự tồn tại của sản phẩm trước khi thêm vào giỏ hàng
//        if (productService.findById(productId) == null) {
//            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
//            return;
//        }

//        if ("add".equals(action)) {
//            cart.put(productId, cart.getOrDefault(productId, 0) + 1);
//        }
//
//        response.sendRedirect(request.getContextPath() + "/gio-hang");
    }

}