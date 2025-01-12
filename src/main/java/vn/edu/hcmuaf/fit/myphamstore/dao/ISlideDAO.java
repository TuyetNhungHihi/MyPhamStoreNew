package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.SlideModel;

public interface ISlideDAO extends GenericDAO<SlideModel> {
    public SlideModel findSlideById(Long id);
}