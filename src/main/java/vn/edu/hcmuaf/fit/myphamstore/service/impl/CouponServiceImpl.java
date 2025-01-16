package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.dao.ICouponDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.CouponModel;
import vn.edu.hcmuaf.fit.myphamstore.service.ICouponService;

import java.io.IOException;
import java.util.List;

public class CouponServiceImpl implements ICouponService {
    @Inject
    private ICouponDAO couponDAO;

    @Override
    public CouponModel findCouponById(Long id) {
        return couponDAO.findCouponById(id);
    }

    @Override
    public List<CouponModel> getCouponsWithPaging(String keyword, int currentPage, int pageSize, String orderBy) {
        if (keyword != null && !keyword.isEmpty()) {
            keyword = keyword.trim();
        }
        return couponDAO.findAll(keyword, currentPage, pageSize, orderBy);
    }

    @Override
    public Long getTotalPage(int numOfItem) {
        return couponDAO.getTotalPage(numOfItem);
    }

    @Override
    public void displayCoupon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/coupon/coupon-management.jsp");
        String keyword = request.getParameter("keyword");
        String orderBy = request.getParameter("orderBy");
        int currentPage = Integer.parseInt(request.getParameter("currentPage")==null?"1": request.getParameter("currentPage"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize") == null?"5": request.getParameter("pageSize"));

        List<CouponModel> coupons = this.getCouponsWithPaging(keyword, currentPage, pageSize, orderBy);
        Long totalPages = this.couponDAO.getTotalPage(5);

        request.setAttribute("coupons", coupons);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("keyword", keyword);
        request.setAttribute("orderBy", orderBy);
        dispatcher.forward(request, response);
    }

    @Override
    public void stopBuying(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        //tến hành cập nhật trạng thái sản phẩm
        CouponModel couponModel = CouponModel.builder().id(id).build();
        couponModel.setIsAvailable(false);
        CouponModel isSuccess = couponDAO.update(couponModel);
        System.out.println(isSuccess);
        if (isSuccess == null) {
            request.setAttribute("message", "Có lỗi xảy ra");
        } else {
            request.setAttribute("message", "Cập nhật thành công id: " + id);
            this.displayCoupon(request, response);
        }
    }

    @Override
    public void startBuying(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        //tến hành cập nhật trạng thái sản phẩm
        CouponModel couponModel = CouponModel.builder().id(id).build();
        couponModel.setIsAvailable(true);
        CouponModel isSuccess = couponDAO.update(couponModel);
        if (isSuccess == null) {
            request.setAttribute("message", "Có lỗi xảy ra");
        } else {
            request.setAttribute("message", "Cập nhật thành công id: " + id);
            this.displayCoupon(request, response);
        }
    }

    @Override
    public void addCoupon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/coupon/add-coupon.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void updateCoupon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/coupon/add-coupon.jsp");
        Long id = Long.parseLong(request.getParameter("id"));
        CouponModel coupon = couponDAO.getCouponDetail(id);
        System.out.println(coupon);
        request.setAttribute("coupon", coupon);
        dispatcher.forward(request, response);
    }


    @Override
    public List<CouponModel> findAvailableCoupons() {
        return couponDAO.findAvailableCoupons();
    }
}
