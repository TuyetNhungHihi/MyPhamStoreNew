package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl.WishlistDAOImpl;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;

import java.util.List;

public class WishlistServiceImpl {
    private final WishlistDAOImpl wishlistDao;

    public WishlistServiceImpl(WishlistDAOImpl wishlistDao) {
        this.wishlistDao = wishlistDao;
    }

    public void addToWishlist(long userId, long productId) {
        wishlistDao.addToWishlist(userId, productId);
    }

    public List<ProductModel> getWishlist(long userId) {
        return wishlistDao.getWishlist(userId);
    }

    public void removeFromWishlist(Long userId, long productId) {
        wishlistDao.removeFromWishlist(userId, productId);
    }
}