package vn.edu.hcmuaf.fit.myphamstore.service;

import vn.edu.hcmuaf.fit.myphamstore.model.SlideModel;

import java.util.List;

public interface ISildeService {
    SlideModel findSlideById(Long id);
    List<SlideModel> pagingSlide(String keyword,int currentPage, int pageSize, String orderBy);
    Long getTotalPage(int numOfItem);
}
