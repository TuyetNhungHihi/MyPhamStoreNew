package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.dao.IProductDAO;
import vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl.ProductDAOImpl;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;

import java.io.IOException;
import java.util.List;

public class ProductController extends HttpServlet {
    private IProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductModel> tayTrangProducts = productDAO.getProductsByCategory(1L); // Assuming 1 is the category ID for Tẩy Trang
        List<ProductModel> chongNangProducts = productDAO.getProductsByCategory(2L); // Assuming 2 is the category ID for Chống Nắng
        List<ProductModel> suaRuaMatProducts = productDAO.getProductsByCategory(3L); // Assuming 3 is the category ID for Sữa Rửa Mặt

        List<ProductModel> latestTayTrangProducts = productDAO.getLatestProductsByCategory(1L, 5);
        List<ProductModel> latestChongNangProducts = productDAO.getLatestProductsByCategory(2L, 5);
        List<ProductModel> latestSuaRuaMatProducts = productDAO.getLatestProductsByCategory(3L, 5);

        request.setAttribute("tayTrangProducts", tayTrangProducts);
        request.setAttribute("chongNangProducts", chongNangProducts);
        request.setAttribute("suaRuaMatProducts", suaRuaMatProducts);
        request.setAttribute("latestTayTrangProducts", latestTayTrangProducts);
        request.setAttribute("latestChongNangProducts", latestChongNangProducts);
        request.setAttribute("latestSuaRuaMatProducts", latestSuaRuaMatProducts);
        request.getRequestDispatcher("frontend/home.jsp").forward(request, response);
    }
}