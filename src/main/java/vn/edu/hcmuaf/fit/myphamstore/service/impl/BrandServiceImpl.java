package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.inject.Inject;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IBrandService;
import vn.edu.hcmuaf.fit.myphamstore.dao.IBrandDAO;
import java.util.List;

public class BrandServiceImpl implements IBrandService {
    @Inject
    private IBrandDAO brandDAO;
    @Override
    public BrandModel findBrandById(Long id) {
        return brandDAO.findBrandById(id);
    }

    @Override
    public List<BrandModel> pagingBrand(String keyword, int currentPage, int pageSize, String orderBy) {
        return brandDAO.findAll(keyword, currentPage, pageSize, orderBy);
    }

    @Override
    public Long getTotalPage(int numOfItem) {
        return brandDAO.getTotalPage(numOfItem);
    }
}
