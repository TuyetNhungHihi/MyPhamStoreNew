package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import jakarta.enterprise.context.ApplicationScoped;
import vn.edu.hcmuaf.fit.myphamstore.common.JDBIConnector;
import vn.edu.hcmuaf.fit.myphamstore.dao.IRoleDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.RoleModel;

import java.util.List;
@ApplicationScoped
public class RoleDAOImpl implements IRoleDAO {
    @Override
    public List<RoleModel> findListRoleByUserId(Long userId) {
        String sql = "select r.* \n" +
                "from user as u \n" +
                "join user_has_role as u_r on u.id = u_r.user_id\n" +
                "join role as r on r.id = u_r.role_id\n" +
                "where u.id = :userId";
        try {
            return JDBIConnector.getJdbi().withHandle(handle ->
                    handle.createQuery(sql)
                            .bind("userId", userId)
                            .mapToBean(RoleModel.class)
                            .list()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
