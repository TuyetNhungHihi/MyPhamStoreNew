package vn.edu.hcmuaf.fit.myphamstore.common;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordUtils {
    private static final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    public static String hashPassword(String plainPassword) {
        return encoder.encode(plainPassword);
    }

    public static boolean verifyPassword(String plainPassword, String hashedPassword) {
        return encoder.matches(plainPassword, hashedPassword);
    }

    public static void main(String[] args) {
        String password ="Hihi123@";
        System.out.println(verifyPassword(password, "$2a$10$u9k9rv6n5nVecd1krjoAPOYtW6GpZZvLiDkgROr84Dgu9isCggutK"));
        System.out.println(verifyPassword(password, "$2a$10$rfbWZw992J1UYM5MNoe7..ZbNeQx84/vshXadzHQ.ggt4LEP4kAnG"));

    }

}
