package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl.WishlistDAOImpl;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;
import vn.edu.hcmuaf.fit.myphamstore.service.impl.WishlistServiceImpl;

import org.jdbi.v3.core.Jdbi;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "WishlistController", value = "/wishlist")
public class WishlistController extends HttpServlet {
    @Inject
    private WishlistServiceImpl wishlistService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserModel user = (UserModel) request.getSession().getAttribute("user");
        System.out.println(user);
        Long userId = user.getId();
        if (userId!= null) {
            List<ProductModel> wishlist = wishlistService.getWishlist(userId);
            request.setAttribute("wishlist", wishlist);
            request.getRequestDispatcher("/wishlist").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserModel user = (UserModel) request.getSession().getAttribute("user");
        System.out.println(user);
        Long userId = user.getId();
        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        long productId = Long.parseLong(request.getParameter("productId"));
        wishlistService.addToWishlist(userId, productId);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"success\": true}");
    }
}