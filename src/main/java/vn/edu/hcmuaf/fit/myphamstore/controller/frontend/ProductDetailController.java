package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import vn.edu.hcmuaf.fit.myphamstore.dao.IProductDAO;
import vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl.ProductDAOImpl;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/productDetail")
public class ProductDetailController extends HttpServlet {
    private IProductDAO productDAO = new ProductDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");
        if (productId != null) {
            Long id = Long.parseLong(productId);
            ProductModel product = productDAO.getProductDetail(id);
            request.setAttribute("product", product);
            request.getRequestDispatcher("/frontend/product_detail.jsp").forward(request, response);
        } else {
            response.sendRedirect("home.jsp");
        }
    }
}