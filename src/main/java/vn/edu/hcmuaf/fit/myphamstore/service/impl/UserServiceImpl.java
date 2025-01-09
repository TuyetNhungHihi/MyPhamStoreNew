package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import vn.edu.hcmuaf.fit.myphamstore.dao.IUserDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IUserService;

import java.util.List;
public class UserServiceImpl implements IUserService {
    private IUserDAO userDAO;
    public UserServiceImpl(IUserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public List<UserModel> getUsersWithPaging(String keyword, int currentPage, int pageSize, String orderBy) {
        return userDAO.findAll(keyword, currentPage, pageSize, orderBy);
    }
}
