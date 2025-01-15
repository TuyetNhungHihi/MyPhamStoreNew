package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.edu.hcmuaf.fit.myphamstore.common.UploadUtil;
import vn.edu.hcmuaf.fit.myphamstore.dao.*;
import vn.edu.hcmuaf.fit.myphamstore.model.*;
import vn.edu.hcmuaf.fit.myphamstore.service.IProductImageService;
import vn.edu.hcmuaf.fit.myphamstore.service.IProductService;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
@ApplicationScoped
public class ProductServiceImpl implements IProductService {
    //khai báo các hằng số cấu hình
    private static final String UPLOAD_DIRECTORY = "/static/images/products";
    private static final int THRESHOLD_SIZE = 1024 * 1024 * 3; // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB


    @Inject
    private IProductDAO productDAO;
    @Inject
    private IBrandDAO brandDAO;
    @Inject
    private IProductImageDAO productImageDAO;
    @Inject
    private IReviewDAO reviewDAO;
    @Inject
    private ICategoryDAO categoryDAO;


    @Override
    public Long getTotalPage(int numOfItems) {
        return productDAO.getTotalPage(numOfItems);
    }

    @Override
    public List<ProductModel> getProductsWithPaging(String keyword, int currentPage, int pageSize, String orderBy) {
        if (keyword != null && !keyword.isEmpty()) {
            keyword = keyword.trim();
        }
        return productDAO.findAll(keyword, currentPage, pageSize, orderBy);
    }

    @Override
    public Long getTotalProduct() {
        return productDAO.countAllProducts();
    }

    @Override
    public List<ProductModel> getProductsByCategory(long l) {
        return productDAO.getProductsByCategory(l);
    }

    @Override
    public List<ProductModel> getLatestProducts() {
        return productDAO.getLatestProducts();
    }

    @Override
    public ProductModel findProductById(Long id) {
        return productDAO.getProductDetail(id);
    }

    @Override
    public ProductModel getProductDetail(Long id) {
        return productDAO.getProductDetail(id);
    }

    @Override
    public BrandModel getBrandById(Long brandId) {
        return brandDAO.findBrandById(brandId);
    }

    @Override
    public List<ProductImageModel> getProductImageById(Long id) {
        return productImageDAO.getProductImageById(id);
    }

    @Override
    public List<ReviewModel> getReviewsByProductId(Long id) {
        return reviewDAO.getAllReviewsByProductId(id);
    }

    @Override
    public void insertProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String thumbnail = request.getParameter("thumbnail");
        System.out.println(thumbnail);
    }


    @Override
    public void stopBuying(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        //tến hành cập nhật trạng thái sản phẩm
        ProductModel productModel = ProductModel.builder().id(id).build();
        productModel.setIsAvailable(false);

        ProductModel isSuccess = productDAO.update(productModel);
        if (isSuccess == null) {
            request.setAttribute("message", "Có lỗi xảy ra");
        } else {
            request.setAttribute("message", "Cập nhật thành công id: " + id);
            this.displayProduct(request, response);
        }
    }

    @Override
    public void startBuying(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        //tến hành cập nhật trạng thái sản phẩm
        ProductModel productModel = ProductModel.builder().id(id).build();
        productModel.setIsAvailable(true);

        ProductModel isSuccess = productDAO.update(productModel);
        if (isSuccess == null) {
            request.setAttribute("message", "Có lỗi xảy ra");
        } else {
            request.setAttribute("message", "Cập nhật thành công id: " + id);
            this.displayProduct(request, response);
        }
    }

    @Override
    public void displayProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/product/product-management.jsp");
        String keyword = request.getParameter("keyword");
        String orderBy = request.getParameter("orderBy");
        int currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize") == null ? "10" : request.getParameter("pageSize"));

        List<ProductModel> products = this.getProductsWithPaging(keyword, currentPage, pageSize, orderBy);
        Long totalPages = this.productDAO.getTotalPage(pageSize);
        // Gửi danh sách sản phẩm đến trang JSP
        request.setAttribute("products", products);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalItems", productDAO.countAllProducts());
        System.out.println("currentPage: " + currentPage);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("keyword", keyword);
        request.setAttribute("orderBy", orderBy);
        dispatcher.forward(request, response);
    }

    @Override
    public void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/product/add-product.jsp");
        List<BrandModel> brands = brandDAO.getAllBrands();
        List<CategoryModel> categories = categoryDAO.getAllCategories();
        request.setAttribute("brands", brands);
        request.setAttribute("categories", categories);
        dispatcher.forward(request, response);
    }

    @Override
    public void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/product/add-product.jsp");
        Long id = Long.parseLong(request.getParameter("id"));
        ProductModel product = productDAO.getProductDetail(id);
        request.setAttribute("product", product);
        dispatcher.forward(request, response);
    }
}
