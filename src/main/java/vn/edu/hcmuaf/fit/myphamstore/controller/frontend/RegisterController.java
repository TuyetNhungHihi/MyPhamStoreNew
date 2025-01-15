package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import jakarta.inject.Inject;
import vn.edu.hcmuaf.fit.myphamstore.common.Gender;
import vn.edu.hcmuaf.fit.myphamstore.dao.IUserDAO;
import vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl.UserDAOImp;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;
import vn.edu.hcmuaf.fit.myphamstore.common.PasswordUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.service.IUserService;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Inject
    private IUserService userService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/frontend/register.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       userService.register(request, response);
    }
}