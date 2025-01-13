package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.dao.IProductDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IProductService;

import java.io.IOException;
import java.util.List;
@ApplicationScoped
public class ProductServiceImpl implements IProductService {
    @Inject
    private IProductDAO productDAO;

    @Override
    public Long getTotalPage(int numOfItems) {
        return productDAO.getTotalPage(numOfItems);
    }

    @Override
    public List<ProductModel> getPagingProduct(String keyword, int currentPage, int pageSize, String orderBy) {
        return productDAO.findAll(keyword, currentPage, pageSize, orderBy);
    }

    @Override
    public void stopBuying( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");



        request.getRequestDispatcher("/admin/product/product-management.jsp").forward(request, response);
    }

    @Override
    public void displayProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher= request.getRequestDispatcher("/admin/product/product-management.jsp");
        String keyword = request.getParameter("keyword");
        String orderBy = request.getParameter("orderBy");
        int currentPage = Integer.parseInt(request.getParameter("currentPage")==null?"1": request.getParameter("currentPage"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize") == null?"5": request.getParameter("pageSize"));

        List<ProductModel> products = this.getPagingProduct(keyword, currentPage, pageSize, orderBy);
        Long totalPages = this.getTotalPage(5);
        // Gửi danh sách sản phẩm đến trang JSP
        request.setAttribute("products", products);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("keyword", keyword);
        request.setAttribute("orderBy", orderBy);
        dispatcher.forward(request, response);
    }


}
