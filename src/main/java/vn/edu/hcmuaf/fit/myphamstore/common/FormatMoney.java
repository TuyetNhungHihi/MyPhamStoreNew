package vn.edu.hcmuaf.fit.myphamstore.common;

import java.text.NumberFormat;
import java.util.Locale;

public class FormatMoney {
    public static String formatCurrency(Double amount) {
        NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        return formatter.format(amount) + " VNĐ";
    }
    public static String formatCurrency(Integer amount) {
        NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        return formatter.format(amount) + " VNĐ";
    }
    public static String formatCurrency(Long amount) {
        NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));
        return formatter.format(amount) + " VNĐ";
    }

}
