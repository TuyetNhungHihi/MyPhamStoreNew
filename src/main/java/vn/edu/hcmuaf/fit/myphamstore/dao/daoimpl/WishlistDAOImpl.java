package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.myphamstore.dao.IWishlistDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.model.WishlistModel;

import java.util.List;

public class WishlistDAOImpl implements IWishlistDAO {

//    public void addToWishlist(long userId, long productId) {
//        jdbi.useHandle(handle ->
//                handle.execute("INSERT INTO wishlist (user_id, product_id) VALUES (?, ?)", userId, productId));
//    }
//
//    public void removeFromWishlist(long userId, long productId) {
//        jdbi.useHandle(handle ->
//                handle.execute("DELETE FROM wishlist WHERE user_id = ? AND product_id = ?", userId, productId));
//    }
//
//    public List<ProductModel> getWishlist(long userId) {
//        return jdbi.withHandle(handle ->
//                handle.createQuery("SELECT p.* FROM products p JOIN wishlist w ON p.id = w.product_id WHERE w.user_id = ?")
//                        .bind(0, userId)
//                        .mapToBean(ProductModel.class)
//                        .list());
//    }

    @Override
    public WishlistModel findWishlistById(Long id) {
        return null;
    }

    @Override
    public WishlistModel getWishlistDetail(Long id) {
        return null;
    }

    @Override
    public List<ProductModel> getWishlist(Long userId) {
        return List.of();
    }

    @Override
    public void removeFromWishlist(Long userId, long productId) {

    }

    @Override
    public void addToWishlist(long userId, long productId) {

    }


    @Override
    public Long save(WishlistModel entity) {
        return 0L;
    }

    @Override
    public WishlistModel update(WishlistModel entity) {
        return null;
    }

    @Override
    public void delete(WishlistModel entity) {

    }

    @Override
    public List<WishlistModel> findAll(String keyword, int currentPage, int pageSize, String orderBy) {
        return List.of();
    }

    @Override
    public Long getTotalPage(int numOfItems) {
        return 0L;
    }
}