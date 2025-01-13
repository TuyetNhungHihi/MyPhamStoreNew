package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;

import java.util.List;

public interface IBrandDAO extends GenericDAO<BrandModel> {
    BrandModel findBrandById(Long id);
    List<BrandModel> getAllBrands();
}
