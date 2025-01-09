package test;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.myphamstore.common.Gender;
import vn.edu.hcmuaf.fit.myphamstore.common.UserStatus;
import vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl.UserDAOImp;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;
import vn.edu.hcmuaf.fit.myphamstore.service.impl.UserServiceImpl;


import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class UserTest {
    private static UserDAOImp userDAOImp;
    private static UserServiceImpl userService;

    @BeforeAll
    static void setUp() {
        userDAOImp = new UserDAOImp();
        userService = new UserServiceImpl(userDAOImp);
    }

    @Test
    void updateUser() {
        UserModel user = UserModel.builder()
                .id(21L)
                .status(UserStatus.ACTIVE)
                .build();

        assertNotNull(userDAOImp.update(user));
    }
    @Test
    void saveUser() {
        UserModel user = UserModel.builder()
                .email("123@gmail.com")
                .fullName("123")
                .password("123")
                .phone("1234563789")
                .dateOfBirth(LocalDate.of(2004, 12,12))
                .gender(Gender.MALE)
                .avatar(null)
                .build();
        Long id = userDAOImp.save(user);
        assertNotNull(id);
    }
    @Test
    void checkEmailExist() {
        String email = "123@gmail.com";
        boolean result = userDAOImp.checkEmailExist(email);
        assertTrue(result);
    }

    @Test
    void pagingUser() {
        List<UserModel> listUser = userService.getUsersWithPaging(null,0,5,"id");
        listUser.forEach(System.out::println);
        assertFalse(listUser.isEmpty());
    }

    @Test
    void findUserById() {
        Long id =  1L;
        UserModel user = userDAOImp.getUserById(id);
        System.out.println(user);
        assertNotNull(user);
    }
}