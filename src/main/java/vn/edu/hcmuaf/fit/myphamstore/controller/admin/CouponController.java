package vn.edu.hcmuaf.fit.myphamstore.controller.admin;

import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;
import vn.edu.hcmuaf.fit.myphamstore.model.CouponModel;
import vn.edu.hcmuaf.fit.myphamstore.service.ICouponService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCouponController", value = "/admin/coupon")
public class CouponController extends HttpServlet {
    @Inject
    private ICouponService couponService;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/coupon/coupon-management.jsp");
        String keyword = request.getParameter("keyword");
        String orderBy = request.getParameter("orderBy");
        int currentPage = Integer.parseInt(request.getParameter("currentPage")==null?"1": request.getParameter("currentPage"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize") == null?"5": request.getParameter("pageSize"));

        List<CouponModel> coupons = couponService.pagingCoupon(keyword, currentPage, pageSize, orderBy);
        Long totalPages = couponService.getTotalPage(5);

        request.setAttribute("coupons", coupons);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("keyword", keyword);
        request.setAttribute("orderBy", orderBy);
        System.out.println(coupons);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
