package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.ProductImageModel;

import java.util.List;

public interface IProductImageDAO extends GenericDAO<ProductImageModel> {
    List<ProductImageModel> getProductImageById(Long productId);
    ProductImageModel findProductImageById(Long id);
}
