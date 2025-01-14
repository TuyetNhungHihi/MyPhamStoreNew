package vn.edu.hcmuaf.fit.myphamstore.controller.admin;

import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
        if (action == null || action.equalsIgnoreCase(AdminProductAction.DISPLAY_PRODUCT)) {
            brandService.displayBrand(request, response);
        } else if (action.equalsIgnoreCase(AdminProductAction.STOP_BUYING)) {
            brandService.stopBuying( request, response);
        }else if (action.equalsIgnoreCase(AdminProductAction.START_BUYING)) {
            brandService.startBuying(request, response);
        }else if (action.equalsIgnoreCase(AdminProductAction.ADD_PRODUCT)) {
            brandService.addBrand(request, response);
        } else if (action.equalsIgnoreCase(AdminProductAction.EDIT_PRODUCT)) {
            brandService.updateBrand(request, response);
        }
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        }
}
