package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.service.IOrderService;

import java.io.IOException;
@ApplicationScoped
public class OrderServiceImpl implements IOrderService {
    @Override
    public void displayOrders(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/admin/order/order-management.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    public void displayOrderDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/admin/order/order-detail.jsp");
        requestDispatcher.forward(req, resp);
    }
}
