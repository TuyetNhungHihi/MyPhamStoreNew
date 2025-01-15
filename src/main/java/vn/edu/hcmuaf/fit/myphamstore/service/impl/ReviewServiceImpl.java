package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.inject.Inject;
import vn.edu.hcmuaf.fit.myphamstore.dao.IReviewDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.ReviewModel;
import vn.edu.hcmuaf.fit.myphamstore.service.IReviewService;

import java.util.List;

public class ReviewServiceImpl implements IReviewService {
    @Inject
    private IReviewDAO reviewDAO;

    @Override
    public ReviewModel findReviewById(Long id) {
        return reviewDAO.findReviewById(id);
    }

    @Override
    public ReviewModel getReviewDetail(Long id) {
        return reviewDAO.getReviewDetail(id);
    }

    @Override
    public List<ReviewModel> getAllReviewsByProductId(Long id) {
        return reviewDAO.getAllReviewsByProductId(id);
    }

    @Override
    public List<ReviewModel> pagingReview(String keyword, int currentPage, int pageSize, String orderBy) {
        return reviewDAO.findAll(keyword, currentPage, pageSize, orderBy);
    }
}
