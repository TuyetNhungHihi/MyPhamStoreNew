package vn.edu.hcmuaf.fit.myphamstore.service;

import vn.edu.hcmuaf.fit.myphamstore.model.CouponModel;

import java.util.List;

public interface ICouponService {
    CouponModel findCouponById(Long id);
    List<CouponModel> pagingCoupon(String keyword, int currentPage, int pageSize, String orderBy);
    Long getTotalPage(int numOfItem);

}
