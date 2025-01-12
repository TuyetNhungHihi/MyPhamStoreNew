package vn.edu.hcmuaf.fit.myphamstore.model;

import lombok.*;
import lombok.experimental.SuperBuilder;
import vn.edu.hcmuaf.fit.myphamstore.common.ContactStatus;

@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@Setter
@Getter
public class SlideModel {
    private Long id;
    private String image;
    private String url;

}
