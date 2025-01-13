package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;

public interface IBrandDAO extends GenericDAO<BrandModel> {
    BrandModel findBrandById(Long id);
}
