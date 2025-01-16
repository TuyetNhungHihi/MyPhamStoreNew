package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IBrandService;
import vn.edu.hcmuaf.fit.myphamstore.dao.IBrandDAO;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

public class BrandServiceImpl implements IBrandService {
    @Inject
    private IBrandDAO brandDAO;
    @Override
    public BrandModel findBrandById(Long id) {
        return brandDAO.findBrandById(id);
    }

    @Override
    public List<BrandModel> getBrandsWithPaging(String keyword, int currentPage, int pageSize, String orderBy) {
        if (keyword != null && !keyword.isEmpty()) {
            keyword = keyword.trim();
        }
        return brandDAO
                .findAll(keyword, currentPage, pageSize, orderBy)
                ;
    }

    @Override
    public Long getTotalPage(int numOfItem) {
        return brandDAO.getTotalPage(numOfItem);
    }

    @Override
    public List<BrandModel> getAllBrands() {
        return brandDAO.getAllBrands();
    }

    @Override
    public void displayBrand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/brand/brand-management.jsp");
        String keyword = request.getParameter("keyword");
        String orderBy = request.getParameter("orderBy");
        int currentPage = Integer.parseInt(request.getParameter("currentPage")==null?"1": request.getParameter("currentPage"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize") == null?"5": request.getParameter("pageSize"));

        List<BrandModel> brands = this.getBrandsWithPaging(keyword, currentPage, pageSize, orderBy);
        Long totalPages = this.brandDAO.getTotalPage(pageSize);

        request.setAttribute("brands", brands);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("keyword", keyword);
        request.setAttribute("orderBy", orderBy);
        dispatcher.forward(request, response);
    }

    @Override
    public void stopBuying(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        //tến hành cập nhật trạng thái sản phẩm
        BrandModel brandModel = BrandModel.builder().id(id).build();
        brandModel.setIsAvailable(false);
        BrandModel isSuccess = brandDAO.update(brandModel);
        if (isSuccess == null) {
            request.setAttribute("message", "Có lỗi xảy ra");
        } else {
            request.setAttribute("message", "Cập nhật thành công id: " + id);
            this.displayBrand(request, response);
        }
    }

    @Override
    public void startBuying(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        //tến hành cập nhật trạng thái sản phẩm
        BrandModel brandModel = BrandModel.builder().id(id).build();
        brandModel.setIsAvailable(true);
        BrandModel isSuccess = brandDAO.update(brandModel);
        if (isSuccess == null) {
            request.setAttribute("message", "Có lỗi xảy ra");
        } else {
            request.setAttribute("message", "Cập nhật thành công id: " + id);
            this.displayBrand(request, response);
        }
    }

    @Override
    public void addBrand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/brand/add-brand.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void updateBrand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/brand/add-brand.jsp");
        Long id = Long.parseLong(request.getParameter("id"));
        BrandModel brand = brandDAO.getBrandDetail(id);
        System.out.println(brand);
        request.setAttribute("brand", brand);
        dispatcher.forward(request, response);
    }
}
