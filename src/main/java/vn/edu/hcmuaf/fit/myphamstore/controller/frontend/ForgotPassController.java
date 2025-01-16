package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/forgot-password")
public class ForgotPassController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/frontend/forgot-password.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String otp = request.getParameter("otp");
        String newPassword = request.getParameter("new-password");

        // Validate input data
        if (email == null || otp == null || newPassword == null || email.isEmpty() || otp.isEmpty() || newPassword.isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("/frontend/forgot-password.jsp").forward(request, response);
            return;
        }

        request.setAttribute("successMessage", "Your password has been reset successfully.");
        request.getRequestDispatcher("/frontend/forgot-password.jsp").forward(request, response);
    }
}