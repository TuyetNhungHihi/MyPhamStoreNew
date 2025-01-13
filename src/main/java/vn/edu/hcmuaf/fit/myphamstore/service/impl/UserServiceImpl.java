package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.dao.IRoleDAO;
import vn.edu.hcmuaf.fit.myphamstore.dao.IUserDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IUserService;

import java.io.IOException;
import java.util.List;
@ApplicationScoped
public class UserServiceImpl implements IUserService {
    @Inject
    private IUserDAO userDAO;
    @Inject
    private IRoleDAO roleDAO;

    @Override
    public List<UserModel> getUsersWithPaging(String keyword, int currentPage, int pageSize, String orderBy) {
        return userDAO.findAll(keyword, currentPage, pageSize, orderBy);
    }

    @Override
    public boolean checkLogin(String email, String password) {
        return userDAO.checkLogin(email, password);
    }

    @Override
    public UserModel findUserByEmail(String email) {
        if(email == null || email.isBlank()) {
            return null;
        }
        try{
            UserModel user = userDAO.getUserByEmail(email);
            if(user != null) {
                user.setRoles(roleDAO.findListRoleByUserId(user.getId()));
            }
            return user;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean isAuthenticated = this.checkLogin(email, password);
        if (isAuthenticated) {
            UserModel user = this.findUserByEmail(email);
            if (user != null) {
                request.getSession().setAttribute("user", user);
                response.sendRedirect(request.getContextPath() + "/trang-chu");
            } else {
                request.setAttribute("errorMessage", "Sai email hoặc mật khẩu");
                request.getRequestDispatcher("/frontend/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Sai email hoặc mật khẩu");
            request.getRequestDispatcher("/frontend/login.jsp").forward(request, response);
        }
    }
}
