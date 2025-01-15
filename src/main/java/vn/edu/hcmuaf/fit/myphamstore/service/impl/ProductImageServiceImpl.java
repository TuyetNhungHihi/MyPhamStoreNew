package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.inject.Inject;
import vn.edu.hcmuaf.fit.myphamstore.dao.IProductImageDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductImageModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IProductImageService;

import java.util.List;

public class ProductImageServiceImpl implements IProductImageService {
    @Inject
    private IProductImageDAO productImageDAO;

    @Override
    public ProductImageModel findProductImageById(Long id) {
        return productImageDAO.findProductImageById(id);
    }

    @Override
    public List<ProductImageModel> pagingProductImage(String keyword, int currentPage, int pageSize, String orderBy) {
        return productImageDAO.findAll(keyword, currentPage, pageSize, orderBy);
    }

    @Override
    public Long getTotalPage(int numOfItem) {
        return productImageDAO.getTotalPage(numOfItem);
    }


}
