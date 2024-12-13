package vn.edu.hcmuaf.fit.myphamstore.model;

import jakarta.persistence.*;
import lombok.*;
import vn.edu.hcmuaf.fit.myphamstore.common.Gender;
import vn.edu.hcmuaf.fit.myphamstore.common.UserStatus;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Entity(name = "tbl_user")
@NamedQueries({
        @NamedQuery(name = "UserModel.findByEmail", query = "SELECT u FROM tbl_user u WHERE u.email = :email")
})
public class UserModel extends BaseModel{
    @Column(name = "full_name", columnDefinition = "NVARCHAR(255) NOT NULL")
    private String fullName;

    @Column(name = "email",unique = true, columnDefinition = "VARCHAR(255) NOT NULL")
    private String email;

    @Column(name = "password", columnDefinition = "VARCHAR(255) NOT NULL")
    private String password;

    @Column(name = "phone",unique = true, columnDefinition = "VARCHAR(15) NOT NULL")
    private String phone;

    @Column(name = "date_of_birth", nullable = false)
    @Temporal(TemporalType.DATE)
    private LocalDate dateOfBirth;

    @Column(name = "gender")
    @Enumerated(EnumType.STRING)
    private Gender gender;

    @Column(name = "avatar", columnDefinition = "VARCHAR(500) NOT NULL")
    private String avatar;

    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private UserStatus status;

    @Column(name = "last_login")
    private LocalDateTime lastLogin;
}
