package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import jakarta.enterprise.context.ApplicationScoped;
import vn.edu.hcmuaf.fit.myphamstore.common.JDBIConnector;
import vn.edu.hcmuaf.fit.myphamstore.common.OrderStatus;
import vn.edu.hcmuaf.fit.myphamstore.common.PaymentMethod;
import vn.edu.hcmuaf.fit.myphamstore.dao.IOrderDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.OrderDetailModel;
import vn.edu.hcmuaf.fit.myphamstore.model.OrderModel;

import java.time.LocalDateTime;
import java.util.List;
@ApplicationScoped
public class OrderDAOImpl implements IOrderDAO {
    @Override
    public Long saveOrder(OrderModel orderModel) {
        String sql = "INSERT INTO orders (address_id, user_id, status, shipping_fee, note, payment_method, total_price, order_date, confirmed_at) " +
                "VALUES(:addressId, :userId, :status, :shippingFee, :note, :paymentMethod, :totalPrice, :orderDate, :confirmedAt)";
        try{
            return JDBIConnector.getJdbi().withHandle(handle -> handle.createUpdate(sql)
                    .bind("addressId", orderModel.getAddressId())
                    .bind("userId", orderModel.getUserId())
                    .bind("status", orderModel.getStatus() == null ? OrderStatus.PENDING.name() : orderModel.getStatus().name())
                    .bind("shippingFee", orderModel.getShippingFee() == null ? 0 : orderModel.getShippingFee())
                    .bind("note", orderModel.getNote() == null ? "" : orderModel.getNote())
                    .bind("paymentMethod", orderModel.getPaymentMethod() == null ? PaymentMethod.COD : orderModel.getPaymentMethod())
                    .bind("totalPrice", orderModel.getTotalPrice() == null ? 0 : orderModel.getTotalPrice())
                    .bind("orderDate", orderModel.getOrderDate() == null ? LocalDateTime.now() : orderModel.getOrderDate())
                    .bind("confirmedAt", orderModel.getConfirmedAt() )
                    .executeAndReturnGeneratedKeys("id")
                    .mapTo(Long.class)
                    .one());
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void saveOrderDetail(OrderDetailModel orderDetailModel) {
        String sql = "INSERT INTO order_details (order_id, product_id, quantity, total_price) " +
                "VALUES(:orderId, :productId, :quantity, :totalPrice)";
        try{
            JDBIConnector.getJdbi().withHandle(handle -> handle.createUpdate(sql)
                    .bind("orderId", orderDetailModel.getOrderId())
                    .bind("productId", orderDetailModel.getProductId())
                    .bind("quantity", orderDetailModel.getQuantity())
                    .bind("totalPrice", orderDetailModel.getTotalPrice())
                    .execute());
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void updateOrder(OrderModel orderModel) {

        String sql = "UPDATE orders SET " +
                "address_id = :addressId, " +
                "user_id = :userId, " +
                "status = :status, " +
                "shipping_fee = :shippingFee, " +
                "note = :note, " +
                "payment_method = :paymentMethod, " +
                "total_price = :totalPrice, " +
                "order_date = :orderDate, " +
                "confirmed_at = :confirmedAt WHERE id = :id";
        try{
            JDBIConnector.getJdbi().withHandle(handle -> handle.createUpdate(sql)
                    .bind("addressId", orderModel.getAddressId())
                    .bind("userId", orderModel.getUserId())
                    .bind("status", orderModel.getStatus() == null ? OrderStatus.PENDING.name() : orderModel.getStatus().name())
                    .bind("shippingFee", orderModel.getShippingFee() == null ? 0 : orderModel.getShippingFee())
                    .bind("note", orderModel.getNote() == null ? "" : orderModel.getNote())
                    .bind("paymentMethod", orderModel.getPaymentMethod() == null ? PaymentMethod.COD : orderModel.getPaymentMethod())
                    .bind("totalPrice", orderModel.getTotalPrice() == null ? 0 : orderModel.getTotalPrice())
                    .bind("orderDate", orderModel.getOrderDate() == null ? LocalDateTime.now() : orderModel.getOrderDate())
                    .bind("confirmedAt", orderModel.getConfirmedAt()  == null ? LocalDateTime.now() : orderModel.getConfirmedAt())
                    .bind("id", orderModel.getId())
                    .execute());
        }   catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public OrderModel findOrderByUserId(Long userId) {
        String sql = "SELECT * FROM orders WHERE user_id = :userId";
        try{
            return JDBIConnector.getJdbi().withHandle(handle -> handle.createQuery(sql)
                    .bind("userId", userId)
                    .mapToBean(OrderModel.class)
                    .findFirst()
                    .orElse(null));
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public OrderModel findOrderById(Long orderId) {
        String sql  = "SELECT * FROM orders WHERE id = :orderId";
        try{
            return JDBIConnector.getJdbi().withHandle(handle -> handle.createQuery(sql)
                    .bind("orderId", orderId)
                    .mapToBean(OrderModel.class)
                    .findFirst()
                    .orElse(null));
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<OrderDetailModel> findOrderDetailByOrderId(Long orderId) {
        String sql = "SELECT * FROM order_details WHERE order_id = :orderId";
        try{
            return JDBIConnector.getJdbi().withHandle(handle -> handle.createQuery(sql)
                    .bind("orderId", orderId)
                    .mapToBean(OrderDetailModel.class)
                    .list());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void updateOrderDetail(OrderDetailModel orderDetailModel) {
        String sql = "UPDATE order_details SET " +
                "order_id = :orderId, " +
                "product_id = :productId, " +
                "quantity = :quantity, " +
                "total_price = :totalPrice WHERE id = :id";
        try{
            JDBIConnector.getJdbi().withHandle(handle -> handle.createUpdate(sql)
                    .bind("orderId", orderDetailModel.getOrderId())
                    .bind("productId", orderDetailModel.getProductId())
                    .bind("quantity", orderDetailModel.getQuantity())
                    .bind("totalPrice", orderDetailModel.getTotalPrice())
                    .bind("id", orderDetailModel.getId())
                    .execute());
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void changeStatus(Long orderId, OrderStatus status) {
        String sql = "UPDATE orders SET status = :status WHERE id = :orderId";
        try{
            JDBIConnector.getJdbi().withHandle(handle -> handle.createUpdate(sql)
                    .bind("status", status.name())
                    .bind("orderId", orderId)
                    .execute());
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
