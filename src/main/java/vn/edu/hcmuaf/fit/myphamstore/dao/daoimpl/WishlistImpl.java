package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import vn.edu.hcmuaf.fit.myphamstore.common.JDBIConnector;
import vn.edu.hcmuaf.fit.myphamstore.dao.IWIshlistDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;
import vn.edu.hcmuaf.fit.myphamstore.model.WishlistModel;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import static java.rmi.server.LogStream.log;

public class WishlistImpl implements IWIshlistDAO {
    @Override
    public WishlistModel findWishlistById(Long id) {
        String query = "SELECT * FROM wishlist WHERE id = :id";
        try {
            WishlistModel result = JDBIConnector.getJdbi().withHandle(handle -> handle.createQuery(query)
                    .bind("id", id)
                    .mapToBean(WishlistModel.class)
                    .one());
            return result;
        } catch (Exception e) {
            log("category not found");
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public WishlistModel getWishlistDetail(Long id) {
        String sql = "select * from wishlist where id=?";
        try{
            return JDBIConnector.getJdbi().withHandle(h-> h.select(sql, id).mapToBean(WishlistModel.class).one());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
    @Override
    public Long save(WishlistModel entity) {
        String sql = "INSERT INTO wishlist (productId, userId, created_at) " +
                "VALUES (:productId, :userId, :created_at)";
        try {
            return JDBIConnector.getJdbi().withHandle(handle -> {
                // Thực hiện câu lệnh INSERT và lấy id tự động sinh
                return handle.createUpdate(sql)
                        .bind("productId", entity.getProductId())
                        .bind("userID", entity.getUserId())
                        .bind("createdAt", LocalDateTime.now())
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
    public WishlistModel update(WishlistModel entity) {
        WishlistModel wishlistExisted = findWishlistById(entity.getId());
        if (wishlistExisted == null) {
            log("Contact not found");
            return null;
        }
        String sql = "UPDATE wishlist SET productId = :productId, userId = :userId WHERE id = :id";
        try {
            int result = JDBIConnector.getJdbi().withHandle(handle -> {
                return handle.createUpdate(sql)
                        .bind("productId", entity.getProductId() == null ? wishlistExisted.getProductId() : entity.getProductId())
                        .bind("userId", entity.getUserId() == null ? wishlistExisted.getUserId() : entity.getUserId())
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
    public void delete(WishlistModel entity) {

    }

    @Override
    public List<WishlistModel> findAll(String keyword, int currentPage, int pageSize, String orderBy) {
        // Sàng lọc dữ liệu đầu vào
        if (currentPage < 1) currentPage = 1;

        // Tránh SQL Injection bằng cách kiểm tra cột hợp lệ
        List<String> allowedColumns = Arrays.asList("id", "productId", "userID", "created_at");
        if (!allowedColumns.contains(orderBy)) {
            orderBy = "id";
        }

        // Xây dựng câu lệnh SQL
        String sql = "SELECT * FROM wishlist ";
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += "WHERE CONCAT(id, productId, userID, created_at) LIKE :keyword ";
        }
        sql += "ORDER BY " + orderBy + " " +
                "LIMIT :limit " +
                "OFFSET :offset";
        // Sử dụng JDBI để thực hiện truy vấn
        int finalCurrentPage = currentPage;
        String finalSql = sql;


        List<WishlistModel> wishlistModels = JDBIConnector.getJdbi().withHandle(handle -> {
            // Tạo truy vấn và gán các tham số
            var query = handle.createQuery(finalSql)
                    .bind("limit", pageSize)
                    .bind("offset", (finalCurrentPage - 1) * pageSize);

            if (keyword != null && !keyword.trim().isEmpty()) {
                query.bind("keyword", "%" + keyword + "%");
            }

            // Ánh xạ kết quả truy vấn thành đối tượng UserModel
            return query.mapToBean(WishlistModel.class).list();
        });
        return wishlistModels;
    }

    @Override
    public Long getTotalPage(int numOfItems) {
        String query = "SELECT COUNT(*) FROM wishlist";

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
