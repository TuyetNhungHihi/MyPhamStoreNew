package vn.edu.hcmuaf.fit.myphamstore.service;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.model.OrderModel;

import java.io.IOException;
import java.util.List;

public interface IOrderService {
    void displayOrders(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
    void displayOrderDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
    Long getTotalPage(int numOfItems);
    Long getTotalOrder();
    OrderModel findOrderById(Long id);
    List<OrderModel> getOrdersWithPaging(String keyword,int currentPage, int pageSize, String orderBy);
}
