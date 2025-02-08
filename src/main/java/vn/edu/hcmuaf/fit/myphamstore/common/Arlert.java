package vn.edu.hcmuaf.fit.myphamstore.common;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Arlert {
    public static final String TYPE_SUCCESS = "success";
    public static final String TYPE_ERROR = "danger";
    public static final String TYPE_WARNING = "warning";
    public static final String TYPE_INFO = "info";

    private String message;
    private String type;
}
