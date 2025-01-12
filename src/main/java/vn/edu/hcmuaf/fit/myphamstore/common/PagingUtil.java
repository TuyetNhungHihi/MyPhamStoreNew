package vn.edu.hcmuaf.fit.myphamstore.common;

import jakarta.servlet.http.HttpServletRequest;

import java.util.Map;

public class PagingUtil {
    public static Map<String, Object> setPaging(HttpServletRequest request) {
        String keyword = request.getParameter("keyword");
        String orderBy = request.getParameter("orderBy");
        Integer currentPage = Integer.parseInt(request.getParameter("currentPage")==null?"1": request.getParameter("currentPage"));
        Integer pageSize = Integer.parseInt(request.getParameter("pageSize") == null?"5": request.getParameter("pageSize"));
        request.setAttribute("keyword", keyword);
        request.setAttribute("orderBy", orderBy);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("pageSize", pageSize);

        return null;
    }
}
