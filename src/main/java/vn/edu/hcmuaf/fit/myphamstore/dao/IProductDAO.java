package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;
import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductImageModel;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;

import java.util.List;

public interface IProductDAO extends GenericDAO<ProductModel> {

    ProductModel getProductDetail(Long id);
    List<ProductModel> getProductsByCategory(Long categoryId);
    List<ProductModel> getLatestProductsByCategory(Long categoryId, int limit);
    List<ProductModel> getAllProducts();
    List<ProductModel> findVariantsByProductId(Long productId);
    List<ProductModel> getLatestProducts();
    List<ProductModel> getFilteredProducts(String keyword, String[] categories, String[] brands, String priceRange, int currentPage, int pageSize, String orderBy);
    Long countAllProducts();
   }
