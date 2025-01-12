package vn.edu.hcmuaf.fit.myphamstore.service;

import vn.edu.hcmuaf.fit.myphamstore.common.ContactStatus;
import vn.edu.hcmuaf.fit.myphamstore.model.ContactModel;

public interface IContactService {
    Long saveContact(ContactModel contactModel);
    void updateStatus(Long id, ContactStatus status);
    ContactModel findContactById(Long id);
}
