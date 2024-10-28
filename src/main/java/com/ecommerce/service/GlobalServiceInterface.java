package com.ecommerce.service;

import com.ecommerce.entity.User;

public interface GlobalServiceInterface {
    User signinService(User user);
    boolean isEmailOrContactExists(String email, long contactNo);
    boolean registerUser(User user);
}
