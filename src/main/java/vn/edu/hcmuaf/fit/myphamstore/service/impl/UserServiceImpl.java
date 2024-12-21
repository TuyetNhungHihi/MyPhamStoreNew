package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import vn.edu.hcmuaf.fit.myphamstore.dao.UserDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;
import vn.edu.hcmuaf.fit.myphamstore.service.UserService;

import javax.inject.Inject;
import java.util.List;


public class UserServiceImpl implements UserService {
    @Inject
    private UserDAO userDAO;

    @Override
    public List<UserModel> listALlUser() {
        return userDAO.findAll();
    }
}
