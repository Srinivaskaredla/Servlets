package com.ecommerce.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecommerce.entity.Cart;
import com.ecommerce.entity.Order;
import com.ecommerce.entity.Product;
import com.ecommerce.service.BuyerService;

public class BuyerServlet extends HttpServlet {
	private BuyerService buyerService;

	@Override
	public void init() throws ServletException {
		super.init();
		buyerService = new BuyerService();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String taskType = request.getParameter("taskType");

		response.setContentType("text/html");

		if (taskType == null) {
			showError(request, response, "Unknown task type.");
			return;
		}

		try {
			switch (taskType) {
			case "viewAllProducts":
				viewAllProducts(request, response);
				break;
			case "viewProductDetails":
				viewProductDetails(request, response);
				break;
			case "browseProductsByCategory":
				browseProductsByCategory(request, response);
				break;
			case "viewCart":
				viewCart(request, response);
				break;
			case "addProductToCart":
				addProductToCart(request, response);
				break;
			case "removeProductFromCart":
				removeProductFromCart(request, response);
				break;
			case "rateAndReview":
				rateAndReviewProduct(request, response);
				break;
			case "createOrder":
				createOrder(request, response);
				break;
			case "viewOrders":
				viewOrders(request, response);
				break;
			default:
				showError(request, response, "Unknown task type.");
			}
		} catch (Exception e) {
			showError(request, response, "An error occurred: " + e.getMessage());
		}
	}

	private void viewAllProducts(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Product> products = buyerService.viewAllProducts();

		if (products != null && !products.isEmpty()) {
			request.setAttribute("products", products);
			request.getRequestDispatcher("viewAllProducts.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMessage", "No products available.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	private void browseProductsByCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String category = request.getParameter("category");
		List<Product> products = buyerService.browseProductsByCategory(category);

		if (products != null && !products.isEmpty()) {
			request.setAttribute("products", products);
			request.getRequestDispatcher("viewProductsByCategory.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMessage", "No products found in this category.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	private void viewProductDetails(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productId = request.getParameter("productId");
		if (productId == null || productId.isEmpty()) {
			response.sendRedirect("products.jsp");
			return;
		}

		Product product = buyerService.viewProductDetails(productId);

		if (product != null) {
			request.setAttribute("product", product);
			request.getRequestDispatcher("product_details.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMessage", "Product not found.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	private void rateAndReviewProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productId = request.getParameter("productId");
		String ratingStr = request.getParameter("rating");
		String review = request.getParameter("review");

		if (productId == null || ratingStr == null || review == null) {
			request.setAttribute("errorMessage", "Missing parameters.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}

		int rating;
		try {
			rating = Integer.parseInt(ratingStr);
		} catch (NumberFormatException e) {
			request.setAttribute("errorMessage", "Invalid rating value.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}

		boolean isSuccess = buyerService.rateAndReviewProducts(productId, rating, review);

		if (isSuccess) {
			request.setAttribute("successMessage", "Review successfully submitted.");
		} else {
			request.setAttribute("errorMessage", "Failed to submit review.");
		}
		request.getRequestDispatcher("product_details.jsp").forward(request, response);
	}

	private void viewCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		List<Cart> cartItems = buyerService.viewCart(email);

		if (cartItems != null && !cartItems.isEmpty()) {
			request.setAttribute("cartItems", cartItems);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMessage", "Your cart is empty.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	private void addProductToCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("email") == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		String productId = request.getParameter("productId");
		String quantityStr = request.getParameter("quantity");
		String email = session.getAttribute("email").toString();

		int quantity = Integer.parseInt(quantityStr);

		BuyerService buyerService = new BuyerService();
		boolean isSuccess = buyerService.addProductToCart(email, productId, quantity);

		if (isSuccess) {
			response.sendRedirect("cart.jsp");
		} else {
			response.sendRedirect("error.jsp");
		}
	}

	private void removeProductFromCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String productId = request.getParameter("productId");
		int cartId = Integer.parseInt(request.getParameter("cartId"));

		buyerService.removeProductFromCart(email, productId, cartId);

		request.setAttribute("successMessage", "Product removed from cart successfully.");
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

	private void createOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String productId = request.getParameter("productId");
		int quantity;

		System.out.println("Received email: " + email);
		System.out.println("Received productId: " + productId);
		System.out.println("Received quantity: " + request.getParameter("quantity"));

		try {
			quantity = Integer.parseInt(request.getParameter("quantity"));
		} catch (NumberFormatException e) {
			System.out.println("Invalid quantity input.");
			request.setAttribute("errorMessage", "Invalid quantity.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}

		if (email == null || email.isEmpty() || productId == null || productId.isEmpty() || quantity <= 0) {
			System.out.println("Invalid input: email, productId, or quantity is missing or incorrect.");
			request.setAttribute("errorMessage", "Invalid input. Please provide email, product ID, and quantity.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}

		try {
			System.out.println("Attempting to create an order...");
			Order order = buyerService.createOrder(email, productId, quantity);

			if (order != null) {
				System.out.println("Order created successfully: " + order);
				request.setAttribute("order", order);
				request.setAttribute("message", "Order created successfully.");
				response.sendRedirect("ConfirmationPage.jsp");
			} else {
				System.out.println("Failed to create order.");
				request.setAttribute("errorMessage", "Failed to create order.");
				request.getRequestDispatcher("cart.jsp").forward(request, response);
			}
		} catch (Exception e) {
			System.out.println("Error occurred while creating the order:");
			e.printStackTrace();
			request.setAttribute("errorMessage", "An error occurred while creating the order.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	private void viewOrders(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		List<Order> orders = buyerService.viewOrders(email);

		if (orders != null && !orders.isEmpty()) {
			request.setAttribute("orders", orders);
			request.getRequestDispatcher("order_history.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMessage", "No orders found.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	private void showError(HttpServletRequest request, HttpServletResponse response, String errorMessage)
			throws ServletException, IOException {
		request.setAttribute("errorMessage", errorMessage);
		request.getRequestDispatcher("error.jsp").forward(request, response);
	}
}
