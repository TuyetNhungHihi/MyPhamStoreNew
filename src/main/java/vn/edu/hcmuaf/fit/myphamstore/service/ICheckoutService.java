package vn.edu.hcmuaf.fit.myphamstore.service;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


public interface ICheckoutService {
    void displayCheckout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    void checkout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

}
