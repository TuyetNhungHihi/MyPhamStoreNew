package vn.edu.hcmuaf.fit.myphamstore.model;

import lombok.*;
import lombok.experimental.SuperBuilder;
import vn.edu.hcmuaf.fit.myphamstore.common.DiscountType;

import java.time.LocalDateTime;

@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@Getter
@Setter
public class CouponModel extends BaseModel{
    private Long brandId;
    private String code;
    private Long minOrderValue;
    private DiscountType discountType;
    private Long discountValue;
    private Long maxDiscountValue;
    private LocalDateTime startDate;
    private LocalDateTime endDate;
    private Long currentUsage;
    private Long maxUsage;
    private Boolean isAvailable;
}
