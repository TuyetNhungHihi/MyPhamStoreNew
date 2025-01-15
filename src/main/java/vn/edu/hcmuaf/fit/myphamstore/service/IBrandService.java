package vn.edu.hcmuaf.fit.myphamstore.service;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;

import java.io.IOException;
import java.util.List;

public interface IBrandService {
    BrandModel findBrandById(Long id);
    List<BrandModel> getBrandsWithPaging(String keyword,int currentPage, int pageSize, String orderBy);
    Long getTotalPage(int numOfItem);
    List<BrandModel> getAllBrands();

    void displayBrand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    void stopBuying(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    void startBuying(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    void addBrand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    void updateBrand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
