package vn.edu.hcmuaf.fit.myphamstore.model;

import lombok.*;
import lombok.experimental.SuperBuilder;

import java.time.LocalDateTime;
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Setter
@Getter
public class OtpModel extends BaseModel{
    private String email;
    private String otp;
    private LocalDateTime expiredTime;
}
