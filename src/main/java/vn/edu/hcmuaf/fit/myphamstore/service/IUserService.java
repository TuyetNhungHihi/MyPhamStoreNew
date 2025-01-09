package vn.edu.hcmuaf.fit.myphamstore.service;

import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;

import java.util.List;


public interface IUserService {
    List<UserModel> getUsersWithPaging(String keyword,int currentPage, int pageSize, String orderBy);
}
