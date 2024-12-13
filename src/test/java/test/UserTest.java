package test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.myphamstore.common.Gender;
import vn.edu.hcmuaf.fit.myphamstore.common.UserStatus;
import vn.edu.hcmuaf.fit.myphamstore.dao.UserDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;
class UserTest {
  private static EntityManagerFactory entityManagerFactory;
    private static EntityManager entityManager;
    private static UserDAO userDAO;

    @BeforeAll
    static void setUp() {
        entityManagerFactory = Persistence.createEntityManagerFactory("MyPhamStore");
        entityManager = entityManagerFactory.createEntityManager();
        userDAO = new UserDAO(entityManager);
    }
    @AfterAll
    static void destroy() {
        entityManager.close();
        entityManagerFactory.close();
    }
    @Test
    void testCreateUser() {
      UserModel user = UserModel.builder()
              .fullName("Nguyen Van A")
              .email("121133@gmail.comn")
              .password("123")
              .phone("1236789")
              .dateOfBirth(LocalDate.of(2004, 6, 15))
              .gender(Gender.MALE)
              .status(UserStatus.NONE)
              .build();

      UserModel user1 = userDAO.save(user);
      System.out.println(user1);
      assertTrue(user1.getId() > 0);
  }
}