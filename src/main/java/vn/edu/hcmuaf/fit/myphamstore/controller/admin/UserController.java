package vn.edu.hcmuaf.fit.myphamstore.controller.admin;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.common.action.AdminAction;
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
       String action = request.getParameter("action");
        System.out.println(request.getParameter("totalPages"));
       if (action == null || action.isEmpty() || AdminAction.DISPLAY.equals(action) ||action.equalsIgnoreCase(AdminAction.SEARCH)) {
           userService.displayListUsers(request, response);
       } else if (action.equalsIgnoreCase(AdminAction.LOCK_USER)) {
           userService.lockUser(request, response);
       } else if (action.equalsIgnoreCase(AdminAction.UNLOCK_USER)) {
           userService.unlockUser(request, response);
       } else if(action.equalsIgnoreCase(AdminAction.DISPLAY_DETAIL)){
           userService.detailUser(request, response);
       }
    }
}
