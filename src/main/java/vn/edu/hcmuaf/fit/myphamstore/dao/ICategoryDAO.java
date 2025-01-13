package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;

import java.util.List;

public interface ICategoryDAO extends GenericDAO<CategoryModel> {
    List<CategoryModel> getAllCategories();

    List<CategoryModel>getNameCategories();

    CategoryModel findCategoryById(Long id);

}
