package vn.hcmuaf.edu.fit.service;

public class UserService {
    private static final Long serialVersionUID = 1l;
    private static UserService instance;

    private UserService() {
    }

    private static UserService getInstance() {
        if (instance == null) {
            instance = new UserService();
        }
        return instance;
    }

}
