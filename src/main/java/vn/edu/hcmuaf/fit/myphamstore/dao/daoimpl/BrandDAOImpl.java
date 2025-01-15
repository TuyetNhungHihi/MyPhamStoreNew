package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import vn.edu.hcmuaf.fit.myphamstore.common.JDBIConnector;
import vn.edu.hcmuaf.fit.myphamstore.dao.IBrandDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import static java.rmi.server.LogStream.log;

public class BrandDAOImpl implements IBrandDAO {
    @Override
    public BrandModel findBrandById(Long id) {
        String query = "SELECT * FROM brand WHERE id = :id";
        try {
            BrandModel result = JDBIConnector.getJdbi().withHandle(handle -> handle.createQuery(query)
                    .bind("id", id)
                    .mapToBean(BrandModel.class)
                    .one());
            return result;
        } catch (Exception e) {
            log("category not found");
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public BrandModel getBrandDetail(Long id) {
        String sql = "select * from brand where id=?";
        try{
            return JDBIConnector.getJdbi().withHandle(h-> h.select(sql, id).mapToBean(BrandModel.class).one());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<BrandModel> getAllBrands() {
        String sql = "SELECT * FROM brand";
        try {
            return JDBIConnector.getJdbi().withHandle(handle ->
                    handle.createQuery(sql).mapToBean(BrandModel.class).list()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Long save(BrandModel entity) {
        String sql = "INSERT INTO brand (  name, logo,is_available, created_at, updated_at) " +
                "VALUES ( :name, :logo, :createdAt, :updatedAt)";
        try {
            return JDBIConnector.getJdbi().withHandle(handle -> {
                // Thực hiện câu lệnh INSERT và lấy id tự động sinh
                return handle.createUpdate(sql)
                        .bind("name", entity.getName().trim())
                        .bind("logo", entity.getLogo().trim())
                        .bind("is_available", entity.getIsAvailable())
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
    public BrandModel update(BrandModel entity) {
        BrandModel brandExisted = findBrandById(entity.getId());
        if (brandExisted == null) {
            log("Contact not found");
            return null;
        }
        String sql = "UPDATE brand SET name = :name, logo = :logo,is_available = :isAvailable , updated_at = :updatedAt WHERE id = :id";
        try {
            int result = JDBIConnector.getJdbi().withHandle(handle -> {
                return handle.createUpdate(sql)
                        .bind("name", entity.getName() == null ? brandExisted.getName() : entity.getName().trim())
                        .bind("logo", entity.getLogo() == null ? brandExisted.getLogo() : entity.getLogo())
                        .bind("isAvailable", entity.getIsAvailable() == null ? brandExisted.getIsAvailable() : entity.getIsAvailable())
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
    public void delete(BrandModel entity) {

    }

    @Override
    public List<BrandModel> findAll(String keyword, int currentPage, int pageSize, String orderBy) {
        // Sàng lọc dữ liệu đầu vào
        if (currentPage < 1) currentPage = 1;

        // Tránh SQL Injection bằng cách kiểm tra cột hợp lệ
        List<String> allowedColumns = Arrays.asList("id", "name", "logo","is_available","created_at", "updated_at");
        if (!allowedColumns.contains(orderBy)) {
            orderBy = "id";
        }

        // Xây dựng câu lệnh SQL
        String sql = "SELECT * FROM brand ";
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += "WHERE CONCAT(id, name, logo,is_available, created_at, updated_at) LIKE :keyword ";
        }
        sql += "ORDER BY " + orderBy + " " +
                "LIMIT :limit " +
                "OFFSET :offset";
        // Sử dụng JDBI để thực hiện truy vấn
        int finalCurrentPage = currentPage;
        String finalSql = sql;


        List<BrandModel> brandModels = JDBIConnector.getJdbi().withHandle(handle -> {
            // Tạo truy vấn và gán các tham số
            var query = handle.createQuery(finalSql)
                    .bind("limit", pageSize)
                    .bind("offset", (finalCurrentPage - 1) * pageSize);

            if (keyword != null && !keyword.trim().isEmpty()) {
                query.bind("keyword", "%" + keyword + "%");
            }

            // Ánh xạ kết quả truy vấn thành đối tượng UserModel
            return query.mapToBean(BrandModel.class).list();
        });
        return brandModels;
    }

    @Override
    public Long getTotalPage(int numOfItems) {
        String query = "SELECT COUNT(*) FROM brand";

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
