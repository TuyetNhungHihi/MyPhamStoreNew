package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.common.Gender;
import vn.edu.hcmuaf.fit.myphamstore.common.PasswordUtils;
import vn.edu.hcmuaf.fit.myphamstore.common.UserStatus;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends GenericDAO<UserModel> {


    public boolean checkEmailExist(String email){
        String sql = "SELECT COUNT(email) FROM user WHERE email = ?";
        Connection connection = super.getConnection();
        if(connection == null) return false;
        //logic
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1) > 0;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            super.close(connection, ps, rs);
        }
        return false;
    }

    @Override
    public Long save(UserModel entity) {
        String sql = "INSERT INTO user (email, full_name, phone, date_of_birth, gender, status, created_at, updated_at, avatar, password, last_login) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        //get connection
        Connection connection = super.getConnection();
        if(connection == null) return null;
        //logic
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection.setAutoCommit(false);

            ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, entity.getEmail().trim());
            ps.setString(2, entity.getFullName().trim());
            ps.setString(3, entity.getPhone().trim());
            ps.setDate(4, Date.valueOf(entity.getDateOfBirth()));
            ps.setString(5, entity.getGender().toString().toUpperCase());
            ps.setString(6, entity.getStatus().name());
            ps.setTimestamp(7, Timestamp.valueOf(LocalDateTime.now()));
            ps.setTimestamp(8, Timestamp.valueOf(LocalDateTime.now()));
            ps.setString(9, entity.getAvatar());
            //hash password
            String password = entity.getPassword();
            String hashedPassword = PasswordUtils.hashPassword(password);
            ps.setString(10, hashedPassword);
            ps.setTimestamp(11, Timestamp.valueOf(LocalDateTime.now()));

            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if(rs.next()){
                connection.commit();
                return rs.getLong(1);
            }

        }catch (SQLException e){
            try {
                connection.rollback();
            } catch (SQLException ex) {
                e.printStackTrace();
            }
            return null;
        }finally {
            super.close(connection, ps, rs);
        }

        return null;
    }

    @Override
    public UserModel update(UserModel entity) {
        //check user
        UserModel user = findById(entity.getId());
        if(user == null) return null;

        String sql = "UPDATE user SET email = ?, full_name = ?, phone = ?, date_of_birth = ?, gender = ?, status = ?, last_login = ?, avatar = ?, password = ? WHERE id = ?";
        //get connection
        Connection connection = super.getConnection();
        if(connection == null) return null;
        //logic
        PreparedStatement ps = null;
        Integer result = null;
        try {
            connection.setAutoCommit(false);
            ps = connection.prepareStatement(sql);
            ps.setString(1, entity.getEmail() == null ? user.getEmail() : entity.getEmail().trim());
            ps.setString(2, entity.getFullName() == null ? user.getFullName() : entity.getFullName().trim());
            ps.setString(3, entity.getPhone() == null ? user.getPhone() : entity.getPhone().trim());
            ps.setDate(4, entity.getDateOfBirth() == null ? Date.valueOf(user.getDateOfBirth()) : Date.valueOf(entity.getDateOfBirth()));
            ps.setString(5, entity.getGender() == null ? user.getGender().toString().toUpperCase() : entity.getGender().toString().toUpperCase());
            ps.setString(6, entity.getStatus() == null ? user.getStatus().name() : entity.getStatus().name());
            ps.setTimestamp(7, Timestamp.valueOf(user.getLastLogin()));
            ps.setString(8, entity.getAvatar() == null ? user.getAvatar() : entity.getAvatar());
            ps.setString(9, entity.getPassword() == null ? user.getPassword() : PasswordUtils.hashPassword(entity.getPassword()));
            ps.setLong(10, entity.getId());
            result = ps.executeUpdate();

            if(result > 0) {
                connection.commit();
                return entity;
            }
            else{
                connection.rollback();
            }

        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            super.close(connection, ps, null);
        }

        return null;
    }

    @Override
    public void delete(UserModel entity) {
        entity.setStatus(UserStatus.INACTIVE);
        update(entity);
    }

    @Override
    public UserModel findById(Long id) {
        String sql = "SELECT * FROM user WHERE id = ?";
        //get connection
        Connection connection = super.getConnection();
        if(connection == null) return null;

        //logic
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            while (rs.next()){
                UserModel user = UserModel.builder()
                        .id(rs.getLong("id"))
                        .email(rs.getString("email"))
                        .fullName(rs.getString("full_name"))
                        .phone(rs.getString("phone"))
                        .dateOfBirth(rs.getDate("date_of_birth").toLocalDate())
                        .gender(Gender.valueOf(rs.getString("gender")))
                        .status(UserStatus.valueOf(rs.getString("status")))
                        .lastLogin(rs.getTimestamp("last_login").toLocalDateTime())
                        .createdAt(rs.getTimestamp("created_at").toLocalDateTime())
                        .updatedAt(rs.getTimestamp("updated_at").toLocalDateTime())
                        .avatar(rs.getString("avatar"))
                        .password(rs.getString("password"))
                        .build();
                return user;
            }
        }catch (SQLException e){
            return null;
        } finally {
            super.close(connection, ps, rs);
        }
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public List<UserModel> findAll() {
        List<UserModel> result = new ArrayList<>();
        String sql = "SELECT * FROM user WHERE id = ?";
        //get connection
        Connection connection = super.getConnection();
        if (connection == null) {
            return result;
        }
        PreparedStatement ps = null;
        ResultSet resultSet = null;
        try {
             ps = connection.prepareStatement(sql);
             resultSet = ps.executeQuery();

            while(resultSet.next()){
                UserModel user = UserModel.builder()
                        .id(resultSet.getLong("id"))
                        .email(resultSet.getString("email"))
                        .fullName(resultSet.getString("full_name"))
                        .phone(resultSet.getString("phone"))
                        .dateOfBirth(resultSet.getDate("date_of_birth").toLocalDate())
                        .gender(Gender.valueOf(resultSet.getString("gender")))
                        .status(UserStatus.valueOf(resultSet.getString("status")))
                        .lastLogin(resultSet.getTimestamp("last_login").toLocalDateTime())
                        .createdAt(resultSet.getTimestamp("created_at").toLocalDateTime())
                        .updatedAt(resultSet.getTimestamp("updated_at").toLocalDateTime())
                        .avatar(resultSet.getString("avatar"))
                        .build();
                result.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            super.close(connection, ps, resultSet);
        }

        return result;
    }
}
