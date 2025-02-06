package vn.edu.hcmuaf.fit.myphamstore.service;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public interface IOrderService {
    void displayOrders(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
    void displayOrderDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
}
