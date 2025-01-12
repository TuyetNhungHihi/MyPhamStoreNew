package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import vn.edu.hcmuaf.fit.myphamstore.dao.IBrandDao;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;

import java.util.List;

public class BrandDAO implements IBrandDao {
    @Override
    public BrandModel findBrandById(Long id) {
        return null;
    }
    
    @Override
    public Long save(BrandModel entity) {
        return 0L;
    }

    @Override
    public BrandModel update(BrandModel entity) {
        return null;
    }

    @Override
    public void delete(BrandModel entity) {

    }

    @Override
    public List<BrandModel> findAll(String keyword, int currentPage, int pageSize, String orderBy) {
        return List.of();
    }

    @Override
    public Long getTotalPage(int numOfItems) {
        return 0L;
    }
}
