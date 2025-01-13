package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import vn.edu.hcmuaf.fit.myphamstore.dao.ICategoryDAO;
import vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl.CategoryDAOImpl;
import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/categories")
public class CategoryController extends HttpServlet {
    private ICategoryDAO categoryDAO = new CategoryDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CategoryModel> categories = categoryDAO.getAllCategories();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/frontend/category.jsp").forward(request, response);
    }
}