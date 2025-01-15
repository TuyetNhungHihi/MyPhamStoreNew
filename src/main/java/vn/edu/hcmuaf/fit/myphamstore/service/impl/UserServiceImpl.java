package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.common.UserStatus;
import vn.edu.hcmuaf.fit.myphamstore.dao.IRoleDAO;
import vn.edu.hcmuaf.fit.myphamstore.dao.IUserDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
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

    @Override
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }

    @Override
    public void changePassword(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }

    @Override
    public void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }

    @Override
    public void displayListUsers(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/customer/customer-management.jsp");
        String keyword = request.getParameter("keyword");
        String orderBy = request.getParameter("orderBy");
        int currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize") == null ? "5" : request.getParameter("pageSize"));

        List<UserModel> users = this.getUsersWithPaging(keyword, currentPage, pageSize, orderBy);
        Long totalPages = this.userDAO.getTotalPage(pageSize);
        // Gửi danh sách sản phẩm đến trang JSP
        request.setAttribute("users", users);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        System.out.println("currentPage: " + currentPage);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("keyword", keyword);
        request.setAttribute("orderBy", orderBy);
        dispatcher.forward(request, response);
    }

    @Override
    public void lockUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        UserModel user = UserModel.builder().id(id).build();
        user.setStatus(UserStatus.INACTIVE);
        UserModel isSuccess = userDAO.update(user);

        if (isSuccess != null) {
            request.setAttribute("mesage","Cập nhật thành công id: "+id);
        }else {
            request.setAttribute("message", "Cập nhật thất bại");
        }

        this.displayListUsers(request,response);
    }

    @Override
    public void unlockUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        UserModel user = UserModel.builder().id(id).build();
        user.setStatus(UserStatus.ACTIVE);
        UserModel isSuccess = userDAO.update(user);

        if (isSuccess != null) {
            request.setAttribute("mesage","Cập nhật thành công id: "+id);
        }else {
            request.setAttribute("message", "Cập nhật thất bại");
        }

        this.displayListUsers(request,response);
    }


}
