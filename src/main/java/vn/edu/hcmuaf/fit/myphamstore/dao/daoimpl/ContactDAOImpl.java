package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import jakarta.enterprise.context.ApplicationScoped;
import lombok.extern.slf4j.Slf4j;
import vn.edu.hcmuaf.fit.myphamstore.common.ContactStatus;
import vn.edu.hcmuaf.fit.myphamstore.common.JDBIConnector;
import vn.edu.hcmuaf.fit.myphamstore.dao.IContactDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.ContactModel;

import java.time.LocalDateTime;

import static java.rmi.server.LogStream.log;

@Slf4j
@ApplicationScoped
public class ContactDAOImpl implements IContactDAO {

    @Override
    public Long saveContact(ContactModel contactModel) {
        String sql = "INSERT INTO contact ( email, title, content,status, created_at, updated_at) " +
        "VALUES (:email, :title, :content, :status, :createdAt, :updatedAt)";
        try {
            return JDBIConnector.getJdbi().withHandle(handle -> {
                // Thực hiện câu lệnh INSERT và lấy id tự động sinh
                return handle.createUpdate(sql)
                        .bind("email", contactModel.getEmail().trim())
                        .bind("title", contactModel.getTitle().trim())
                        .bind("content", contactModel.getContent().trim())
                        .bind("status", contactModel.getStatus() == null ? ContactStatus.PENDING : contactModel.getStatus())
                        .bind("createdAt", LocalDateTime.now())
                        .bind("updatedAt", LocalDateTime.now())
                        .executeAndReturnGeneratedKeys("id") // Lấy giá trị khóa chính tự động sinh
                        .mapTo(Long.class) // Ánh xạ giá trị trả về thành Long
                        .one();
            });
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void updateContact(ContactModel contactModel) {
        ContactModel contactExisted = findContactById(contactModel.getId());
        if (contactExisted == null) {
            log("Contact not found");
            return;
        }
        System.out.println(contactExisted);

        String sql = "UPDATE contact SET email = :email, title = :title, content = :content, status = :status, updated_at = :updatedAt WHERE id = :id";
        try {
            JDBIConnector.getJdbi().useHandle(handle -> {
                handle.createUpdate(sql)
                        .bind("email", contactModel.getEmail() == null ? contactExisted.getEmail() : contactModel.getEmail().trim())
                        .bind("title", contactModel.getTitle() == null ? contactExisted.getTitle() : contactModel.getTitle().trim())
                        .bind("content", contactModel.getContent() == null ? contactExisted.getContent() : contactModel.getContent().trim())
                        .bind("status", contactModel.getStatus() == null ? ContactStatus.PENDING : contactModel.getStatus())
                        .bind("updatedAt", LocalDateTime.now())
                        .bind("id", contactModel.getId())
                        .execute();
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public ContactModel findContactById(Long id) {
    String sql = "SELECT * FROM contact WHERE id = :id";
    try {
        return JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createQuery(sql)
                    .bind("id", id)
                    .mapToBean(ContactModel.class)
                    .one();
        });
    }catch (Exception e) {
        e.printStackTrace();
    }
        return null;
    }
}
