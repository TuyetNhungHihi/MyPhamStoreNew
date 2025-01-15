package vn.edu.hcmuaf.fit.myphamstore.controller.admin;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.common.action.AdminAction;
import vn.edu.hcmuaf.fit.myphamstore.service.IBrandService;

import java.io.IOException;

@WebServlet(name = "AdminBrandController", value = "/admin/brands")
public class BrandController extends HttpServlet {
    @Inject
    private IBrandService brandService;

    @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty() || action.equalsIgnoreCase(AdminAction.DISPLAY) || action.equalsIgnoreCase(AdminAction.SEARCH)) {
            brandService.displayBrand(request, response);
        } else if (action.equalsIgnoreCase(AdminAction.STOP_BUYING)) {
            brandService.stopBuying( request, response);
        }else if (action.equalsIgnoreCase(AdminAction.START_BUYING)) {
            brandService.startBuying(request, response);
        }else if (action.equalsIgnoreCase(AdminAction.ADD)) {
            brandService.addBrand(request, response);
        } else if (action.equalsIgnoreCase(AdminAction.EDIT)) {
            brandService.updateBrand(request, response);
        }
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        }
}
