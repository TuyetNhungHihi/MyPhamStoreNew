package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import jakarta.inject.Inject;
import vn.edu.hcmuaf.fit.myphamstore.dao.IUserDAO;
import vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl.UserDAOImp;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.service.IUserService;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    @Inject
    private  IUserService userService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        userService.login(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
}
