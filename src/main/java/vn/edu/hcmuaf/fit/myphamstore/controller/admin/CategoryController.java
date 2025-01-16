package vn.edu.hcmuaf.fit.myphamstore.controller.admin;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.myphamstore.common.action.AdminAction;
import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;
import vn.edu.hcmuaf.fit.myphamstore.service.ICategoryService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCategoryController", value = "/admin/categories")
public class CategoryController extends HttpServlet {
    @Inject
    private ICategoryService categoryService;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty() || action.equalsIgnoreCase(AdminAction.DISPLAY) || action.equalsIgnoreCase(AdminAction.SEARCH)) {
            categoryService.displayCategory(request, response);
        } else if (action.equalsIgnoreCase(AdminAction.STOP_BUYING)) {
            categoryService.stopBuying( request, response);
        }else if (action.equalsIgnoreCase(AdminAction.START_BUYING)) {
            categoryService.startBuying(request, response);
        }else if (action.equalsIgnoreCase(AdminAction.ADD)) {
            categoryService.addCategory(request, response);
        } else if (action.equalsIgnoreCase(AdminAction.EDIT)) {
            categoryService.updateCategory(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}