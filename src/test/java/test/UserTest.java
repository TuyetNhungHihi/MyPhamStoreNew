package test;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.springframework.security.core.userdetails.User;
import vn.edu.hcmuaf.fit.myphamstore.common.Gender;
import vn.edu.hcmuaf.fit.myphamstore.common.UserStatus;
import vn.edu.hcmuaf.fit.myphamstore.dao.UserDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;


import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class UserTest {
    private static UserDAO userDAO;

    @BeforeAll
    static void setUp() {
        userDAO = new UserDAO();
    }

    @Test
    void updateUser() {
        UserModel user = UserModel.builder()
                .id(10L)
                .status(UserStatus.INACTIVE)
                .build();

        assertNotNull(userDAO.update(user));
    }
    @Test
    void saveUser() {
        UserModel user = UserModel.builder()
                .email("123@gmail.com")
                .fullName("123")
                .password("123")
                .phone("123456789")
                .dateOfBirth(LocalDate.of(2004, 12,12))
                .gender(Gender.MALE)
                .avatar(null)
                .build();
        Long id = userDAO.save(user);
        assertNotNull(id);
    }
    @Test
    void checkEmailExist() {
        String email = "123@gmail.com";
        boolean result = userDAO.checkEmailExist(email);
        assertTrue(result);
    }

    @Test
    void listALlUser() {
        List<UserModel> listUser = userDAO.findAll();
        listUser.forEach(System.out::println);
        assertNotNull(listUser);
    }
    @Test
    void pagingUser() {
        List<UserModel> listUser = userDAO.getUsersWithPaging(1,5,"date_of_birth");
        listUser.forEach(System.out::println);
        assertFalse(listUser.isEmpty());
    }

    @Test
    void findUserById() {
        Long id =  1L;
        UserModel user = userDAO.findById(id);
        System.out.println(user);
        assertNotNull(user);
    }
}