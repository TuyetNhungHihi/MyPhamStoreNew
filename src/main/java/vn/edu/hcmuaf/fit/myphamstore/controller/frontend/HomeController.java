package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/trang-chu")
public class HomeController extends HttpServlet {
    @Inject
    private IProductService productService;

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
            List<ProductModel> products = productService.getPagingProduct(keyword, currentPage, pageSize, orderBy);
            Long totalPages = productService.getTotalPage(pageSize);

            // Lấy danh sách sản phẩm thuộc danh mục "Health & Beauty"
            Long categoryId = 4L; // Health & Beauty
            List<ProductModel> healthBeautyProducts = productService.getProductsByCategory(categoryId);

            List<ProductModel> latestProducts = productService.getLatestProducts();
            request.setAttribute("latestProducts", latestProducts);

            // Set các attribute để gửi đến JSP
            request.setAttribute("products", products);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("keyword", keyword);
            request.setAttribute("orderBy", orderBy);
            request.setAttribute("healthBeautyProducts", healthBeautyProducts);
            request.setAttribute("latestProducts", latestProducts);
            // Chuyển hướng đến trang JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("/frontend/home.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi khi xử lý yêu cầu.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
