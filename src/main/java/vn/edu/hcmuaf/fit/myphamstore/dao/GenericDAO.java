package vn.edu.hcmuaf.fit.myphamstore.dao;

import java.sql.*;
import java.util.List;

public abstract class GenericDAO <T>{
    //CRUD (Create, Read, Update, Delete)
    abstract public Long save(T entity);
    abstract public T update(T entity);
    abstract public void delete(T entity);
    abstract public T findById(Long id);
    abstract public long count();
    abstract public List<T> findAll();
    protected  Connection getConnection() {
        String url = "jdbc:mysql://localhost:3306/myphamstoredb";
        String user = "root";
        String password = "admin";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    protected void close(Connection connection, PreparedStatement ps, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
