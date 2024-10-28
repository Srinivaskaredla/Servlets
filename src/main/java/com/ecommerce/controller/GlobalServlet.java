package com.ecommerce.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.entity.User;
import com.ecommerce.service.GlobalServiceInterface;
import com.ecommerce.utility.EcommerceServiceFactory;

public class GlobalServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("taskType");

		if ("login".equals(action)) {
			handleLogin(request, response);
		} else if ("register".equals(action)) {
			handleRegistration(request, response);
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("taskType");

		if ("logout".equalsIgnoreCase(action)) {
			handleLogout(request, response);
		}
	}

	private void handleLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("pass");

		if ("admin1@gmail.com".equals(email) && "admin1".equals(password)) {
			HttpSession adminSession = request.getSession(true);
			adminSession.setAttribute("email", email);
			response.sendRedirect(request.getContextPath() + "/adminHomePage.jsp");
			return;
		}

		User user = new User();
		user.setEmail(email);
		user.setPassword(password);

		GlobalServiceInterface gService = EcommerceServiceFactory.createGlobalService("global");
		User authenticatedUser = gService.signinService(user);

		if (authenticatedUser != null) {
			if (authenticatedUser.isBlocked()) {
				request.setAttribute("errorMessage", "Your account has been blocked. Please contact support.");
				RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
				return;
			}

			HttpSession userSession = request.getSession(true);
			userSession.setAttribute("email", authenticatedUser.getEmail());

			String userType = authenticatedUser.getUserType();
			if ("retailer".equals(userType)) {
				response.sendRedirect(request.getContextPath() + "/retailerHomepage.jsp");
			} else if ("buyer".equalsIgnoreCase(userType)) {
				response.sendRedirect(request.getContextPath() + "/buyerHomepage.jsp");
			} else {
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			}
		} else {
			request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
		}
	}

	private void handleRegistration(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String ageStr = request.getParameter("age");
		String contactNoStr = request.getParameter("contactNo");
		String city = request.getParameter("city");
		String userType = request.getParameter("userType");

		int age = Integer.parseInt(ageStr);
		long contactNo = Long.parseLong(contactNoStr);

		GlobalServiceInterface gService = EcommerceServiceFactory.createGlobalService("global");

		if (gService.isEmailOrContactExists(email, contactNo)) {
			request.setAttribute("errorMessage", "Email or Contact Number already exists.");
			RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
			rd.forward(request, response);
			return;
		}

		if (age <= 15) {
			request.setAttribute("errorMessage", "Age must be greater than 14.");
			RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
			rd.forward(request, response);
			return;
		}

		User newUser = new User();
		newUser.setName(name);
		newUser.setEmail(email);
		newUser.setPassword(password);
		newUser.setAge(age);
		newUser.setContactNo(contactNo);
		newUser.setCity(city);
		newUser.setUserType(userType);

		boolean success = gService.registerUser(newUser);

		if (success) {
			response.sendRedirect(request.getContextPath() + "/login.html");
		} else {
			request.setAttribute("errorMessage", "Registration failed. Please try again.");
			RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
			rd.forward(request, response);
		}
	}

	private void handleLogout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession existingSession = request.getSession(false);
		if (existingSession != null) {
			existingSession.invalidate();
		}

		response.sendRedirect(request.getContextPath() + "/login.html");
	}
}
