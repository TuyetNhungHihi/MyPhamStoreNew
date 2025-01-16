package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import jakarta.enterprise.context.ApplicationScoped;
import vn.edu.hcmuaf.fit.myphamstore.common.JDBIConnector;
import vn.edu.hcmuaf.fit.myphamstore.dao.IOtpDAO;

import java.time.LocalDateTime;

@ApplicationScoped
public class OtpDAOImpl implements IOtpDAO {
    @Override
    public void saveOtp(String email, String otp) {
        String sql = "INSERT INTO otp (email, otp, time_expire) VALUES (?, ?, ?)";
        try{
            JDBIConnector.getJdbi().useHandle(handle -> {
                handle.createUpdate(sql)
                        .bind(0, email)
                        .bind(1, otp)
                        .bind(2, LocalDateTime.now().plusMinutes(15))
                        .execute();
            });
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public Boolean verifyOtp(String email, String otp) {
        String sql = "SELECT * FROM otp WHERE email = ? AND otp = ?";
        try {
            return JDBIConnector.getJdbi().withHandle(handle -> {
                return handle.createQuery(sql)
                        .bind(0, email)
                        .bind(1, otp)
                        .mapTo(Boolean.class)
                        .findFirst()
                        .orElse(false);
            });
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public String generateOtp() {
        //tao ra chuoi ngau nhien 6 ky tu
        String otp = "";
        for (int i = 0; i < 6; i++) {
            otp += (int) (Math.random() * 10);
        }
        return otp;
    }
}
