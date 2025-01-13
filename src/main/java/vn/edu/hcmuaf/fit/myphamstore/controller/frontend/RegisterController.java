package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

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
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private final IUserDAO userDAO = new UserDAOImp();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");

        // Validate input data
        if (email == null || fullName == null || phone == null || dateOfBirth == null || gender == null || password == null) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("/frontend/register.jsp").forward(request, response);
            return;
        }

        // Check if email already exists
        if (userDAO.checkEmailExist(email)) {
            request.setAttribute("errorMessage", "Email already exists.");
            request.getRequestDispatcher("/frontend/register.jsp").forward(request, response);
            return;
        }

        // Create a new user model
        UserModel user = new UserModel();
        user.setEmail(email);
        user.setFullName(fullName);
        user.setPhone(phone);
        user.setDateOfBirth(LocalDate.parse(dateOfBirth));
        user.setGender(Gender.valueOf(gender));
        user.setPassword(PasswordUtils.hashPassword(password));

        // Save the user to the database
        Long userId = userDAO.save(user);

        if (userId != null) {
            request.getSession().setAttribute("user", user);
            response.sendRedirect("home.jsp");
        } else {
            request.setAttribute("errorMessage", "Registration failed. Please try again.");
            request.getRequestDispatcher("/frontend/register.jsp").forward(request, response);
        }
    }
}