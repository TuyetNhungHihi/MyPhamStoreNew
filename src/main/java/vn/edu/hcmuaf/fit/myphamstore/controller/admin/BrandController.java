package vn.edu.hcmuaf.fit.myphamstore.controller.admin;

import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.common.action.AdminBrandAction;
import vn.edu.hcmuaf.fit.myphamstore.common.action.AdminProductAction;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IBrandService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminBrandController", value = "/admin/brand")
public class BrandController extends HttpServlet {
    @Inject
    private IBrandService brandService;

    @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equalsIgnoreCase(AdminBrandAction.DISPLAY_BRAND)) {
            brandService.displayBrand(request, response);
        } else if (action.equalsIgnoreCase(AdminBrandAction.STOP_BUYING)) {
            brandService.stopBuying( request, response);
        }else if (action.equalsIgnoreCase(AdminBrandAction.START_BUYING)) {
            brandService.startBuying(request, response);
        }else if (action.equalsIgnoreCase(AdminBrandAction.ADD_BRAND)) {
            brandService.addBrand(request, response);
        } else if (action.equalsIgnoreCase(AdminBrandAction.EDIT_BRAND)) {
            brandService.updateBrand(request, response);
        }
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        }
}
