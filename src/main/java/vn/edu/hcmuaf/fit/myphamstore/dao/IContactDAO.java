package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.ContactModel;

public interface IContactDAO {
    Long saveContact(ContactModel contactModel);
    void updateContact(ContactModel contactModel);
    ContactModel findContactById(Long id);
}
