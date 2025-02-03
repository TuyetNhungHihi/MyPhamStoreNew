package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.model.WishlistModel;

import java.util.List;

public interface IWishlistDAO extends GenericDAO<WishlistModel> {
    WishlistModel findWishlistById(Long id);
    WishlistModel getWishlistDetail(Long id);
    List<ProductModel> getWishlist(Long userId);

    void removeFromWishlist(Long userId, long productId);

    void addToWishlist(long userId, long productId);
}
