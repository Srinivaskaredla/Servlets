package com.ecommerce.service;

import java.util.List;

import com.ecommerce.dao.AdminDAO; // Import if needed
import com.ecommerce.dao.AdminDAOInterface;
import com.ecommerce.entity.User;

public class AdminService implements AdminServiceInterface {
    private AdminDAOInterface adminDAO;

    public AdminService() {
        adminDAO = new AdminDAO();
    }

    @Override
    public List<User> viewAllUsers() {
        return adminDAO.getAllUsers();
    }

    @Override
    public List<User> viewAllRetailers() {
        return adminDAO.getAllRetailers();
    }

    @Override
    public List<User> viewAllBuyers() {
        return adminDAO.getAllBuyers(); 
    }

    public boolean blockUser(String email) {
        return adminDAO.updateUserStatus(email, true);
    }

    public boolean unblockUser(String email) {
        return adminDAO.updateUserStatus(email, false);
    }

    @Override
    public boolean deleteUser(String email) {
        return adminDAO.deleteUserByEmail(email);
    }
}
