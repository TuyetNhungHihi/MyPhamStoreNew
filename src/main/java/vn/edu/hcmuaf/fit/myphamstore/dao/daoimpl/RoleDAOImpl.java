package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import jakarta.enterprise.context.ApplicationScoped;
import vn.edu.hcmuaf.fit.myphamstore.common.JDBIConnector;
import vn.edu.hcmuaf.fit.myphamstore.common.RoleType;
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

    @Override
    public void setRoleToUser(String roleType, Long userId) {
        System.out.println(userId);
        RoleModel roleModel = this.findRoleByName(roleType);
        System.out.println(roleModel);
        String sql = "INSERT INTO user_has_role (role_id, user_id) VALUES (:role_id, :user_id)";
        try{
            JDBIConnector.getJdbi().useHandle(handle ->{
                handle.createUpdate(sql)
                        .bind("role_id", roleModel.getId())
                        .bind("user_id", userId)
                        .execute()
                        ;
            });
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public RoleModel findRoleByName(String roleType) {
        String sql = "SELECT * FROM role WHERE name = :roleName";
        try{
            return JDBIConnector.getJdbi().withHandle(handle ->{
                return handle.createQuery(sql)
                        .bind("roleName", roleType.trim())
                        .mapToBean(RoleModel.class)
                        .one();
            });
        }catch (Exception e){
        return null;
        }
    }

}
