package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;
import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IBrandService;
import vn.edu.hcmuaf.fit.myphamstore.service.ICategoryService;
import vn.edu.hcmuaf.fit.myphamstore.service.IProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryController", value = "/danh-muc")
public class CategoryController extends HttpServlet {
    @Inject
    private IProductService productService;
    @Inject
    private IBrandService brandService;
    @Inject
    private ICategoryService categoryService;



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy các tham số từ request
            String keyword = request.getParameter("keyword");
            String orderBy = request.getParameter("orderBy");

            // Xử lý giá trị null cho currentPage và pageSize
            int currentPage = 1;
            int pageSize = 5;

            if (request.getParameter("currentPage") != null) {
                currentPage = Integer.parseInt(request.getParameter("currentPage"));
            }
            if (request.getParameter("pageSize") != null) {
                pageSize = Integer.parseInt(request.getParameter("pageSize"));
            }

            // Lấy danh sách sản phẩm và số trang
            List<ProductModel> products = productService.getProductsWithPaging(keyword, currentPage, pageSize, orderBy);
            Long totalPages = productService.getTotalPage(pageSize);


            // Lấy danh sách thương hiệu
            List<BrandModel> brands = brandService.getAllBrands();
            request.setAttribute("brands", brands);

            // Lấy danh sách danh mục
            List<CategoryModel> categories = categoryService.getAllCategories();
            request.setAttribute("categories", categories);

            // Lấy danh sách sản phẩm thuộc danh mục
//            Long categoryId = Long.parseLong(request.getParameter("id"));
//            List<ProductModel> productsByCategory = productService.getProductsByCategory(categoryId);
//            request.setAttribute("productsByCategory", productsByCategory);

            List<ProductModel>skinCare = productService.getProductsByCategory(1);
            request.setAttribute("skinCare", skinCare);

            List<ProductModel>bodyCare = productService.getProductsByCategory(2);
            request.setAttribute("bodyCare", bodyCare);

            List<ProductModel>makeUp = productService.getProductsByCategory(3);
            request.setAttribute("makeUp", makeUp);


            // Set các attribute để gửi đến JSP
            request.setAttribute("products", products);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("keyword", keyword);
            request.setAttribute("orderBy", orderBy);
            request.setAttribute("categories", categories);
            request.setAttribute("brands", brands);




            System.out.println("Skin Care Products: " + skinCare);
            //request.setAttribute("productsByCategory", productsByCategory);


            // Hiển thị trang chủ
            RequestDispatcher dispatcher = request.getRequestDispatcher("/frontend/category.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}