package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import vn.edu.hcmuaf.fit.myphamstore.common.JDBIConnector;
import vn.edu.hcmuaf.fit.myphamstore.dao.ICouponDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;
import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;
import vn.edu.hcmuaf.fit.myphamstore.model.CouponModel;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import static java.rmi.server.LogStream.log;

public class CouponDAOImpl implements ICouponDAO {

    @Override
    public CouponModel getCouponDetail(Long id) {
        String sql = "select * from coupon where id=?";
        try{
            return JDBIConnector.getJdbi().withHandle(h-> h.select(sql, id).mapToBean(CouponModel.class).one());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public CouponModel findCouponById(Long id) {
        String query = "SELECT * FROM coupon WHERE id = :id";
        try {
            CouponModel result = JDBIConnector.getJdbi().withHandle(handle -> handle.createQuery(query)
                    .bind("id", id)
                    .mapToBean(CouponModel.class)
                    .one());
            return result;
        } catch (Exception e) {
            log("category not found");
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Long save(CouponModel entity) {
        String sql = "INSERT INTO coupon ( brand_id, code, min_order_value, discount_type,discount_value,max_discount_value,start_date,end_date,current_usage,max_usage, created_at, is_available) " +
                "VALUES ( :brand_id, :code, :min_order_value, :discount_type,:discount_value,:max_discount_value,:start_date,:end_date,:current_usage,:max_usage, :created_at,is_available)";
        try {
            return JDBIConnector.getJdbi().withHandle(handle -> {
                // Thực hiện câu lệnh INSERT và lấy id tự động sinh
                return handle.createUpdate(sql)
                        .bind("brand_id", entity.getBrand_id())
                        .bind("code", entity.getCode().trim())
                        .bind("min_order_value", entity.getMin_order_value())
                        .bind("discount_type", entity.getDiscount_type().toString())
                        .bind("discount_value", entity.getDiscount_value())
                        .bind("max_discount_value", entity.getMax_discount_value())
                        .bind("start_date", entity.getStart_date())
                        .bind("end_date", entity.getEnd_date())
                        .bind("current_usage", entity.getCurrent_usage())
                        .bind("max_usage", entity.getMax_usage())
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
    public CouponModel update(CouponModel entity) {
        CouponModel couponExisted = findCouponById(entity.getId());
        if (couponExisted == null) {
            log("Coupon not found");
            return null;
        }
        System.out.println(couponExisted);

        String sql = "UPDATE coupon SET brand_id = :brand_id, code = :code,min_order_value = :min_order_value,discount_type=:discount_type" +
                ",discount_value=:discount_value,max_discount_value=:max_discount_value,start_date=:start_date,end_date=:end_date,current_usage=:current_usage" +
                ",max_usage=:max_usage, created_at=:created_at,is_available = :isAvailable WHERE id = :id";
        try {
            int result = JDBIConnector.getJdbi().withHandle(handle -> {
                return handle.createUpdate(sql)
                        .bind("brand_id", entity.getBrand_id() == null ? couponExisted.getBrand_id() : entity.getBrand_id())
                        .bind("code", entity.getCode() == null ? couponExisted.getCode() : entity.getCode().trim())
                        .bind("min_order_value", entity.getMin_order_value() == null ? couponExisted.getMin_order_value() : entity.getMin_order_value())
                        .bind("discount_type", entity.getDiscount_type().toString() == null ? couponExisted.getDiscount_type().toString() : entity.getDiscount_type().toString())
                        .bind("discount_value", entity.getDiscount_value()== null ? couponExisted.getDiscount_value() : entity.getDiscount_value())
                        .bind("max_discount_value", entity.getMax_discount_value() == null ? couponExisted.getMax_discount_value() : entity.getMax_discount_value())
                        .bind("start_date", entity.getStart_date() == null ? couponExisted.getStart_date() : entity.getStart_date())
                        .bind("end_date", entity.getEnd_date() == null ? couponExisted.getEnd_date() : entity.getEnd_date())
                        .bind("current_usage", entity.getCurrent_usage() == null ? couponExisted.getCurrent_usage() : entity.getCurrent_usage())
                        .bind("max_usage", entity.getMax_usage() == null ? couponExisted.getMax_usage() : entity.getMax_usage())
                        .bind("isAvailable", Boolean.TRUE)
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
    public void delete(CouponModel entity) {

    }

    @Override
    public List<CouponModel> findAll(String keyword, int currentPage, int pageSize, String orderBy) {
        // Sàng lọc dữ liệu đầu vào
        if (currentPage < 1) currentPage = 1;

        // Tránh SQL Injection bằng cách kiểm tra cột hợp lệ
        List<String> allowedColumns = Arrays.asList("id", "brand_id", "code", "min_order_value", "discount_type","discount_value","max_discount_value","start_date","end_date","current_usage","created_at","is_available");
        if (!allowedColumns.contains(orderBy)) {
            orderBy = "id";
        }

        // Xây dựng câu lệnh SQL
        String sql = "SELECT * FROM coupon ";
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += "WHERE CONCAT(id,brand_id, code, min_order_value, discount_type,discount_value,max_discount_value,start_date,end_date,current_usage,max_usage, created_at, is_available) LIKE :keyword ";
        }
        sql += "ORDER BY " + orderBy + " " +
                "LIMIT :limit " +
                "OFFSET :offset";
        // Sử dụng JDBI để thực hiện truy vấn
        int finalCurrentPage = currentPage;
        String finalSql = sql;


        List<CouponModel> couponModels = JDBIConnector.getJdbi().withHandle(handle -> {
            // Tạo truy vấn và gán các tham số
            var query = handle.createQuery(finalSql)
                    .bind("limit", pageSize)
                    .bind("offset", (finalCurrentPage - 1) * pageSize);

            if (keyword != null && !keyword.trim().isEmpty()) {
                query.bind("keyword", "%" + keyword + "%");
            }

            // Ánh xạ kết quả truy vấn thành đối tượng UserModel
            return query.mapToBean(CouponModel.class).list();
        });
        return couponModels;
    }

    @Override
    public Long getTotalPage(int numOfItems) {
        String query = "SELECT COUNT(*) FROM coupon";

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
