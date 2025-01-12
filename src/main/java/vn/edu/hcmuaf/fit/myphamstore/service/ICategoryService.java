package vn.edu.hcmuaf.fit.myphamstore.service;

import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;

import java.util.List;

public interface ICategoryService {
    CategoryModel findCategoryById(Long id);
    List<CategoryModel> findCategoriesParent(Long childId);
    List<CategoryModel> pagingCategory(String keyword,int currentPage, int pageSize, String orderBy);
    Long getTotalPage(int numOfItem);
}
