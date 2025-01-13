package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.RoleModel;

import java.util.List;

public interface IRoleDAO {
    List<RoleModel> findListRoleByUserId(Long userId);
}
