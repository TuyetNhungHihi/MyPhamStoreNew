package vn.edu.hcmuaf.fit.myphamstore.controller.admin;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;
import vn.edu.hcmuaf.fit.myphamstore.service.impl.UserServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "User-Management", value = "/admin-users")
public class UserController extends HttpServlet {
    @Inject
    private UserServiceImpl userService;
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<UserModel> users = userService.getUsersWithPaging(null, 0, 5, "id");
            users.forEach(System.out::println);
            response.getWriter().write(users.toString());
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
