package vn.edu.hcmuaf.fit.myphamstore.dao;


import vn.edu.hcmuaf.fit.myphamstore.model.ReviewModel;

import java.util.List;

public interface IReviewDAO extends GenericDAO<ReviewModel> {
    ReviewModel findReviewById(Long id);
    ReviewModel getReviewDetail(Long id);

    List<ReviewModel> getAllReviewsByProductId();

}
