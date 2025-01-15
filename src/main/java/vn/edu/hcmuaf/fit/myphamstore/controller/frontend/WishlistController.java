package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl.WishlistDAOImpl;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.service.impl.WishlistServiceImpl;

import org.jdbi.v3.core.Jdbi;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "WishlistController", value = "/wishlist")
public class WishlistController extends HttpServlet {
    private WishlistServiceImpl wishlistService;

    @Override
    public void init() throws ServletException {
        super.init();
        Jdbi jdbi = Jdbi.create("jdbc:postgresql://localhost:5432/yourdb", "username", "password");
        wishlistService = new WishlistServiceImpl(new WishlistDAOImpl(jdbi));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        if (productId == null || productId.isEmpty()) {
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print("{\"success\": false, \"message\": \"Product ID is missing.\"}");
            out.flush();
            return;
        }

        HttpSession session = request.getSession();
        Long userId = (Long) session.getAttribute("userId");

        if (userId != null) {
            wishlistService.addToWishlist(userId, Long.parseLong(productId));
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print("{\"success\": true}");
            out.flush();
        } else {
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print("{\"success\": false}");
            out.flush();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Long userId = (Long) session.getAttribute("userId");

        if (userId != null) {
            List<ProductModel> wishlist = wishlistService.getWishlist(userId);
            request.setAttribute("wishlist", wishlist);
            request.getRequestDispatcher("/frontend/wishlist.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/fontend/login");
        }
    }
}