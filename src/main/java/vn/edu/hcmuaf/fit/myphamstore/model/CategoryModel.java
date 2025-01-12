package vn.edu.hcmuaf.fit.myphamstore.model;

import lombok.*;
import lombok.experimental.SuperBuilder;

@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
@Setter
@Getter
public class CategoryModel extends BaseModel{
    private Long parentId;// -> JDbi parentId -> parent_id
    private String name;
    private String description;
    private Boolean isAvailable; //wrapper class -> Boolean

}
