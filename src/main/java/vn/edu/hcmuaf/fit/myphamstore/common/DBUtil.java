package vn.edu.hcmuaf.fit.myphamstore.common;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
    private static HikariConfig config = new HikariConfig();
    private static HikariDataSource ds;

    static {
        config.setJdbcUrl(DBConfig.DB_URL);
        config.setUsername(DBConfig.DB_USER);
        config.setPassword(DBConfig.DB_PASSWORD);
        config.addDataSourceProperty("cachePrepStmts", "true");
        config.addDataSourceProperty("prepStmtCacheSize", "250");
        config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
        config.setMaximumPoolSize(100);
        config.setMinimumIdle(10);
        config.setIdleTimeout(30000);
        config.setConnectionTimeout(30000);

        ds = new HikariDataSource(config);
    }
    public static Connection getConnection()  {
        try{
            return ds.getConnection();
        }catch(SQLException e){
            e.printStackTrace();
            return null;
        }
    }
    public static void closePool() {
        if (ds != null && !ds.isClosed()) {
            ds.close();
        }
    }
    public static void close(Connection connection, PreparedStatement ps, ResultSet rs) {
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
