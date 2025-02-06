package vn.edu.hcmuaf.fit.myphamstore.service;

import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.model.WishlistModel;

import java.util.List;

public interface IWishlistService {
    List<ProductModel> getWishlistByUserId(Long userId);
    void addToWishlist(long userId, long productId);
    void removeFromWishlist(Long userId, long productId);

    int getWishlistCountByUserId(Long id);
}