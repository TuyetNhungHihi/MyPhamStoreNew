package vn.edu.hcmuaf.fit.myphamstore.model;

import lombok.*;
import lombok.experimental.SuperBuilder;

@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Setter
@Getter
public class OrderDetail extends BaseModel{
    private Long orderId;
    private Long productId;
    private Integer quantity;
    private Double totalPrice;
}
