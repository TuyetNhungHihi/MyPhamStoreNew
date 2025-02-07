package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.model.OrderModel;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IOrderService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderHistoryController", value = "/order-history")
public class OrderHistoryController extends HttpServlet {
    @Inject
    private IOrderService orderService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserModel user = (UserModel) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Long userId = user.getId();
        int currentPage = 1;
        int pageSize = 10;

        if (request.getParameter("currentPage") != null) {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
        if (request.getParameter("pageSize") != null) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        }

        List<OrderModel> orderHistory = orderService.getOrderHistoryByUserId(userId, currentPage, pageSize);

        request.setAttribute("orderHistory", orderHistory);
        request.getRequestDispatcher("/frontend/history.jsp").forward(request, response);
    }
}