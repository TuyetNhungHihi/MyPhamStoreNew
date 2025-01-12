package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;

public interface ICategoryDAO extends GenericDAO<CategoryModel> {
    CategoryModel findCategoryById(Long id);
}
