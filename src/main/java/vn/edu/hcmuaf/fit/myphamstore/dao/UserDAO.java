package vn.edu.hcmuaf.fit.myphamstore.dao;

import jakarta.persistence.EntityManager;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;

public class UserDAO extends JpaDAO<UserModel> implements GenericDAO<UserModel> {
    public UserDAO(EntityManager entityManager) {
        super(entityManager);
    }

    @Override
    public UserModel save(UserModel entity) {
        return super.create(entity);
    }

    @Override
    public UserModel update(UserModel entity) {
        return null;
    }

    @Override
    public void delete(UserModel entity) {

    }

    @Override
    public UserModel findById( Long id) {
        return super.findById(UserModel.class, id);
    }

    @Override
    public long count() {
        return 0;
    }

    public UserModel findByEmail(String email) {
        return super.fpo
    }
}
