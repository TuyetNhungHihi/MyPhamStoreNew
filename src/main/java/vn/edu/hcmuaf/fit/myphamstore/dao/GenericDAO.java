package vn.edu.hcmuaf.fit.myphamstore.dao;

public interface GenericDAO <T>{
    T save(T entity);
    T update(T entity);
    void delete(T entity);
    T findById(Long id);
    long count();
}
