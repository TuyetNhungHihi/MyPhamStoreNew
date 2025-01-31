package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;
import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IBrandService;
import vn.edu.hcmuaf.fit.myphamstore.service.ICategoryService;
import vn.edu.hcmuaf.fit.myphamstore.service.IProductService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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
            String keyword = request.getParameter("keyword");
            String orderBy = request.getParameter("orderBy");
//            String[] selectedCategories = request.getParameterValues("selectedCategories");
//            String[] selectedBrands = request.getParameterValues("selectedBrands");
            String priceRange = request.getParameter("priceRange");
            List<String> selectedCategories = request.getParameterValues("selectedCategories") != null
                    ? Arrays.asList(request.getParameterValues("selectedCategories"))
                    : new ArrayList<>();
            List<String> selectedBrands = request.getParameterValues("selectedBrands") != null
                    ? Arrays.asList(request.getParameterValues("selectedBrands"))
                    : new ArrayList<>();
            int currentPage = 1;
            int pageSize = 6;

            if (request.getParameter("currentPage") != null) {
                currentPage = Integer.parseInt(request.getParameter("currentPage"));
            }
            if (request.getParameter("pageSize") != null) {
                pageSize = Integer.parseInt(request.getParameter("pageSize"));
            }

            List<ProductModel> products = productService.getFilteredProducts(keyword, selectedCategories, selectedBrands, priceRange, currentPage, pageSize, orderBy);
            Long totalPages = productService.getTotalPage(pageSize);

            List<BrandModel> brands = brandService.getAllBrands();
            request.setAttribute("brands", brands);

            List<CategoryModel> categories = categoryService.getAllCategories();
            request.setAttribute("categories", categories);
            
            request.setAttribute("products", products);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("keyword", keyword);
            request.setAttribute("orderBy", orderBy);
            request.setAttribute("selectedCategories", selectedCategories);
            request.setAttribute("selectedBrands", selectedBrands);
            request.setAttribute("priceRange", priceRange);

            if (products.isEmpty()) {
                request.setAttribute("noProductsFound", true);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("/frontend/category.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
