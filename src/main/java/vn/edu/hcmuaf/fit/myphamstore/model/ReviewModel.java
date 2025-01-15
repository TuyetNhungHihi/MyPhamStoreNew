package vn.edu.hcmuaf.fit.myphamstore.model;

import lombok.*;
import lombok.experimental.SuperBuilder;

@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Setter
@Getter
public class ReviewModel {
    private Long userId;
    private Long productId;
    private String comment;
    private Integer rating;
    private Boolean isAvailable;
}
