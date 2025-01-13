package vn.edu.hcmuaf.fit.myphamstore.service;


import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;

import java.util.List;

public interface IBrandService {
    BrandModel findBrandById(Long id);
    List<BrandModel> pagingBrand(String keyword,int currentPage, int pageSize, String orderBy);
    Long getTotalPage(int numOfItem);

}
