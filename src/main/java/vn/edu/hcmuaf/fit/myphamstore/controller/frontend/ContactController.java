package vn.edu.hcmuaf.fit.myphamstore.controller.frontend;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.service.IContactService;

import java.io.IOException;

@WebServlet(name = "ContactController", value = "/lien-he")
public class ContactController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Inject
    private IContactService contactService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().print(contactService.findContactById(7L).toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}