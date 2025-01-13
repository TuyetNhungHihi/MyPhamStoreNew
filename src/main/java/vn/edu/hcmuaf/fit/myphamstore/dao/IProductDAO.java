package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;

import java.util.List;

public interface IProductDAO extends GenericDAO<ProductModel> {
    ProductModel getProductDetail(Long id);
    List<ProductModel> getProductsByCategory(Long categoryId);
    List<ProductModel> getLatestProductsByCategory(Long categoryId, int limit);
    List<ProductModel> getAllProducts();

    List<CategoryModel> getAllCategories();
}
