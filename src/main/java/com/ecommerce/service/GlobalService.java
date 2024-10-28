package com.ecommerce.service;

import com.ecommerce.dao.GlobalDAOInterface;
import com.ecommerce.entity.User;
import com.ecommerce.utility.EcommerceDAOFactory;

public class GlobalService implements GlobalServiceInterface {

	@Override
	public User signinService(User user) {
		GlobalDAOInterface gDao = EcommerceDAOFactory.createGlobalDAO("global");
		return gDao.signInDAO(user);
	}

	@Override
	public boolean isEmailOrContactExists(String email, long contactNo) {
		GlobalDAOInterface gDao = EcommerceDAOFactory.createGlobalDAO("global");
		return gDao.isEmailOrContactExists(email, contactNo);
	}

	@Override
	public boolean registerUser(User user) {
		GlobalDAOInterface gDao = EcommerceDAOFactory.createGlobalDAO("global");
		return gDao.registerUser(user);
	}
}
