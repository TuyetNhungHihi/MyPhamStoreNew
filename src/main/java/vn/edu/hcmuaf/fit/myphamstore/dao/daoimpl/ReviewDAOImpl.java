package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import vn.edu.hcmuaf.fit.myphamstore.dao.IReviewDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.ReviewModel;

import java.util.List;

public class ReviewDAOImpl implements IReviewDAO {
    @Override
    public ReviewModel findReviewById(Long id) {
        return null;
    }

    @Override
    public ReviewModel getReviewDetail(Long id) {
        return null;
    }

    @Override
    public List<ReviewModel> getAllReviews() {
        return List.of();
    }

    @Override
    public Long save(ReviewModel entity) {
        return 0L;
    }

    @Override
    public ReviewModel update(ReviewModel entity) {
        return null;
    }

    @Override
    public void delete(ReviewModel entity) {

    }

    @Override
    public List<ReviewModel> findAll(String keyword, int currentPage, int pageSize, String orderBy) {
        return List.of();
    }

    @Override
    public Long getTotalPage(int numOfItems) {
        return 0L;
    }
}
