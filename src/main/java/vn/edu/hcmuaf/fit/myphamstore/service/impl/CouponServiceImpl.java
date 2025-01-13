package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.inject.Inject;
import vn.edu.hcmuaf.fit.myphamstore.dao.ICouponDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.CouponModel;
import vn.edu.hcmuaf.fit.myphamstore.service.ICouponService;

import java.util.List;

public class CouponServiceImpl implements ICouponService {
    @Inject
    private ICouponDAO couponDAO;
    @Override
    public CouponModel findCouponById(Long id) {
        return couponDAO.findCouponById(id);
    }

    @Override
    public List<CouponModel> pagingCoupon(String keyword, int currentPage, int pageSize, String orderBy) {
        return couponDAO.findAll(keyword, currentPage, pageSize, orderBy);
    }

    @Override
    public Long getTotalPage(int numOfItem) {
        return couponDAO.getTotalPage(numOfItem);
    }
}
