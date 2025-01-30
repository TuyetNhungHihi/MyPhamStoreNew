package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.common.OrderStatus;
import vn.edu.hcmuaf.fit.myphamstore.model.OrderDetailModel;
import vn.edu.hcmuaf.fit.myphamstore.model.OrderModel;

import java.util.List;

public interface IOrderDAO {
    Long saveOrder(OrderModel orderModel);
    void saveOrderDetail(OrderDetailModel orderDetailModel);
    void updateOrder(OrderModel orderModel);
    OrderModel findOrderByUserId(Long userId);
    OrderModel findOrderById(Long orderId);
    List<OrderDetailModel> findOrderDetailByOrderId(Long orderId);
    void updateOrderDetail(OrderDetailModel orderDetailModel);
    void changeStatus(Long orderId, OrderStatus status);
}
