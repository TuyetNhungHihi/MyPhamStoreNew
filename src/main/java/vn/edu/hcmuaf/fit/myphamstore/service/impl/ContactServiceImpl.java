package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import vn.edu.hcmuaf.fit.myphamstore.common.ContactStatus;
import vn.edu.hcmuaf.fit.myphamstore.dao.IContactDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.ContactModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IContactService;

@ApplicationScoped
public class ContactServiceImpl implements IContactService {
    //CDI container dependency injection (tiêm phụ thuộc) -> java servlet weld
    @Inject
    private IContactDAO contactDAO;

    @Override
    public Long saveContact(ContactModel contactModel) {
        return contactDAO.saveContact(contactModel);
    }

    @Override
    public void updateStatus(Long id, ContactStatus status) {
        ContactModel contactModel = contactDAO.findContactById(id);
        if (contactModel == null) {
            System.out.println("Contact not found");
            return;
        }
        contactModel.setStatus(status);
        contactDAO.updateContact(contactModel);
    }

    @Override
    public ContactModel findContactById(Long id) {
        return contactDAO.findContactById(id);
    }
}
