package vn.edu.hcmuaf.fit.myphamstore.model;

import lombok.*;
import lombok.experimental.SuperBuilder;
import vn.edu.hcmuaf.fit.myphamstore.common.OrderStatus;
import vn.edu.hcmuaf.fit.myphamstore.common.PaymentMethod;

import java.time.LocalDateTime;

@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Setter
@Getter
public class OrderModel extends BaseModel{
    private Long addressId;
    private Long userId;
    private OrderStatus status;
    private Integer shippingFee;
    private String note;
    private PaymentMethod paymentMethod;
    private Double totalPrice;
    private LocalDateTime orderDate;
    private LocalDateTime confirmedAt;
}
