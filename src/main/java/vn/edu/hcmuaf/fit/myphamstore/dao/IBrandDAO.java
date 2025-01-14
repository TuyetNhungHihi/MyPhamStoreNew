package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;

import java.util.List;

public interface IBrandDAO extends GenericDAO<BrandModel> {
    BrandModel findBrandById(Long id);
    BrandModel getBrandDetail(Long id);

    List<BrandModel> getAllBrands();
}
