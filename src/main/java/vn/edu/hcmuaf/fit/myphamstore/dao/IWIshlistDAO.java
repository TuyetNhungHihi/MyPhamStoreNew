package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.WishlistModel;

public interface IWIshlistDAO extends GenericDAO<WishlistModel> {
    WishlistModel findWishlistById(Long id);
    WishlistModel getWishlistDetail(Long id);

}
