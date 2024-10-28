package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.User;

public interface AdminServiceInterface {
    List<User> viewAllUsers();
    List<User> viewAllRetailers();
    List<User> viewAllBuyers();
    boolean blockUser(String email);
    boolean unblockUser(String email);
    boolean deleteUser(String email);
}
