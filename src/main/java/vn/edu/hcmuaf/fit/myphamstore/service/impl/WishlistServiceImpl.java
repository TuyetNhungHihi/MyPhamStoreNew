package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.inject.Inject;
import vn.edu.hcmuaf.fit.myphamstore.dao.IWishlistDAO;
import vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl.WishlistDAOImpl;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IWishlistService;

import java.util.List;

public class WishlistServiceImpl implements IWishlistService {
    @Inject
    private IWishlistDAO wishlistDao;

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