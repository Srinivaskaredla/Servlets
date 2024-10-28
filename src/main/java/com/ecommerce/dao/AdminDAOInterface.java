package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.User;

public interface AdminDAOInterface {
    List<User> getAllUsers();
    List<User> getAllRetailers();
    List<User> getAllBuyers();
    boolean updateUserStatus(String email, boolean block);
    boolean deleteUserByEmail(String email);
}
