package vn.edu.hcmuaf.fit.myphamstore.controller.admin;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;
import vn.edu.hcmuaf.fit.myphamstore.service.ICategoryService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCategoryController", value = "/admin/category")
public class CategoryController extends HttpServlet {
    @Inject
    private ICategoryService categoryService;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/category/category-management.jsp");
        String keyword = request.getParameter("keyword");
        String orderBy = request.getParameter("orderBy");
        int currentPage = Integer.parseInt(request.getParameter("currentPage")==null?"1": request.getParameter("currentPage"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize") == null?"5": request.getParameter("pageSize"));

        List<CategoryModel> categories = categoryService.pagingCategory(keyword, currentPage, pageSize, orderBy);
        Long totalPages = categoryService.getTotalPage(5);

        request.setAttribute("categories", categories);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("keyword", keyword);
        request.setAttribute("orderBy", orderBy);
        System.out.println(categories);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}