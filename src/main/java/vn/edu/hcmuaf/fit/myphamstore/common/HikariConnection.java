package vn.edu.hcmuaf.fit.myphamstore.common;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class HikariConnection {
    private static HikariConfig config = new HikariConfig();
    private static HikariDataSource ds;


    static {
        config.setJdbcUrl(DBConfig.DB_URL);
        config.setUsername(DBConfig.DB_USER);
        config.setPassword(DBConfig.DB_PASSWORD);
        config.addDataSourceProperty("cachePrepStmts", "true");
        config.addDataSourceProperty("prepStmtCacheSize", "250");
        config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
        config.setDriverClassName(DBConfig.DB_DRIVER);
        config.setMaximumPoolSize(100);
        config.setMinimumIdle(10);
        config.setIdleTimeout(30000);
        config.setConnectionTimeout(30000);

        try {
            Class.forName(DBConfig.DB_DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Không tìm thấy driver JDBC", e);
        }
        ds = new HikariDataSource(config);
    }

    public static HikariDataSource getDataSource() {
        return ds;
    }
}
