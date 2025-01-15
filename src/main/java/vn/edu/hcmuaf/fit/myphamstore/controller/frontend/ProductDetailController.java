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
import vn.edu.hcmuaf.fit.myphamstore.model.ReviewModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDetailController", value = "/chi-tiet-san-pham")
public class ProductDetailController extends HttpServlet {
    @Inject
    private IProductService productService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double totalReview = 0.0;
        double totalReview1 = 0.0;
        double totalReview2= 0.0;
        double totalReview3 = 0.0;
        double totalReview4 = 0.0;
        double totalReview5 = 0.0;
        String productId = request.getParameter("id");
        Long id = Long.parseLong(productId);
        ProductModel product = productService.getProductDetail(id);
        request.setAttribute("product", product);
        BrandModel brand = productService.getBrandById(product.getBrandId());
        request.setAttribute("brand", brand);
        List<ProductImageModel> productImages = productService.getProductImageById(id);
        request.setAttribute("productImages", productImages);
        List<ReviewModel> reviews = productService.getReviewsByProductId(id);
        request.setAttribute("reviews", reviews);
        for (int i = 0; i < reviews.size(); i++) {
            totalReview += reviews.get(i).getRating() / reviews.size();
            if(reviews.get(i).getRating() == 5){
                totalReview5 += 1;
                totalReview5 = totalReview5/reviews.size();
            } else if (reviews.get(i).getRating() == 4) {
                totalReview4 += 1;
                totalReview4 = totalReview4/reviews.size();
            } else if (reviews.get(i).getRating() == 3) {
                totalReview3 += 1;
                totalReview3 = totalReview3/reviews.size();
            } else if (reviews.get(i).getRating() == 2) {
                totalReview2 += 1;
                totalReview2 = totalReview2/reviews.size();
            } else if (reviews.get(i).getRating() == 1) {
                totalReview1 += 1;
                totalReview1 = totalReview1 / reviews.size();
            }
        }
        request.setAttribute("total", totalReview);
        request.setAttribute("total1", totalReview1);
        request.setAttribute("total2", totalReview2);
        request.setAttribute("total3", totalReview3);
        request.setAttribute("total4", totalReview4);
        request.setAttribute("total5", totalReview5);
        System.out.println(reviews);
        request.getRequestDispatcher("/frontend/product_detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}