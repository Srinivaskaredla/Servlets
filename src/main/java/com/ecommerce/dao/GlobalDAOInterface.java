package com.ecommerce.dao;

import com.ecommerce.entity.User;

public interface GlobalDAOInterface {
    User signInDAO(User user);
    
    boolean registerUser(User user);

	boolean isEmailOrContactExists(String email, long contactNo);
}
