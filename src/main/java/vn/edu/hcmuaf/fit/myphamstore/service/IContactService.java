package vn.edu.hcmuaf.fit.myphamstore.service;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.model.ContactModel;

import java.io.IOException;
import java.util.List;

public interface IContactService {
    ContactModel findContactById(Long id);
    List<ContactModel> getContactsWithPaging(String keyword, int currentPage, int pageSize, String orderBy);
    void displayContact(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    void pending(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

    void done(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    Long getTotalPage(int i);
}
