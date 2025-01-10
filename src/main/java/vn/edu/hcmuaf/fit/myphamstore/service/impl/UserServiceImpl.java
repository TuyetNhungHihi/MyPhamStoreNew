package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import vn.edu.hcmuaf.fit.myphamstore.dao.IUserDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IUserService;

import java.util.List;
@ApplicationScoped
public class UserServiceImpl implements IUserService {
    @Inject
    private IUserDAO userDAO;

    @Override
    public List<UserModel> getUsersWithPaging(String keyword, int currentPage, int pageSize, String orderBy) {
        return userDAO.findAll(keyword, currentPage, pageSize, orderBy);
    }
}
