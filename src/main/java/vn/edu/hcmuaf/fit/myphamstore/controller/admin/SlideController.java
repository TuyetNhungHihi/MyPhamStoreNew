package vn.edu.hcmuaf.fit.myphamstore.controller.admin;
import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.myphamstore.common.Arlert;
import vn.edu.hcmuaf.fit.myphamstore.model.CategoryModel;
import vn.edu.hcmuaf.fit.myphamstore.model.SlideModel;
import vn.edu.hcmuaf.fit.myphamstore.service.ISlideService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SlideController", value = "/admin/slides")
public class SlideController extends HttpServlet {
    @Inject
    private ISlideService slideService;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/slide/slide-management.jsp");
        List<SlideModel> slides = slideService.findAll();

        request.setAttribute("slides", slides);
        dispatcher.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String[] images = request.getParameterValues("images");
        if(images==null ||  List.of(images).isEmpty()) {
            Arlert alert = new Arlert();
            alert.setMessage("Vui lòng chọn hình ảnh");
            alert.setType(Arlert.TYPE_WARNING);
            request.setAttribute("alert", alert);
            request.getRequestDispatcher("/admin/slide/slide-management.jsp").forward(request, response);
            return;
        }

        //xóa hình ảnh cũ
        slideService.deleteAll();

        //lưu hình anảnh vào db
        for (String image : images) {
            SlideModel slide = new SlideModel();
            slide.setImage(image);
            slideService.save(slide);
        }
        Arlert alert = new Arlert();
        alert.setMessage("Cập nhật slide thành công!");
        alert.setType(Arlert.TYPE_SUCCESS);
        request.setAttribute("alert", alert);
        request.getRequestDispatcher("/admin/slide/slide-management.jsp").forward(request, response);
    }

}
