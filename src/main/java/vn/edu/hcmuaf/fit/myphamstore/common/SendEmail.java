package vn.edu.hcmuaf.fit.myphamstore.common;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Date;
import java.util.Properties;

public class SendEmail {
    private static final String EMAIL = "hanrepository@gmail.com";
    private static final String PASSWORD = "nfssbtsafpmatbaq";

    public static boolean sendEmail(String to, String otp) {
        String tieuDe = "Email xác nhận tài khoản";
        String noiDung = "<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <style>\n" +
                "        body {\n" +
                "            font-family: Arial, sans-serif;\n" +
                "            background-color: #f4f4f4;\n" +
                "            margin: 0;\n" +
                "            padding: 0;\n" +
                "        }\n" +
                "        .email-container {\n" +
                "            max-width: 600px;\n" +
                "            margin: 20px auto;\n" +
                "            background-color: #ffffff;\n" +
                "            border: 1px solid #ddd;\n" +
                "            border-radius: 8px;\n" +
                "            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);\n" +
                "            overflow: hidden;\n" +
                "        }\n" +
                "        .email-header {\n" +
                "            background-color: #007bff;\n" +
                "            color: #ffffff;\n" +
                "            text-align: center;\n" +
                "            padding: 20px;\n" +
                "        }\n" +
                "        .email-header h1 {\n" +
                "            margin: 0;\n" +
                "            font-size: 24px;\n" +
                "        }\n" +
                "        .email-body {\n" +
                "            padding: 20px;\n" +
                "            color: #333333;\n" +
                "        }\n" +
                "        .email-body p {\n" +
                "            margin: 10px 0;\n" +
                "            line-height: 1.6;\n" +
                "        }\n" +
                "        .email-body a {\n" +
                "            display: inline-block;\n" +
                "            margin-top: 20px;\n" +
                "            padding: 10px 20px;\n" +
                "            background-color: #007bff;\n" +
                "            color: #ffffff;\n" +
                "            text-decoration: none;\n" +
                "            border-radius: 5px;\n" +
                "            font-size: 16px;\n" +
                "        }\n" +
                "        .email-body a:hover {\n" +
                "            background-color: #0056b3;\n" +
                "        }\n" +
                "        .email-footer {\n" +
                "            text-align: center;\n" +
                "            padding: 10px;\n" +
                "            font-size: 12px;\n" +
                "            color: #777;\n" +
                "            border-top: 1px solid #ddd;\n" +
                "            background-color: #f9f9f9;\n" +
                "        }\n" +
                "    </style>\n" +
                "</head>\n" +
                "<body>\n" +
                "    <div class=\"email-container\">\n" +
                "        <!-- Header -->\n" +
                "        <div class=\"email-header\">\n" +
                "            <h1>Kích hoạt tài khoản</h1>\n" +
                "        </div>\n" +
                "\n" +
                "        <!-- Body -->\n" +
                "        <div class=\"email-body\">\n" +
                "            <p>Chào bạn,</p>\n" +
                "            <p>Cảm ơn bạn đã đăng ký tài khoản tại <strong>Website của chúng tôi</strong>.</p>\n" +
                "            <p>Vui lòng nhấn vào nút bên dưới để kích hoạt tài khoản của bạn:</p>\n" +
                "            <a href=\"http://localhost:8080/register?action=verify&register&otp="+otp+"&email="+to+"  \">Kích hoạt tài khoản</a>\n" +
                "            <p>Nếu bạn không thực hiện đăng ký, vui lòng bỏ qua email này.</p>\n" +
                "            <p>Trân trọng,</p>\n" +
                "            <p><strong>Đội ngũ hỗ trợ</strong></p>\n" +
                "        </div>\n" +
                "\n" +
                "        <!-- Footer -->\n" +
                "        <div class=\"email-footer\">\n" +
                "            &copy; 2025 Website của chúng tôi. Tất cả các quyền được bảo lưu.\n" +
                "        </div>\n" +
                "    </div>\n" +
                "</body>\n" +
                "</html>\n";

        // Properties : khai báo các thuộc tính
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
        props.put("mail.smtp.port", "587"); // TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // TODO Auto-generated method stub
                return new PasswordAuthentication(EMAIL, PASSWORD);
            }
        };

        // Phiên làm việc
        Session session = Session.getInstance(props, auth);

        // Tạo một tin nhắn
        MimeMessage msg = new MimeMessage(session);

        try {
            // Kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");

            // Người gửi

            // Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            // Tiêu đề email
            msg.setSubject(tieuDe);

            // Quy đinh ngày gửi
            msg.setSentDate(new Date());

            // Quy định email nhận phản hồi
            // msg.setReplyTo(InternetAddress.parse(from, false))

            // Nội dung
            msg.setContent(noiDung, "text/HTML; charset=UTF-8");

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email thành công");
            return true;
        } catch (Exception e) {
            System.out.println("Gặp lỗi trong quá trình gửi email");
            e.printStackTrace();
            return false;
        }
    }


}
