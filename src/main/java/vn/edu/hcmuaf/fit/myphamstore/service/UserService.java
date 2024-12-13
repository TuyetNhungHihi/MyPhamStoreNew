package vn.edu.hcmuaf.fit.myphamstore.service;

import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;

import java.util.List;

public interface UserService {
    void save(UserModel entity);
    void update(int id);
    void delete(int id);
    UserModel findById(int id);
    long count();
    List<UserModel> findAll();
}
