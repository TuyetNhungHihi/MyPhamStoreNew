package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import vn.edu.hcmuaf.fit.myphamstore.dao.IProductDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IProductService;

import java.util.List;
@ApplicationScoped
public class ProductServiceImpl implements IProductService {
    @Inject
    private IProductDAO productDAO;

    @Override
    public Long getTotalPage(int numOfItems) {
        return productDAO.getTotalPage(numOfItems);
    }

    @Override
    public List<ProductModel> getPagingProduct(String keyword, int currentPage, int pageSize, String orderBy) {
        return productDAO.findAll(keyword, currentPage, pageSize, orderBy);
    }

    @Override
    public List<ProductModel> getProductsByCategory(long l) {
        return productDAO.getProductsByCategory(l);
    }

    @Override
    public List<ProductModel> getLatestProductsByCategory(long l, int i) {
        return productDAO.getLatestProductsByCategory(l, i);
    }
}
