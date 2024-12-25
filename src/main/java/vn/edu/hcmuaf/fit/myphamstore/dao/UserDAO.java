package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.common.DBUtil;
import vn.edu.hcmuaf.fit.myphamstore.common.Gender;
import vn.edu.hcmuaf.fit.myphamstore.common.PasswordUtils;
import vn.edu.hcmuaf.fit.myphamstore.common.UserStatus;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class UserDAO extends GenericDAO<UserModel> {

    /**
     * phương thức phân tranguser
     * @param currentPage
     * @param pageSize
     * @return
     */
    public List<UserModel> getUsersWithPagingAndSearch(String keyword,int currentPage, int pageSize, String orderBy) {
        //sàn lọc dữ liệu đầu vào
        if(currentPage < 1) currentPage = 1;

        // Tránh SQL Injection bằng cách kiểm tra cột hợp lệ
        List<String> allowedColumns = Arrays.asList("id", "email", "full_name", "phone", "date_of_birth", "gender", "status", "last_login", "created_at", "updated_at", "avatar");
        if (!allowedColumns.contains(orderBy)) {
            orderBy = "id";
        }

        // Xây dựng câu lệnh SQL
        String sql = "SELECT * FROM user ";
        // Nếu keyword trống, không thêm điều kiện WHERE
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql += "WHERE CONCAT(id, email, full_name, phone, date_of_birth, gender, status, last_login, created_at, updated_at, avatar) LIKE ? ";
        }
        sql += "ORDER BY " + orderBy + " " +
                "LIMIT ? " +
                "OFFSET ?";
        System.out.println(sql);

        Connection conn = DBUtil.getConnection();
        Connection connection = DBUtil.getConnection();
        if(connection == null) return null;
        //logic
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<UserModel> users = new ArrayList<>();
        try {
            ps = conn.prepareStatement(sql);
            // Nếu có từ khóa, gán giá trị cho điều kiện LIKE
            if (keyword != null && !keyword.trim().isEmpty()) {
                ps.setString(1, "%" + keyword + "%");
                ps.setInt(2, pageSize);
                ps.setInt(3, (currentPage - 1) * pageSize);
            } else {
                // Nếu không có từ khóa, bỏ qua phần WHERE
                ps.setInt(1, pageSize);
                ps.setInt(2, (currentPage - 1) * pageSize);
            }
            rs = ps.executeQuery();
            while(rs.next()) {
                users.add(UserModel.builder()
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
                        .build());
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(connection, ps, rs);
        }
        return users;
    }

    public boolean checkEmailExist(String email){
        String sql = "SELECT COUNT(email) FROM user WHERE email = ?";
        Connection connection = DBUtil.getConnection();
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
            DBUtil.close(connection, ps, rs);
        }
        return false;
    }

    @Override
    public Long save(UserModel entity) {
        String sql = "INSERT INTO user (email, full_name, phone, date_of_birth, gender, status, created_at, updated_at, avatar, password, last_login) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        //get connection
        Connection connection = DBUtil.getConnection();
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
            ps.setString(5, entity.getGender() == null ? null : entity.getGender().name().toUpperCase());
            ps.setString(6, entity.getStatus() == null ? UserStatus.NONE.toString() : entity.getStatus().toString().toUpperCase());
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
            DBUtil.close(connection, ps, rs);
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
        Connection connection = DBUtil.getConnection();
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
            DBUtil.close(connection, ps, null);
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
        Connection connection = DBUtil.getConnection();
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
            DBUtil.close(connection, ps, rs);
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
        String sql = "SELECT * FROM user";
        //get connection
        Connection connection = DBUtil.getConnection();
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
            DBUtil.close(connection, ps, resultSet);
        }

        return result;
    }

    /**
     * Lấy số lượng page dựa trên số lượng item cần hiển thị
     * @param numOfItems
     * @return
     */
    public Long getTotalPage(int numOfItems) {
        String query = "SELECT COUNT(*) FROM user";
        Connection connection = DBUtil.getConnection();
        if(connection == null) return null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try{
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            if(rs.next()){
                int totalUser = rs.getInt(1);
                Long countPage = (long) (totalUser / numOfItems);
                if(totalUser % numOfItems != 0){
                    countPage++;
                }
                return countPage;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(connection, ps, rs);
        }
        return null;
    }
}
