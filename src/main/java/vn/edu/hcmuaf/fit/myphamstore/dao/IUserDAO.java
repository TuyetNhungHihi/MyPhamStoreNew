package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;

public interface IUserDAO extends GenericDAO<UserModel> {
    boolean login(String username, String password);
    boolean checkEmailExist(String email);
    boolean checkPhoneExist(String phone);
    UserModel getUserByEmail(String email);
    UserModel getUserById(Long id);
    Long getTotalPage(int numOfItems);
}
