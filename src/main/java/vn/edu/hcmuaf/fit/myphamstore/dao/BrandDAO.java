package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.common.DBUtil;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class BrandDAO implements GenericDAO<BrandModel> {
    @Override
    public Long save(BrandModel entity) {
        return 0L;
    }

    @Override
    public BrandModel update(BrandModel entity) {
        return null;
    }

    @Override
    public void delete(BrandModel entity) {

    }
    public BrandModel findById(Long id) {
        //Buoc 1: tạo câu lệnh sql
        String sql = "SELECT * FROM brand WHERE id = ?";

        //Bước 2: get connection
        Connection connection = DBUtil.getConnection()

;
        if (connection == null) return null;
        //Code logic
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if(rs.next()){
                return BrandModel.builder()
                        .id(rs.getLong("id"))
                        .name(rs.getString("name"))
                        .logo(rs.getString("logo"))
                        .createdAt(rs.getTimestamp("created_at").toLocalDateTime())
                        .updatedAt(rs.getTimestamp("updated_at").toLocalDateTime())
                        .build();
            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(connection, ps, rs);
        }
        return null;
    }

    @Override
    public List<BrandModel> findAll(String keyword,int currentPage, int pageSize, String orderBy) {
        return List.of();
    }
}
