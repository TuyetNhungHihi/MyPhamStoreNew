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
public class ContactModel extends BaseModel{
    private String email;
    private String title;
    private String content;
    private ContactStatus status;
}
