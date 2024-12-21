package vn.edu.hcmuaf.fit.myphamstore.model;

import lombok.*;
import lombok.experimental.SuperBuilder;
import vn.edu.hcmuaf.fit.myphamstore.common.Gender;
import vn.edu.hcmuaf.fit.myphamstore.common.UserStatus;

import java.time.LocalDate;
import java.time.LocalDateTime;

@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true, exclude = "password")
@Getter
@Setter
public class UserModel extends BaseModel{
    private String fullName;
    private String email;
    private String password;
    private String phone;
    private LocalDate dateOfBirth;
    private Gender gender;
    private String avatar;
    private UserStatus status;
    private LocalDateTime lastLogin;

}
