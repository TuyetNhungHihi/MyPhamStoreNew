package vn.edu.hcmuaf.fit.myphamstore.common;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.myphamstore.model.UserModel;

public class JDBIConnector {
    private static Jdbi jdbi;

    static {
        jdbi = Jdbi.create(HikariConnection.getDataSource());
    }
    public static Jdbi getJdbi() {
        return jdbi;
    }



}
