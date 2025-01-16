package vn.edu.hcmuaf.fit.myphamstore.dao;

public interface IOtpDAO {
    void saveOtp(String email, String otp);
    Boolean verifyOtp(String email, String otp);
    String generateOtp();
}
