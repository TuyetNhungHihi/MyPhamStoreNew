package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;

public interface IProductDAO extends GenericDAO<ProductModel> {
    ProductModel getProductDetail(Long id);
}
