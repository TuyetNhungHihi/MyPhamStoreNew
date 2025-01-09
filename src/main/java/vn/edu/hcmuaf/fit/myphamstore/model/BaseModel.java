package vn.edu.hcmuaf.fit.myphamstore.model;

import lombok.*;
import lombok.experimental.SuperBuilder;

import java.io.Serializable;
import java.time.LocalDateTime;
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Setter
@Getter
public class BaseModel implements Serializable {
    protected Long id;
    protected LocalDateTime createdAt;
    protected LocalDateTime updatedAt;
}
