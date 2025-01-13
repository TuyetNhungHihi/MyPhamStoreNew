package vn.edu.hcmuaf.fit.myphamstore.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.SuperBuilder;
import vn.edu.hcmuaf.fit.myphamstore.common.Discount_Type;

import java.time.LocalDateTime;

@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@Getter
public class CouponModel extends BaseModel{
    private Long brand_id;
    private String code;
    private Long min_order_value;
    private Discount_Type discount_type;
    private Long discount_value;
    private Long max_discount_value;
    private LocalDateTime start_date;
    private LocalDateTime end_date;
    private Long current_usage;
    private Long max_usage;
}
