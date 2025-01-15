package vn.edu.hcmuaf.fit.myphamstore.service;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductImageModel;

import java.util.List;

public interface IProductImageService {
    ProductImageModel findProductImageById(Long id);
    List<ProductImageModel> pagingProductImage(String keyword, int currentPage, int pageSize, String orderBy);
    Long getTotalPage(int numOfItem);
}
