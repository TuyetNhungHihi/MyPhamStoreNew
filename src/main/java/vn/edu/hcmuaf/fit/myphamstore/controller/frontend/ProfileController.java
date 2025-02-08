package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;
import jakarta.inject.Inject;
import vn.edu.hcmuaf.fit.myphamstore.dao.IBrandDAO;
import vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl.BrandDAOImpl;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.service.IUserService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProfileController", value = "/profile")
public class ProfileController extends HttpServlet {
    @Inject
    private IUserService userService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//       request.getRequestDispatcher("/frontend/profile.jsp").forward(request, response);
        String action = request.getParameter("action");
        if ("edit".equalsIgnoreCase(action)) {
            userService.updateProfile(request, response);
        }else if("addAddress".equalsIgnoreCase(action)){
            userService.addAddress(request, response);
        }
        else {
            userService.profile(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
