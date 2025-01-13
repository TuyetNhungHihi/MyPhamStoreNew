package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import vn.edu.hcmuaf.fit.myphamstore.common.JDBIConnector;
import vn.edu.hcmuaf.fit.myphamstore.dao.ICouponDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;
import vn.edu.hcmuaf.fit.myphamstore.model.CouponModel;

import java.util.List;

import static java.rmi.server.LogStream.log;

public class CouponDAOImpl implements ICouponDAO {

    @Override
    public CouponModel findCouponById(Long id) {
        String query = "SELECT * FROM coupon WHERE id = :id";
        try {
            CouponModel result = JDBIConnector.getJdbi().withHandle(handle -> handle.createQuery(query)
                    .bind("id", id)
                    .mapToBean(CouponModel.class)
                    .one());
            return result;
        } catch (Exception e) {
            log("category not found");
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Long save(CouponModel entity) {
        return 0L;
    }

    @Override
    public CouponModel update(CouponModel entity) {
        return null;
    }

    @Override
    public void delete(CouponModel entity) {

    }

    @Override
    public List<CouponModel> findAll(String keyword, int currentPage, int pageSize, String orderBy) {
        return List.of();
    }

    @Override
    public Long getTotalPage(int numOfItems) {
        return 0L;
    }
}
