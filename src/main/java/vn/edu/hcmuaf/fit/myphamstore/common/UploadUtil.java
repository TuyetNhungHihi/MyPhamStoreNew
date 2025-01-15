package vn.edu.hcmuaf.fit.myphamstore.common;

import jakarta.servlet.http.Part;

public class UploadUtil {
    public static String getFileName(Part part){
        String contentDisp = part.getHeader("content-disposition");

        if(!contentDisp.contains("filename")){
            return null;
        }
        int beginIndex = contentDisp.indexOf("filename=") + 10;
        int endIndex = contentDisp.length() - 1;

        return contentDisp.substring(beginIndex, endIndex);
    }
}
