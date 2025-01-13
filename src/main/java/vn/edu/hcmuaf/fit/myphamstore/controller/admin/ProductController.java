package vn.edu.hcmuaf.fit.myphamstore.controller.admin;

import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.common.action.AdminProductAction;
import vn.edu.hcmuaf.fit.myphamstore.model.ProductModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Product-Management", value = "/admin/products")
public class ProductController extends HttpServlet {
    @Inject
    private IProductService productService;
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equalsIgnoreCase(AdminProductAction.DISPLAY_PRODUCT)) {
            productService.displayProduct(request, response);
        } else if (action.equalsIgnoreCase(AdminProductAction.STOP_BUYING)) {
            productService.stopBuying( request, response);
        }else if (action.equalsIgnoreCase(AdminProductAction.START_BUYING)) {
            productService.startBuying(request, response);
        }else if (action.equalsIgnoreCase(AdminProductAction.ADD_PRODUCT)) {
            productService.addProduct(request, response);
        } else if (action.equalsIgnoreCase(AdminProductAction.EDIT_PRODUCT)) {
            productService.updateProduct(request, response);
        }
    }
}
