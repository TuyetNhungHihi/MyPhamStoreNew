package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;

import java.util.List;

public interface IProductDAO extends GenericDAO<ProductModel> {
    ProductModel getProductDetail(Long id);

    List<ProductModel> getAllProducts();
}
