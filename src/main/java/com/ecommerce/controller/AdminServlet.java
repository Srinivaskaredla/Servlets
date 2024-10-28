package com.ecommerce.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecommerce.entity.User;
import com.ecommerce.service.AdminService;

public class AdminServlet extends HttpServlet {
	private AdminService adminService;

	@Override
	public void init() throws ServletException {
		super.init();
		adminService = new AdminService();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String taskType = request.getParameter("taskType");

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		if (taskType == null) {
			showError(out, "Unknown task type.");
			return;
		}

		try {
			switch (taskType) {
			case "viewAllUsers":
				viewAllUsers(out);
				break;
			case "viewAllRetailers":
				viewAllRetailers(out);
				break;
			case "viewAllBuyers":
				viewAllBuyers(out);
				break;
			case "blockUser":
				blockUser(request, out);
				break;
			case "unblockUser":
				unblockUser(request, out);
				break;
			case "deleteUser":
				deleteUser(request, out);
				break;
			default:
				showError(out, "Unknown task type.");
			}
		} catch (Exception e) {
			showError(out, "An error occurred: " + e.getMessage());
		}
	}

	private void renderUserList(List<User> users, String title, PrintWriter out) {
		out.println("<html><head><title>" + title + "</title><style>"
				+ "table, th, td { border: 1px solid black; padding: 5px; border-collapse: collapse; }"
				+ "</style></head><body>");
		out.println("<h1>" + title + "</h1>");
		out.println("<table><tr><th>Name</th><th>Email</th><th>Contact Number</th><th>City</th></tr>");
		for (User u : users) {
			out.println("<tr><td>" + u.getName() + "</td><td>" + u.getEmail() + "</td><td>" + u.getContactNo()
					+ "</td><td>" + u.getCity() + "</td></tr>");
		}
		out.println("</table>");
		out.println("<a href='adminHomePage.jsp'>Back to Admin Dashboard</a>");
		out.println("</body></html>");
	}

	private void viewAllUsers(PrintWriter out) {
		List<User> users = adminService.viewAllUsers();
		renderUserList(users, "List of Users", out);
	}

	private void viewAllRetailers(PrintWriter out) {
		List<User> retailers = adminService.viewAllRetailers();
		renderUserList(retailers, "List of Retailers", out);
	}

	private void viewAllBuyers(PrintWriter out) {
		List<User> buyers = adminService.viewAllBuyers();
		renderUserList(buyers, "List of Buyers", out);
	}

	private void blockUser(HttpServletRequest request, PrintWriter out) {
		String email = request.getParameter("email");
		boolean result = adminService.blockUser(email);
		displayResult(out, "Block User", result, "User with email " + email + " has been blocked successfully.",
				"Failed to block user with email " + email + ".");
	}

	private void unblockUser(HttpServletRequest request, PrintWriter out) {
		String email = request.getParameter("email");
		boolean result = adminService.unblockUser(email);
		displayResult(out, "Unblock User", result, "User with email " + email + " has been unblocked successfully.",
				"Failed to unblock user with email " + email + ".");
	}

	private void deleteUser(HttpServletRequest request, PrintWriter out) {
		String email = request.getParameter("email");
		boolean result = adminService.deleteUser(email);
		displayResult(out, "Delete User", result, "User with email " + email + " has been deleted successfully.",
				"Failed to delete user with email " + email + ".");
	}

	private void displayResult(PrintWriter out, String action, boolean result, String successMessage,
			String failureMessage) {
		out.println("<html><head><title>" + action + " Result</title></head><body>");
		if (result) {
			out.println("<h1>" + action + " Successful</h1>");
			out.println("<p>" + successMessage + "</p>");
		} else {
			out.println("<h1>" + action + " Failed</h1>");
			out.println("<p>" + failureMessage + "</p>");
		}
		out.println("<a href='adminHomePage.jsp'>Back to Admin Dashboard</a>");
		out.println("</body></html>");
	}

	private void showError(PrintWriter out, String message) {
		out.println("<html><head><title>Error</title></head><body>");
		out.println("<h1>Error</h1>");
		out.println("<p>" + message + "</p>");
		out.println("<a href='adminHomePage.jsp'>Back to Admin Dashboard</a>");
		out.println("</body></html>");
	}
}
