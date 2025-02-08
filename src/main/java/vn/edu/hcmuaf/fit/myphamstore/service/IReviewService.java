package vn.edu.hcmuaf.fit.myphamstore.service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.myphamstore.model.ReviewModel;

import java.io.IOException;
import java.util.List;

public interface IReviewService {
    ReviewModel findReviewById(Long id);
    ReviewModel getReviewDetail(Long id);
    List<ReviewModel> getAllReviewsByProductId(Long id);
    List<ReviewModel> pagingReview(String keyword, int currentPage, int pageSize, String orderBy);

    void addReview(HttpServletRequest req, HttpServletResponse resp) throws IOException;
}
