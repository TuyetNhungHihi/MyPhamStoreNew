package vn.edu.hcmuaf.fit.myphamstore.exption;

public class DuplicateEmailException extends RuntimeException{
    public DuplicateEmailException(String message) {
        super(message);
    }
}
