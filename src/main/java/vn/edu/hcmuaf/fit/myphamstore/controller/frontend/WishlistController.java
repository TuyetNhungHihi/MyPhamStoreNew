package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl.WishlistDAOImpl;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IProductService;
import vn.edu.hcmuaf.fit.myphamstore.service.impl.WishlistServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "WishlistController", value = "/wishlist")
public class WishlistController extends HttpServlet {
    @Inject
    private WishlistServiceImpl wishlistService;
    @Inject
    private IProductService productService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserModel user = (UserModel) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        int currentPage = 1;
        int pageSize = 6;
        if (request.getParameter("currentPage") != null) {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
        if (request.getParameter("pageSize") != null) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        }
        List<ProductModel> productsWishlist = wishlistService.getWishlistByUserId(user.getId(), currentPage, pageSize);
        int totalItems = wishlistService.getWishlistCountByUserId(user.getId());
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);

        // Sử dụng attribute name nhất quán
        request.setAttribute("productsWishlist", productsWishlist);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("/frontend/wishlist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Thêm sản phẩm vào wishlist
        UserModel user = (UserModel) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        long productId = Long.parseLong(request.getParameter("productId"));
        wishlistService.addToWishlist(user.getId(), productId);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"success\": true}");
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xóa sản phẩm khỏi wishlist
        UserModel user = (UserModel) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        long productId = Long.parseLong(request.getParameter("productId"));
        wishlistService.removeFromWishlist(user.getId(), productId);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"success\": true}");
    }
}
