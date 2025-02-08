package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import vn.edu.hcmuaf.fit.myphamstore.common.JDBIConnector;
import vn.edu.hcmuaf.fit.myphamstore.dao.IProductImageDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductImageModel;

import java.util.Arrays;
import java.util.List;

import static java.rmi.server.LogStream.log;

public class ProductImageDAOImpl implements IProductImageDAO {
    @Override
    public List<ProductImageModel> getProductImageById(Long productId) {
        String query = "SELECT * FROM product_image WHERE product_id = :productId";
        try {
            List<ProductImageModel> result = JDBIConnector.getJdbi().withHandle(handle -> handle.createQuery(query)
                    .bind("productId", productId)
                    .mapToBean(ProductImageModel.class)
                    .list());
            return result;
        } catch (Exception e) {
            log("category not found");
            e.printStackTrace();
        return null;
        }
    }

    @Override
    public ProductImageModel findProductImageById(Long id) {
        String query = "SELECT * FROM review WHERE id = :id";
        try {
            ProductImageModel result = JDBIConnector.getJdbi().withHandle(handle -> handle.createQuery(query)
                    .bind("id", id)
                    .mapToBean(ProductImageModel.class)
                    .one());
            return result;
        } catch (Exception e) {
            log("category not found");
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Long save(ProductImageModel entity) {
        String sql = "INSERT INTO product_image (url, product_id) " +
                "VALUES ( :url, :productId)";
        try {
            return JDBIConnector.getJdbi().withHandle(handle -> {
                // Thực hiện câu lệnh INSERT và lấy id tự động sinh
                return handle.createUpdate(sql)
                        .bind("url", entity.getUrl())
                        .bind("productId", entity.getProductId())
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
    public ProductImageModel update(ProductImageModel entity) {
        ProductImageModel productImageExisted = findProductImageById(entity.getId());
        if (productImageExisted == null) {
            log("Contact not found");
            return null;
        }
        String sql = "UPDATE product_image SET product_id = :productId, url=:url WHERE id = :id";
        try {
            int result = JDBIConnector.getJdbi().withHandle(handle -> {
                return handle.createUpdate(sql)
                        .bind("productId", entity.getProductId())
                        .bind("url", entity.getUrl() == null ? productImageExisted.getUrl() : entity.getUrl())
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
    public void delete(ProductImageModel entity) {
        String query = "DELETE FROM product_image WHERE id = :id";
        try{
            JDBIConnector.getJdbi().useHandle(handle -> {
                handle.createUpdate(query)
                        .bind("id", entity.getId())
                        .execute();
            });
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<ProductImageModel> findAll(String keyword, int currentPage, int pageSize, String orderBy) {
        // Sàng lọc dữ liệu đầu vào
        if (currentPage < 1) currentPage = 1;

        // Tránh SQL Injection bằng cách kiểm tra cột hợp lệ
        List<String> allowedColumns = Arrays.asList("id", "product_id","url");
        if (!allowedColumns.contains(orderBy)) {
            orderBy = "id";
        }

        // Xây dựng câu lệnh SQL
        String sql = "SELECT * FROM product_image ";
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += "WHERE CONCAT(id,  product_id, url) LIKE :keyword ";
        }
        sql += "ORDER BY " + orderBy + " " +
                "LIMIT :limit " +
                "OFFSET :offset";
        // Sử dụng JDBI để thực hiện truy vấn
        int finalCurrentPage = currentPage;
        String finalSql = sql;


        List<ProductImageModel> productImageModels = JDBIConnector.getJdbi().withHandle(handle -> {
            // Tạo truy vấn và gán các tham số
            var query = handle.createQuery(finalSql)
                    .bind("limit", pageSize)
                    .bind("offset", (finalCurrentPage - 1) * pageSize);

            if (keyword != null && !keyword.trim().isEmpty()) {
                query.bind("keyword", "%" + keyword + "%");
            }

            // Ánh xạ kết quả truy vấn thành đối tượng UserModel
            return query.mapToBean(ProductImageModel.class).list();
        });
        return productImageModels;
    }

    @Override
    public Long getTotalPage(int numOfItems) {
        String query = "SELECT COUNT(*) FROM product_image";

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
