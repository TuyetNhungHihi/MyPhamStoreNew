package vn.edu.hcmuaf.fit.myphamstore.service;

import vn.edu.hcmuaf.fit.myphamstore.model.SlideModel;

import java.util.List;

public interface ISlideService {
    SlideModel findSlideById(Long id);
    List<SlideModel> pagingSlide(String keyword,int currentPage, int pageSize, String orderBy);
    Long getTotalPage(int numOfItem);
    void save(SlideModel slideModel);
    void delete(SlideModel id);
    List<SlideModel> findAll();

    void deleteAll();
}
