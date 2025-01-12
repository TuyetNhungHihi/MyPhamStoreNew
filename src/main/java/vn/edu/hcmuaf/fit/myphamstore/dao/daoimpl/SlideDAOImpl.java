package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import vn.edu.hcmuaf.fit.myphamstore.common.JDBIConnector;
import vn.edu.hcmuaf.fit.myphamstore.dao.ISlideDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;
import vn.edu.hcmuaf.fit.myphamstore.model.SlideModel;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import static java.rmi.server.LogStream.log;

public class SlideDAOImpl implements ISlideDAO {

    @Override
    public Long save(SlideModel entity) {
        String sql = "INSERT INTO slide ( image,url, created_at, updated_at) " +
                "VALUES ( :image, :url, :createdAt, :updatedAt)";
        try {
            return JDBIConnector.getJdbi().withHandle(handle -> {
                // Thực hiện câu lệnh INSERT và lấy id tự động sinh
                return handle.createUpdate(sql)
                        .bind("image", entity.getImage().trim())
                        .bind("url", entity.getUrl().trim())
                        .bind("createdAt", LocalDateTime.now())
                        .bind("updatedAt", LocalDateTime.now())
                        .executeAndReturnGeneratedKeys("id") // Lấy giá trị khóa chính tự động sinh
                        .mapTo(Long.class) // Ánh xạ giá trị trả về thành Long
                        .one();
            });
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;}
    }

    @Override
    public SlideModel update(SlideModel entity) {
        SlideModel slideExisted = findSlideById(entity.getId());
        if (slideExisted == null) {
            log("Contact not found");
            return null;
        }
        String sql = "UPDATE slide SET image = :image, url = :url, updated_at = :updatedAt WHERE id = :id";
        try {
            int result = JDBIConnector.getJdbi().withHandle(handle -> {
                return handle.createUpdate(sql)
                        .bind("name", entity.getImage() == null ? slideExisted.getImage() : entity.getImage().trim())
                        .bind("is_available", entity.getUrl() == null ? slideExisted.getUrl() : entity.getUrl())
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
    public void delete(SlideModel entity) {

    }

    @Override
    public List<SlideModel> findAll(String keyword, int currentPage, int pageSize, String orderBy) {
        // Sàng lọc dữ liệu đầu vào
        if (currentPage < 1) currentPage = 1;

        // Tránh SQL Injection bằng cách kiểm tra cột hợp lệ
        List<String> allowedColumns = Arrays.asList("id", "parent_id", "description","created_at", "updated_at");
        if (!allowedColumns.contains(orderBy)) {
            orderBy = "id";
        }

        // Xây dựng câu lệnh SQL
        String sql = "SELECT * FROM slide ";
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += "WHERE CONCAT(id,image,url, created_at, updated_at) LIKE :keyword ";
        }
        sql += "ORDER BY " + orderBy + " " +
                "LIMIT :limit " +
                "OFFSET :offset";
        // Sử dụng JDBI để thực hiện truy vấn
        int finalCurrentPage = currentPage;
        String finalSql = sql;


        List<SlideModel> slideModels = JDBIConnector.getJdbi().withHandle(handle -> {
            // Tạo truy vấn và gán các tham số
            var query = handle.createQuery(finalSql)
                    .bind("limit", pageSize)
                    .bind("offset", (finalCurrentPage - 1) * pageSize);

            if (keyword != null && !keyword.trim().isEmpty()) {
                query.bind("keyword", "%" + keyword + "%");
            }

            // Ánh xạ kết quả truy vấn thành đối tượng UserModel
            return query.mapToBean(SlideModel.class).list();
        });
        return slideModels;
    }

    @Override
    public Long getTotalPage(int numOfItems) {
        String query = "SELECT COUNT(*) FROM slide";

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

    @Override
    public SlideModel findSlideById(Long id) {
        String query = "SELECT * FROM slide WHERE id = :id";
        try {
            SlideModel result = JDBIConnector.getJdbi().withHandle(handle -> handle.createQuery(query)
                    .bind("id", id)
                    .mapToBean(SlideModel.class)
                    .one());
            return result;
        } catch (Exception e) {
            log("slide not found");
            e.printStackTrace();
        }
        return null;
    }
}