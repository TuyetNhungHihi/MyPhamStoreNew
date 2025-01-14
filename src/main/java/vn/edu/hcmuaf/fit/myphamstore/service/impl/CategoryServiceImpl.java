package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import lombok.extern.slf4j.Slf4j;
import vn.edu.hcmuaf.fit.myphamstore.dao.ICategoryDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;
import vn.edu.hcmuaf.fit.myphamstore.service.ICategoryService;

import java.util.ArrayList;
import java.util.List;

import static java.rmi.server.LogStream.log;

@Slf4j
@ApplicationScoped
public class CategoryServiceImpl implements ICategoryService {
    @Inject
    private ICategoryDAO categoryDAO;

    @Override
    public CategoryModel findCategoryById(Long id) {
        return categoryDAO.findCategoryById(id);
    }

    @Override
    public List<CategoryModel> findCategoriesParent(Long childId) {
        CategoryModel childCategory = categoryDAO.findCategoryById(childId);
        if (childCategory.getParentId() == null) {
            log("Category is parent");
            return null;
        }
        List<CategoryModel> result = new ArrayList<>();
        result.add(childCategory);//them category con vao list
        Long parentId = childCategory.getParentId();
        while (parentId != null) {
            CategoryModel parentCategory = categoryDAO.findCategoryById(parentId);
            if (parentCategory != null) {
                result.add(parentCategory);
                parentId = parentCategory.getParentId();
            } else {
                break;
            }
        }
        return result;
    }

    @Override
    public List<CategoryModel> pagingCategory(String keyword, int currentPage, int pageSize, String orderBy) {
        return categoryDAO.findAll(keyword, currentPage, pageSize, orderBy);
    }

    @Override
    public Long getTotalPage(int numOfItem) {
        return categoryDAO.getTotalPage(numOfItem);
    }

    @Override
    public List<CategoryModel> getAllCategories() {
        return categoryDAO.getAllCategories();
    }
}
