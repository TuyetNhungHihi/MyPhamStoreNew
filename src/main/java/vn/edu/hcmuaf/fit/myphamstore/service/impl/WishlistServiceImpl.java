package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.inject.Inject;
import vn.edu.hcmuaf.fit.myphamstore.dao.IWishlistDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IWishlistService;

import java.util.List;

public class WishlistServiceImpl implements IWishlistService {
    @Inject
    private IWishlistDAO wishlistDao;

    @Override
    public List<ProductModel> getWishlistByUserId(Long userId) {
        return wishlistDao.getWishlistByUserId(userId);
    }

    @Override
    public void addToWishlist(long userId, long productId) {
        System.out.println(userId+ ""+productId);
        wishlistDao.addToWishlist(userId, productId);
    }

    public List<ProductModel> getWishlistByUserId(Long userId, int currentPage, int pageSize) {
        int offset = (currentPage - 1) * pageSize;
        return wishlistDao.getWishlistByUserId(userId, pageSize, offset);
    }

    public int getWishlistCountByUserId(Long userId) {
        return wishlistDao.getWishlistCountByUserId(userId);
    }

    @Override
    public void removeFromWishlist(Long userId, long productId) {
        wishlistDao.removeFromWishlist(userId, productId);
    }

}