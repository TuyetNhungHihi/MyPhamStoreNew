package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import jakarta.enterprise.context.ApplicationScoped;
import lombok.extern.slf4j.Slf4j;
import vn.edu.hcmuaf.fit.myphamstore.common.ContactStatus;
import vn.edu.hcmuaf.fit.myphamstore.common.JDBIConnector;
import vn.edu.hcmuaf.fit.myphamstore.dao.IContactDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;
import vn.edu.hcmuaf.fit.myphamstore.model.ContactModel;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import static java.rmi.server.LogStream.log;

@Slf4j
@ApplicationScoped
public class ContactDAOImpl implements IContactDAO {
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

    @Override
    public Long save(ContactModel entity) {
        String sql = "INSERT INTO contact (  email, title,content,status, created_at, updated_at) " +
                "VALUES ( :email, :title,:content,:status, :createdAt, :updatedAt)";
        try {
            return JDBIConnector.getJdbi().withHandle(handle -> {
                // Thực hiện câu lệnh INSERT và lấy id tự động sinh
                return handle.createUpdate(sql)
                        .bind("email", entity.getEmail())
                        .bind("title", entity.getTitle())
                        .bind("content", entity.getContent())
                        .bind("status", ContactStatus.PENDING)
                        .bind("createdAt", LocalDateTime.now())
                        .bind("updatedAt", LocalDateTime.now())
                        .executeAndReturnGeneratedKeys("id") // Lấy giá trị khóa chính tự động sinh
                        .mapTo(Long.class) // Ánh xạ giá trị trả về thành Long
                        .one();
            });
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public ContactModel update(ContactModel entity) {
        ContactModel contactExisted = findContactById(entity.getId());
        if (contactExisted == null) {
            log("Contact not found");
            return null;
        }
        String sql = "UPDATE contact SET email=:email, title=:title ,content=:content,status=:status , updated_at = :updatedAt WHERE id = :id";
        try {
            int result = JDBIConnector.getJdbi().withHandle(handle -> {
                return handle.createUpdate(sql)
                        .bind("email", entity.getEmail() == null ? contactExisted.getEmail() : entity.getEmail())
                        .bind("title", entity.getTitle() == null ? contactExisted.getTitle() : entity.getTitle())
                        .bind("content", entity.getContent() == null ? contactExisted.getContent() : entity.getContent())
                        .bind("status", entity.getStatus() == null ? contactExisted.getStatus() : entity.getStatus())
                        .bind("updatedAt", LocalDateTime.now())
                        .bind("id", entity.getId())
                        .execute();
            });

            if(result > 0){
                return entity;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void delete(ContactModel entity) {

    }

    @Override
    public List<ContactModel> findAll(String keyword, int currentPage, int pageSize, String orderBy) {
        // Sàng lọc dữ liệu đầu vào
        if (currentPage < 1) currentPage = 1;

        // Tránh SQL Injection bằng cách kiểm tra cột hợp lệ
        List<String> allowedColumns = Arrays.asList("id", "email", "title","content","status","created_at", "updated_at");
        if (!allowedColumns.contains(orderBy)) {
            orderBy = "id";
        }

        // Xây dựng câu lệnh SQL
        String sql = "SELECT * FROM brand ";
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += "WHERE CONCAT(id, email, title,content,status, created_at, updated_at) LIKE :keyword ";
        }
        sql += "ORDER BY " + orderBy + " " +
                "LIMIT :limit " +
                "OFFSET :offset";
        // Sử dụng JDBI để thực hiện truy vấn
        int finalCurrentPage = currentPage;
        String finalSql = sql;


        List<ContactModel> contactModels = JDBIConnector.getJdbi().withHandle(handle -> {
            // Tạo truy vấn và gán các tham số
            var query = handle.createQuery(finalSql)
                    .bind("limit", pageSize)
                    .bind("offset", (finalCurrentPage - 1) * pageSize);

            if (keyword != null && !keyword.trim().isEmpty()) {
                query.bind("keyword", "%" + keyword + "%");
            }

            // Ánh xạ kết quả truy vấn thành đối tượng UserModel
            return query.mapToBean(ContactModel.class).list();
        });
        return contactModels;
    }

    @Override
    public Long getTotalPage(int numOfItems) {
        String query = "SELECT COUNT(*) FROM contact";

        try {
            // Dùng withHandle để thực hiện câu lệnh SQL
            Long totalUser = JDBIConnector.getJdbi().withHandle(handle -> {
                return handle.createQuery(query)
                        .mapTo(Long.class)  // Ánh xạ kết quả thành kiểu Long
                        .one();  // Chỉ lấy một kết quả duy nhất
            });

            // Tính toán số trang
            if (totalUser != null) {
                long countPage = totalUser / numOfItems;
                if (totalUser % numOfItems != 0) {
                    countPage++;
                }
                return countPage;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
