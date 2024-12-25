package test;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import vn.edu.hcmuaf.fit.myphamstore.dao.AddressDAO;
import vn.edu.hcmuaf.fit.myphamstore.model.AddressModel;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class AddressTest {
    private static AddressDAO addressDAO;

    @BeforeAll
    static void setUp() {
        addressDAO = new AddressDAO();
    }

    @Test
    void listAddressByUserId(){
        List<AddressModel> listAddress = addressDAO.getAddressesByUserId(2L);
        listAddress.forEach(System.out::println);
        assertTrue(listAddress.size() > 0);
    }
}