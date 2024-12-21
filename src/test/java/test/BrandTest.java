package test;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.myphamstore.dao.BrandDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.BrandModel;

import static org.junit.jupiter.api.Assertions.*;
public class BrandTest {
    private static BrandDAO brandDAO;

    @BeforeAll
    static void setUp() {
        brandDAO = new BrandDAO();
    }

    @Test
    void getBrandById() {
        BrandModel brandModel = brandDAO.findById(2L);
        System.out.println(brandModel);
        assertNotNull(brandModel);
    }
    @Test
    void notFoundBrand() {
        BrandModel brandModel = brandDAO.findById(1000000L);
        assertNull(brandModel);
    }
}
