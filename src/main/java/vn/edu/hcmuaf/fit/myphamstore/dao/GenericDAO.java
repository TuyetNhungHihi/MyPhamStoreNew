package vn.edu.hcmuaf.fit.myphamstore.dao;

import java.sql.*;
import java.util.List;

public abstract class GenericDAO <T>{
    //CRUD (Create, Read, Update, Delete)
    abstract public Long save(T entity);
    abstract public T update(T entity);
    abstract public void delete(T entity);
    abstract public T findById(Long id);
    abstract public long count();
    abstract public List<T> findAll();
}
