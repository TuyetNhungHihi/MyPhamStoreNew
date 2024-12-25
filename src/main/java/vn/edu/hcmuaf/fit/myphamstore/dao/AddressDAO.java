package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.common.DBUtil;
import vn.edu.hcmuaf.fit.myphamstore.model.AddressModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AddressDAO implements GenericDAO<AddressModel> {

    public List<AddressModel> getAddressesByUserId(long userId) {
        String sql = "select * from address where user_id = ?";
        List<AddressModel> addresses = new ArrayList<AddressModel>();
        //get connection
        Connection connection = DBUtil.getConnection();
        if(connection == null) return null;
        //logic
        PreparedStatement ps = null;
        Integer result = null;
        try{
            ps = connection.prepareStatement(sql);
            ps.setLong(1, userId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                addresses.add(AddressModel.builder()
                                .id(rs.getLong("id"))
                                .city(rs.getString("city"))
                                .district(rs.getString("district"))
                                .ward(rs.getString("ward"))
                                .note(rs.getString("note"))
                                .is_default(rs.getBoolean("is_default"))
                                .recipientName(rs.getString("recipient_name"))
                                .recipientPhone(rs.getString("recipient_phone"))
                                .createdAt(rs.getTimestamp("created_at").toLocalDateTime())
                                .updatedAt(rs.getTimestamp("updated_at").toLocalDateTime())
                                .is_active(rs.getBoolean("is_active"))
                        .build());
            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(connection, ps, null);
        }
        return addresses;
    }
    @Override
    public Long save(AddressModel entity) {
        return 0L;
    }

    @Override
    public AddressModel update(AddressModel entity) {
        return null;
    }

    @Override
    public void delete(AddressModel entity) {

    }

    @Override
    public List<AddressModel> findAll(String keyword,int currentPage, int pageSize, String orderBy) {
        return List.of();
    }
}
