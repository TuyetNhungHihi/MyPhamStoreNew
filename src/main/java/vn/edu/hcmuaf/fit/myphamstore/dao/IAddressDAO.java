package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.AddressModel;

import java.util.List;

public interface IAddressDAO extends GenericDAO<AddressModel> {
    List<AddressModel> findByUserId(Long userId);
    boolean checkAddressIsExist(AddressModel addressModel, Long userId);
}
