package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.model.WishlistModel;

import java.util.List;

public interface IWishlistDAO {
    void addToWishlist(long userId, long productId);
    List<ProductModel> getWishlistByUserId(Long userId);
    void removeFromWishlist(Long userId, long productId);

    List<WishlistModel> findByUserId(Long userId);

    WishlistModel findWishlistById(Long id);

    WishlistModel getWishlistDetail(Long id);

    Long save(WishlistModel entity);

    WishlistModel update(WishlistModel entity);

    void delete(WishlistModel entity);

    List<WishlistModel> findAll(String keyword, int currentPage, int pageSize, String orderBy);

    Long getTotalPage(int numOfItems);

    List<ProductModel> getWishlistByUserId(Long userId, int page, int size);

    int getWishlistCountByUserId(Long userId);
}