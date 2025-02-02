package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;

import java.util.List;

public class WishlistDAOImpl {
    private final Jdbi jdbi;

    public WishlistDAOImpl(Jdbi jdbi) {
        this.jdbi = jdbi;
    }

    public void addToWishlist(long userId, long productId) {
        jdbi.useHandle(handle ->
                handle.execute("INSERT INTO wishlist (user_id, product_id) VALUES (?, ?)", userId, productId));
    }

    public void removeFromWishlist(long userId, long productId) {
        jdbi.useHandle(handle ->
                handle.execute("DELETE FROM wishlist WHERE user_id = ? AND product_id = ?", userId, productId));
    }

    public List<ProductModel> getWishlist(long userId) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT p.* FROM products p JOIN wishlist w ON p.id = w.product_id WHERE w.user_id = ?")
                        .bind(0, userId)
                        .mapToBean(ProductModel.class)
                        .list());
    }
}