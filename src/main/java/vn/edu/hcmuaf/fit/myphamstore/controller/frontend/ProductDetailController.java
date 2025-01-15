package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import jakarta.inject.Inject;
import vn.edu.hcmuaf.fit.myphamstore.dao.IProductDAO;
import vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl.ProductDAOImpl;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductImageModel;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.service.IProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDetailController", value = "/chi-tiet-san-pham")
public class ProductDetailController extends HttpServlet {
    @Inject
    private IProductService productService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");
        Long id = Long.parseLong(productId);
        ProductModel product = productService.getProductDetail(id);
        System.out.println(product);
        request.setAttribute("product", product);
        BrandModel brand = productService.getBrandById(product.getBrandId());
        request.setAttribute("brand", brand);
        List<ProductImageModel> productImages = productService.getProductImageById(id);
        request.setAttribute("productImages", productImages);
        System.out.println(productImages);
        request.getRequestDispatcher("/frontend/product_detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}