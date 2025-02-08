package vn.edu.hcmuaf.fit.myphamstore.dao;

import vn.edu.hcmuaf.fit.myphamstore.model.SlideModel;

import java.util.List;

public interface ISlideDAO extends GenericDAO<SlideModel> {
    public SlideModel findSlideById(Long id);
    List<SlideModel> findAll();

    void deleteAll();
}