package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IProductService;
import vn.edu.hcmuaf.fit.myphamstore.service.impl.ProductServiceImpl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "WishlistController", value = "/wishlist")
public class WishlistController extends HttpServlet {
    private IProductService productService = new ProductServiceImpl();

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
        List<ProductModel> wishlist = (List<ProductModel>) session.getAttribute("wishlist");

        if (wishlist == null) {
            wishlist = new ArrayList<>();
        }

        ProductModel product = productService.findProductById(Long.parseLong(productId));
        if (product != null && !wishlist.contains(product)) {
            wishlist.add(product);
            session.setAttribute("wishlist", wishlist);
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


        request.getRequestDispatcher("/frontend/wishlist.jsp").forward(request, response);
    }
}