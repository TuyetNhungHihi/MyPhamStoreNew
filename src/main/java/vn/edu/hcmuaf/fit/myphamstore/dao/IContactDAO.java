package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.ContactModel;

public interface IContactDAO extends GenericDAO<ContactModel> {
    ContactModel findContactById(Long id);
}
