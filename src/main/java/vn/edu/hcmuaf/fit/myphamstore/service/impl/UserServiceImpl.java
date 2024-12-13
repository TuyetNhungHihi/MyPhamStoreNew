package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import vn.edu.hcmuaf.fit.myphamstore.dao.UserDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;
import vn.edu.hcmuaf.fit.myphamstore.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    UserDAO userDAO;
    EntityManagerFactory entityManagerFactory;
    EntityManager entityManager;

    public UserServiceImpl() {
        entityManagerFactory = Persistence.createEntityManagerFactory("MyPhamStore");
        entityManager = entityManagerFactory.createEntityManager();
        userDAO = new UserDAO(entityManager);
    }
    @Override
    public void save(UserModel entity) {
        UserModel existUser = userDAO.findByEmail(entity.getEmail());
    }

    @Override
    public void update(int id) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public UserModel findById(int id) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public List<UserModel> findAll() {
        return null;
    }
    private boolean isExistUser(UserModel user) {
        UserModel existUser = userDAO.findByEmail(user.getEmail());
        if (existUser != null) {
            return true;
        }
        return false;
    }
}
