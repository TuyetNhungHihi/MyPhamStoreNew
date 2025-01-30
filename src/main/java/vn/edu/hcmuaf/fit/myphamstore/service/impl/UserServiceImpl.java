package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.common.Gender;
import vn.edu.hcmuaf.fit.myphamstore.common.RoleType;
import vn.edu.hcmuaf.fit.myphamstore.common.SendEmail;
import vn.edu.hcmuaf.fit.myphamstore.common.UserStatus;
import vn.edu.hcmuaf.fit.myphamstore.dao.IOtpDAO;
import vn.edu.hcmuaf.fit.myphamstore.dao.IRoleDAO;
import vn.edu.hcmuaf.fit.myphamstore.dao.IUserDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.model.RoleModel;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IUserService;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@ApplicationScoped
public class UserServiceImpl implements IUserService {
    @Inject
    private IUserDAO userDAO;
    @Inject
    private IRoleDAO roleDAO;
    @Inject
    private IOtpDAO otpDAO;

    @Override
    public List<UserModel> getUsersWithPaging(String keyword, int currentPage, int pageSize, String orderBy) {
        if (keyword != null && !keyword.isEmpty()) {
            keyword = keyword.trim();
        }
        return userDAO
                .findAll(keyword, currentPage, pageSize, orderBy)
                .stream().map(u ->{
                    u.setRoles(roleDAO.findListRoleByUserId(u.getId()));
                    return u;
                }).collect(Collectors.toList());
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
        boolean isAuthenticated = this.checkLogin(email.trim(), password.trim());
        if (isAuthenticated) {
            UserModel user = this.findUserByEmail(email);
            if (user != null) {
                request.getSession().setAttribute("user", user);
                response.sendRedirect(request.getContextPath() + "/trang-chu");
            } else {
                request.setAttribute("message", "Sai email hoặc mật khẩu");
                request.getRequestDispatcher("/frontend/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("message", "Sai email hoặc mật khẩu");
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
        RequestDispatcher dispatcher = null;
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        email = email.trim();
        String password = request.getParameter("password");
        password = password.trim();
        String confirmPassword = request.getParameter("rePassword");
        String phone  = request.getParameter("phone");
        LocalDate dateOfBirth = LocalDate.parse(request.getParameter("dateOfBirth"));
        String gender = request.getParameter("gender");
        //check email tồn tại
        if(userDAO.checkEmailExist(email)) {
            request.setAttribute("message", "Email đã tồn tại trong hệ thống!");
            dispatcher = request.getRequestDispatcher("/frontend/register.jsp");
            dispatcher.forward(request, response);
            return;
        }
        //check phone number tồn tại
        if(userDAO.checkPhoneExist(phone)) {
            request.setAttribute("message", "Số đện thoại đã tồn tại trong hệ thống!");
            dispatcher = request.getRequestDispatcher("/frontend/register.jsp");
            dispatcher.forward(request, response);
            return;
        }
        //check pass
        if(!password.equalsIgnoreCase(confirmPassword)) {
            request.setAttribute("message", "Mật khẩu không trùng khớp!");
            dispatcher = request.getRequestDispatcher("/frontend/register.jsp");
            dispatcher.forward(request, response);
            return;
        }
        //tiến hành đăng kí
        UserModel user = UserModel.builder()
                .fullName(fullName)
                .gender(Gender.valueOf(gender))
                .dateOfBirth(dateOfBirth)
                .email(email)
                .phone(phone)
                .status(UserStatus.INACTIVE)
                .password(password.trim())
                .avatar(null).build();
        Long savedUserId = userDAO.save(user);
        if( savedUserId!= null && savedUserId  > 0){
            roleDAO.setRoleToUser(RoleType.CUSTOMER, savedUserId);
        }
        String otp = otpDAO.generateOtp();
        otpDAO.saveOtp(email, otp);
        SendEmail.sendEmail(email, otp);
        request.setAttribute("message", "Đăng ký thành công, Vui lòng kiểm tra email để kích hoạt tài khoản");
        request.getRequestDispatcher("/frontend/register.jsp").forward(request, response);
    }

    @Override
    public void displayListUsers(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/customer/customer-management.jsp");
        String keyword = request.getParameter("keyword");
        String orderBy = request.getParameter("orderBy");
        int currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize") == null ? "10" : request.getParameter("pageSize"));

        List<UserModel> users = this.getUsersWithPaging(keyword, currentPage, pageSize, orderBy)
                .stream()
                .filter(u -> u.getRoles().stream()
                        .anyMatch(r -> r.getName().equalsIgnoreCase(RoleType.CUSTOMER.toString())))
                .collect(Collectors.toList());
        Long totalPages = this.userDAO.getTotalPage(pageSize);
        // Gửi danh sách sản phẩm đến trang JSP
        request.setAttribute("users", users);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("keyword", keyword);
        request.setAttribute("orderBy", orderBy);
        dispatcher.forward(request, response);
    }

    @Override
    public UserModel findUserById(Long id) {
        if(id == null) {
            return null;
        }
        try{
            UserModel user = userDAO.getUserById(id);
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
    public void detailUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        UserModel userModel = null;
        if(id != null) {
            userModel = this.findUserById(id);
        }
        if(userModel != null) {
            request.setAttribute("user", userModel);
            request.getRequestDispatcher("/admin/customer/user-detail.jsp").forward(request, response);
        }
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

    @Override
    public void verifyOtp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String otp = request.getParameter("otp");
        System.out.println(email);
        System.out.println(otp);
        Boolean verify = otpDAO.verifyOtp(email.trim(), otp.trim());
        if(verify) {
            UserModel user = userDAO.getUserByEmail(email);
            user.setStatus(UserStatus.ACTIVE);
            userDAO.update(user);
            request.setAttribute("message", "Kích hoạt tài khoản thành công");
        }else {
            request.setAttribute("message", "Mã OTP không chính xác");
            request.getRequestDispatcher("/frontend/login.jsp").forward(request, response);
        }
        request.getRequestDispatcher("/frontend/login.jsp").forward(request, response);
    }


}
