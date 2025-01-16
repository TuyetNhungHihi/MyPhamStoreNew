package vn.edu.hcmuaf.fit.myphamstore.controller.admin;

import jakarta.inject.Inject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.common.action.AdminAction;
import vn.edu.hcmuaf.fit.myphamstore.service.IContactService;

import java.io.IOException;
@WebServlet(name = "AdminContactController", value = "/admin/contacts")
public class ContactController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Inject
    private IContactService contactService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equalsIgnoreCase(AdminAction.DISPLAY) || action.equalsIgnoreCase(AdminAction.SEARCH)) {
            contactService.displayContact(request, response);
        } else if (action.equalsIgnoreCase(AdminAction.PENDING)) {
            contactService.pending( request, response);
        }else if (action.equalsIgnoreCase(AdminAction.DONE)) {
            contactService.done(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
