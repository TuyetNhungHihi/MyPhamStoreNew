package vn.edu.hcmuaf.fit.myphamstore.service;

import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;

import java.util.List;

public interface IProductService {
    Long getTotalPage(int numOfItems);
    List<ProductModel> getPagingProduct(String keyword,int currentPage, int pageSize, String orderBy);
}
