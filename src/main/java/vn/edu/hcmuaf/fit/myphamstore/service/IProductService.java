package vn.edu.hcmuaf.fit.myphamstore.service;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;

import java.io.IOException;
import java.util.List;

public interface IProductService {
    Long getTotalPage(int numOfItems);
    List<ProductModel> getPagingProduct(String keyword,int currentPage, int pageSize, String orderBy);
    void stopBuying( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void startBuying( HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void displayProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    List<ProductModel> getProductsByCategory(long l);
    List<ProductModel> getLatestProducts();


}
