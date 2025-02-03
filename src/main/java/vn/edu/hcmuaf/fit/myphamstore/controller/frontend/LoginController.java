package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.myphamstore.service.impl.UserServiceImpl;

import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    private UserServiceImpl userService;
    private static final Logger logger = Logger.getLogger(LoginController.class.getName());

    @Override
    public void init() throws ServletException {
        super.init();
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/frontend/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        logger.info("Email: " + email);
        logger.info("Password: " + password);

        Long userId = userService.authenticate(email, password);
        if (userId != null) {
            logger.info("Authentication successful, userId: " + userId);
            HttpSession session = request.getSession();
            session.setAttribute("userId", userId);
            response.sendRedirect(request.getContextPath() + "/trang-chu");
        } else {
            logger.warning("Authentication failed for email: " + email);
            response.sendRedirect(request.getContextPath() + "/frontend/login.jsp");
        }
    }
}