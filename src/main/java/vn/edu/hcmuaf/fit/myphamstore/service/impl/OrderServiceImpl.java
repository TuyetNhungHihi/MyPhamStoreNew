package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.dao.IOrderDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.OrderDetailModel;
import vn.edu.hcmuaf.fit.myphamstore.model.OrderModel;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IOrderService;
import vn.edu.hcmuaf.fit.myphamstore.service.IUserService;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@ApplicationScoped
public class OrderServiceImpl implements IOrderService {
    @Inject
    private IOrderDAO orderDAO;
    @Inject
    private IUserService userService;

    @Override
    public void displayOrders(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin/order/order-management.jsp");
        String keyword = request.getParameter("keyword");
        String orderBy = request.getParameter("orderBy");
        int currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize") == null ? "10" : request.getParameter("pageSize"));

        List<OrderModel> orders = getOrdersWithPaging(keyword, currentPage, pageSize, orderBy);
        Map<OrderModel, UserModel> orderUserMap = new HashMap<>();
        for (OrderModel order : orders) {
            UserModel user = userService.findUserById(order.getUserId());
            orderUserMap.put(order, user);
        }

        Long totalPages = getTotalPage(pageSize);

        // Gửi danh sách order đến trang JSP
        request.setAttribute("orderUserMap", orderUserMap);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalItems", orderDAO.countAllProducts());
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("keyword", keyword);
        request.setAttribute("orderBy", orderBy);
        requestDispatcher.forward(request, resp);
    }

    @Override
    public void displayOrderDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/admin/order/order-detail.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    public Long getTotalPage(int numOfItems) {
        return orderDAO.getTotalPage(numOfItems);
    }

    @Override
    public Long getTotalOrder() {
        return 0L;
    }

    @Override
    public OrderModel findOrderById(Long id) {
        return null;
    }

    @Override
    public List<OrderModel> getOrdersWithPaging(String keyword, int currentPage, int pageSize, String orderBy) {
        if (keyword != null && !keyword.isEmpty()) {
            keyword = keyword.trim();
        }
        return orderDAO.findAll(keyword, currentPage, pageSize, orderBy);
    }

    @Override
    public List<OrderDetailModel> getOrderDetailsByOrderId(Long orderId) {
        return orderDAO.findOrderDetailByOrderId(orderId);
    }


    @Override
    public List<OrderModel> getOrderHistoryByUserId(Long userId, int currentPage, int pageSize) {
        return orderDAO.findByUserId(userId, currentPage, pageSize);
    }

    public List<OrderModel> getOrdersByUserId(Long userId) {
        return orderDAO.findByUserId(userId, 1, 10);
    }

    public OrderModel getOrderDetails(Long orderId) {
        return orderDAO.findOrderById(orderId);
    }
}
