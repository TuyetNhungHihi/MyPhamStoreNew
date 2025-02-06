package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import vn.edu.hcmuaf.fit.myphamstore.common.JDBIConnector;
import vn.edu.hcmuaf.fit.myphamstore.dao.IWishlistDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.model.WishlistModel;

import java.util.Arrays;
import java.util.List;

public class WishlistDAOImpl implements IWishlistDAO {

    @Override
    public void addToWishlist(long userId, long productId) {
        String sql = "INSERT INTO wishlist (user_id, product_id) VALUES (:userId, :productId)";
        try {
            JDBIConnector.getJdbi().useHandle(handle ->
                    handle.createUpdate(sql)
                            .bind("userId", userId)
                            .bind("productId", productId)
                            .execute()
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void removeFromWishlist(Long userId, long productId) {
        String sql = "DELETE FROM wishlist WHERE user_id = :userId AND product_id = :productId";
        try {
            JDBIConnector.getJdbi().useHandle(handle ->
                    handle.createUpdate(sql)
                            .bind("userId", userId)
                            .bind("productId", productId)
                            .execute()
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<ProductModel> getWishlistByUserId(Long userId) {
        String sql = "SELECT p.* FROM product p JOIN wishlist w ON p.id = w.product_id WHERE w.user_id = :userId";
        try {
            return JDBIConnector.getJdbi().withHandle(handle ->
                    handle.createQuery(sql)
                            .bind("userId", userId)
                            .mapToBean(ProductModel.class)
                            .list()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<WishlistModel> findByUserId(Long userId) {
        String sql = "SELECT * FROM wishlist WHERE user_id = :userId";
        try {
            return JDBIConnector.getJdbi().withHandle(handle ->
                    handle.createQuery(sql)
                            .bind("userId", userId)
                            .mapToBean(WishlistModel.class)
                            .list()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public WishlistModel findWishlistById(Long id) {
        String sql = "SELECT * FROM wishlist WHERE id = :id";
        try {
            return JDBIConnector.getJdbi().withHandle(handle ->
                    handle.createQuery(sql)
                            .bind("id", id)
                            .mapToBean(WishlistModel.class)
                            .one()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public WishlistModel getWishlistDetail(Long id) {
        String sql = "SELECT * FROM wishlist WHERE id = :id";
        try {
            return JDBIConnector.getJdbi().withHandle(handle ->
                    handle.createQuery(sql)
                            .bind("id", id)
                            .mapToBean(WishlistModel.class)
                            .one()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Long save(WishlistModel entity) {
        String sql = "INSERT INTO wishlist (user_id, product_id) VALUES (:userId, :productId)";
        try {
            return JDBIConnector.getJdbi().withHandle(handle ->
                    handle.createUpdate(sql)
                            .bind("userId", entity.getUserId())
                            .bind("productId", entity.getProductId())
                            .executeAndReturnGeneratedKeys("id")
                            .mapTo(Long.class)
                            .one()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public WishlistModel update(WishlistModel entity) {
        WishlistModel wishlistExisted = findWishlistById(entity.getId());
        if (wishlistExisted == null) {
            return null;
        }
        String sql = "UPDATE wishlist SET user_id = :userId, product_id = :productId WHERE id = :id";
        try {
            int result = JDBIConnector.getJdbi().withHandle(handle ->
                    handle.createUpdate(sql)
                            .bind("userId", entity.getUserId() != null ? entity.getUserId() : wishlistExisted.getUserId())
                            .bind("productId", entity.getProductId() != null ? entity.getProductId() : wishlistExisted.getProductId())
                            .bind("id", entity.getId())
                            .execute()
            );
            if (result > 0) {
                return entity;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void delete(WishlistModel entity) {
        String sql = "DELETE FROM wishlist WHERE id = :id";
        try {
            JDBIConnector.getJdbi().useHandle(handle ->
                    handle.createUpdate(sql)
                            .bind("id", entity.getId())
                            .execute()
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<WishlistModel> findAll(String keyword, int currentPage, int pageSize, String orderBy) {
        if (currentPage < 1) currentPage = 1;
        List<String> allowedColumns = Arrays.asList("id", "user_id", "product_id");
        if (!allowedColumns.contains(orderBy)) {
            orderBy = "id";
        }
        String sql = "SELECT * FROM wishlist ";
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += "WHERE CONCAT(id, user_id, product_id) LIKE :keyword ";
        }
        sql += "ORDER BY " + orderBy + " LIMIT :limit OFFSET :offset";
        int finalCurrentPage = currentPage;
        String finalSql = sql;
        try {
            return JDBIConnector.getJdbi().withHandle(handle -> {
                var query = handle.createQuery(finalSql)
                        .bind("limit", pageSize)
                        .bind("offset", (finalCurrentPage - 1) * pageSize);
                if (keyword != null && !keyword.trim().isEmpty()) {
                    query.bind("keyword", "%" + keyword + "%");
                }
                return query.mapToBean(WishlistModel.class).list();
            });
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Long getTotalPage(int numOfItems) {
        String query = "SELECT COUNT(*) FROM wishlist";
        try {
            Long totalItems = JDBIConnector.getJdbi().withHandle(handle ->
                    handle.createQuery(query)
                            .mapTo(Long.class)
                            .one()
            );
            if (totalItems != null) {
                long countPage = totalItems / numOfItems;
                if (totalItems % numOfItems != 0) {
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
    public List<ProductModel> getWishlistByUserId(Long userId, int limit, int offset) {
        String sql = "SELECT p.* FROM product p JOIN wishlist w ON p.id = w.product_id WHERE w.user_id = ? LIMIT ? OFFSET ?";
        try {
            return JDBIConnector.getJdbi().withHandle(handle ->
                    handle.createQuery(sql)
                            .bind(0, userId)
                            .bind(1, limit)
                            .bind(2, offset)
                            .mapToBean(ProductModel.class)
                            .list()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    @Override
    public int getWishlistCountByUserId(Long userId) {
        String sql = "SELECT COUNT(*) FROM wishlist WHERE user_id = ?";
        try {
            return JDBIConnector.getJdbi().withHandle(handle ->
                    handle.createQuery(sql)
                            .bind(0, userId)
                            .mapTo(Integer.class)
                            .one()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}