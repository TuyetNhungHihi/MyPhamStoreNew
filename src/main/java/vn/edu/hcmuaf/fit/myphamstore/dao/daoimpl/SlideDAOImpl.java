package vn.edu.hcmuaf.fit.myphamstore.dao.daoimpl;

import vn.edu.hcmuaf.fit.myphamstore.common.JDBIConnector;
import vn.edu.hcmuaf.fit.myphamstore.dao.ISlideDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.SlideModel;

import java.time.LocalDateTime;
import java.util.List;

public class SlideDAOImpl implements ISlideDAO {

    @Override
    public SlideModel findSlideById(Long id) {
        return null;
    }

    @Override
    public Long save(SlideModel entity) {
        String sql = "INSERT INTO slide ( image,url, created_at, updated_at) " +
                "VALUES ( :image, :url, :createdAt, :updatedAt)";
        try {
            return JDBIConnector.getJdbi().withHandle(handle -> {
                // Thực hiện câu lệnh INSERT và lấy id tự động sinh
                return handle.createUpdate(sql)
                        .bind("image", entity.getImage().trim())
                        .bind("url", entity.getUrl().trim())
                        .bind("createdAt", LocalDateTime.now())
                        .bind("updatedAt", LocalDateTime.now())
                        .executeAndReturnGeneratedKeys("id") // Lấy giá trị khóa chính tự động sinh
                        .mapTo(Long.class) // Ánh xạ giá trị trả về thành Long
                        .one();
            });
        }
        catch (Exception e) {
            e.printStackTrace();
            return null;}
    }

    @Override
    public SlideModel update(SlideModel entity) {
        return null;
    }

    @Override
    public void delete(SlideModel entity) {

    }

    @Override
    public List<SlideModel> findAll(String keyword, int currentPage, int pageSize, String orderBy) {
        return List.of();
    }

    @Override
    public Long getTotalPage(int numOfItems) {
        return 0L;
    }
}