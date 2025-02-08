package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import jakarta.inject.Inject;
import vn.edu.hcmuaf.fit.myphamstore.dao.IUserDAO;
import vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl.UserDAOImp;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;
import vn.edu.hcmuaf.fit.myphamstore.common.PasswordUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.myphamstore.service.IUserService;

import java.io.IOException;

@WebServlet("/change-password")
public class ChangePassController extends HttpServlet {
    @Inject
    private IUserService userService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        String oldPassword = request.getParameter("password");
        String newPassword = request.getParameter("new-password");
        String reNewPassword = request.getParameter("re-new-password");

        if (oldPassword == null || newPassword == null || reNewPassword == null ||
                oldPassword.isEmpty() || newPassword.isEmpty() || reNewPassword.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("/frontend/change-password.jsp").forward(request, response);
            return;
        }

        if (!PasswordUtils.verifyPassword(oldPassword, user.getPassword())) {
            request.setAttribute("errorMessage", "Old password is incorrect.");
            request.getRequestDispatcher("/frontend/change-password.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(reNewPassword)) {
            request.setAttribute("errorMessage", "New passwords do not match.");
            request.getRequestDispatcher("/frontend/change-password.jsp").forward(request, response);
            return;
        }

        // Update the password in the database
        user.setPassword(PasswordUtils.hashPassword(newPassword));
        boolean isUpdated = userService.updateUserPassword(user);

        if (isUpdated) {
            request.setAttribute("successMessage", "Your password has been changed successfully.");
        } else {
            request.setAttribute("errorMessage", "Password change failed. Please try again.");
        }
        request.getRequestDispatcher("/frontend/change-password.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("user") == null) {
            resp.sendRedirect("/login");
            return;
        }
        req.getRequestDispatcher("/frontend/change-password.jsp").forward(req, resp);
    }
}