package vn.edu.hcmuaf.fit.myphamstore.model;

import lombok.*;
import lombok.experimental.SuperBuilder;

@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Setter
@Getter
public class RoleModel extends BaseModel{
    private String name;
    private String description;
}
