package vn.edu.hcmuaf.fit.myphamstore.controller.admin;

import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.common.action.AdminAction;
import vn.edu.hcmuaf.fit.myphamstore.service.IOrderService;

import java.io.IOException;

@WebServlet(name = "OrderController", value = "/admin/orders")
public class OrderController extends HttpServlet {
    @Inject
    private IOrderService orderService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null || AdminAction.DISPLAY.equals(action)){
            orderService.displayOrders(req, resp);
        }else if(AdminAction.DISPLAY_DETAIL.equals(action)) {
            System.out.println("Display order detail");
            System.out.println(req.getParameter("id"));
            orderService.displayOrderDetail(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
