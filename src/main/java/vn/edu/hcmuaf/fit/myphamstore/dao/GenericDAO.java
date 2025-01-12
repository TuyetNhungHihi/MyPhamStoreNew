package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;

import java.util.List;

public interface GenericDAO <T>{
    //CRUD (Create, Read, Update, Delete)
     Long save(T entity);
     T update(T entity);
     void delete(T entity);
     List<T> findAll(String keyword,int currentPage, int pageSize, String orderBy);
    Long getTotalPage(int numOfItems);

    List<CategoryModel> getAllCategories();
}
