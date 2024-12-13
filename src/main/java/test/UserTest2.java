package test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import vn.edu.hcmuaf.fit.myphamstore.common.Gender;
import vn.edu.hcmuaf.fit.myphamstore.common.UserStatus;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;

import java.time.LocalDate;

public class UserTest {
    public void testCreateUser(String[] args) {
        UserModel user = UserModel.builder()
                .fullName("Nguyen Van A")
                .email("123@gmail.com")
                .password("123")
                .phone("123456789")
                .gender(Gender.MALE)
                .status(UserStatus.NONE)
                .dateOfBirth(LocalDate.of(2004, 6, 15))
                .build();

        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("MyPhamStore");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        entityManager.getTransaction().begin();
        entityManager.persist(user);
        entityManager.getTransaction().commit();

        entityManager.close();
        entityManagerFactory.close();

        System.out.println("User created successfully!");
    }
}
