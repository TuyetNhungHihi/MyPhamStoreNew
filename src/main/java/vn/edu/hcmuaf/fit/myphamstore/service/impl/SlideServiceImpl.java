package vn.edu.hcmuaf.fit.myphamstore.service.impl;

import jakarta.inject.Inject;
import vn.edu.hcmuaf.fit.myphamstore.dao.ISlideDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.SlideModel;
import vn.edu.hcmuaf.fit.myphamstore.service.ISildeService;

import java.util.List;

public class SlideServiceImpl implements ISildeService {
    @Inject
    private ISlideDAO slideDAO;
    @Override
    public SlideModel findSlideById(Long id) {
        return slideDAO.findSlideById(id);
    }

    @Override
    public List<SlideModel> pagingSlide(String keyword, int currentPage, int pageSize, String orderBy) {
        return List.of();
    }

    @Override
    public Long getTotalPage(int numOfItem) {
        return slideDAO.getTotalPage(numOfItem);
    }
}
