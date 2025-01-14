package vn.edu.hcmuaf.fit.myphamstore.model;

import lombok.*;
import lombok.experimental.SuperBuilder;

@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@Setter
@Getter
public class CartModel {
    private long parentId;
    private long orderId;
    private long productId;
    private int quantity;
    private int total_price;

}
