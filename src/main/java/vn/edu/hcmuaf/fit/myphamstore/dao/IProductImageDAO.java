package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.ProductImageModel;

public interface IProductImageDAO extends GenericDAO<ProductImageModel> {
    String getProductImage(Long productId);
    ProductImageModel findProductImageById(Long id);
}
