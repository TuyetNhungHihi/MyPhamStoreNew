package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import vn.edu.hcmuaf.fit.myphamstore.dao.IBrandDAO;
import vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl.BrandDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BrandController", value = "/thuong-hieu")
public class BrandController extends HttpServlet {
    private IBrandDAO brandDAO = new BrandDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<BrandModel> brands = brandDAO.getAllBrands();
        request.setAttribute("brands", brands);
        request.getRequestDispatcher("/frontend/brand.jsp").forward(request, response);
    }
}