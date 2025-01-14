package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;
import vn.edu.hcmuaf.fit.myphamstore.model.CouponModel;
import vn.edu.hcmuaf.fit.myphamstore.model.SlideModel;

import java.util.List;

public interface ICouponDAO extends GenericDAO<CouponModel> {
    CouponModel getCouponDetail(Long id);
    public CouponModel findCouponById(Long id);
}
