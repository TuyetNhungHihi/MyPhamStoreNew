package vn.edu.hcmuaf.fit.myphamstore.dao;

import jakarta.persistence.EntityManager;

import java.util.List;

public class JpaDAO <T>{
    protected EntityManager entityManager;
    public JpaDAO(EntityManager entityManager){
        this.entityManager = entityManager;
    }
    public T create(T entity){
        entityManager.getTransaction().begin();
        entityManager.persist(entity);
        entityManager.getTransaction().commit();
        return entity;
    }
    public T update(T entity){
        entityManager.getTransaction().begin();
        entityManager.merge(entity);
        entityManager.flush();
        entityManager.refresh(entity);
        entityManager.getTransaction().commit();
        return entity;
    }
    public void delete(T entity){
        entityManager.getTransaction().begin();
        entityManager.remove(entity);
        entityManager.getTransaction().commit();
    }
    public T findById(Class<T> entityClass, Object id){
        return entityManager.find(entityClass, id);
    }
    public long count(Class<T> entityClass){
        return entityManager.createQuery("SELECT COUNT(*) FROM " + entityClass.getSimpleName(), Long.class).getSingleResult();
    }

    public List<T> findAll(Class<T> entityClass){
        return entityManager.createQuery("FROM " + entityClass.getSimpleName(), entityClass).getResultList();
    }
}
