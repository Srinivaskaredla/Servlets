package com.ecommerce.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.ecommerce.entity.Order;
import com.ecommerce.entity.Product;
import com.ecommerce.entity.RateReview;
import com.ecommerce.service.RetailerService;

@MultipartConfig
public class RetailerServlet extends HttpServlet {
	private RetailerService retailerService;
	private static final String UPLOAD_DIR = "C:/Users/akash_vfj/eclipse-workspace3/E_Commerce_Project1/src/main/webapp/uploads";

	@Override
	public void init() throws ServletException {
		super.init();
		retailerService = new RetailerService();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String taskType = request.getParameter("taskType");
		response.setContentType("text/html");

		if (taskType == null) {
			showError(response.getWriter(), "Unknown task type.");
			return;
		}

		try {
			switch (taskType) {
			case "viewAllProducts":
				viewAllProducts(request, response);
				break;
			case "addProduct":
				showAddProductForm(request, response);
				break;
			case "deleteProduct":
				deleteProduct(request, response);
				break;
			case "updateProduct":
				updateProduct(request, response);
				break;
			case "viewBuyerOrders":
				viewBuyerOrders(request, response);
				break;
			case "viewProductReviews":
				viewProductReviews(request, response);
				break;
			case "deleteReview":
				deleteReview(request, response);
				break;
			default:
				showError(response.getWriter(), "Unknown task type.");
			}
		} catch (Exception e) {
			showError(response.getWriter(), "An error occurred: " + e.getMessage());
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String taskType = request.getParameter("taskType");

		try {
			switch (taskType) {
			case "addProduct":
				addProduct(request, response);
				break;
			case "updateProduct":
				updateProductDetails(request, response);
				break;
			case "updateOrderStatus":
				updateOrderStatus(request, response);
				break;
			default:
				showError(response.getWriter(), "Unknown task type.");
			}
		} catch (Exception e) {
			showError(response.getWriter(), "An error occurred: " + e.getMessage());
		}
	}

	private void viewAllProducts(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Product> products = retailerService.manageInventoryAndProductDetails();
		request.setAttribute("products", products);
		request.getRequestDispatcher("/allProducts.jsp").forward(request, response);
	}

	private void showAddProductForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/addProducts.jsp").forward(request, response);
	}

	private void addProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productId = request.getParameter("productId");
		String productName = request.getParameter("productName");
		String description = request.getParameter("description");
		double price = Double.parseDouble(request.getParameter("price"));
		int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
		String category = request.getParameter("category");
		Part filePart = request.getPart("image");

		String imagePath = uploadFile(filePart);

		Product product = new Product(productId, productName, description, price, stockQuantity, category, imagePath);
		int result = retailerService.addProducts(product);

		if (result > 0) {
			response.sendRedirect(request.getContextPath() + "/addProducts.jsp?success=true");
		} else {
			response.sendRedirect(request.getContextPath() + "/addProducts.jsp?success=false");
		}
	}

	private void updateProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productId = request.getParameter("productId");
		Product product = retailerService.getProductById(productId);

		if (product != null) {
			request.setAttribute("product", product);
			request.getRequestDispatcher("/updateProducts.jsp").forward(request, response);
		} else {
			showError(response.getWriter(), "Product not found.");
		}
	}

	private void updateProductDetails(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productId = request.getParameter("productId");
		String productName = request.getParameter("productName");
		String description = request.getParameter("description");
		double price = Double.parseDouble(request.getParameter("price"));
		int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));
		String category = request.getParameter("category");
		Part filePart = request.getPart("productImage");

		Product product = retailerService.getProductById(productId);
		if (product != null) {
			product.setProductName(productName);
			product.setDescription(description);
			product.setPrice(price);
			product.setStockQuantity(stockQuantity);
			product.setCategory(category);

			if (filePart != null && filePart.getSize() > 0) {
				String imagePath = uploadFile(filePart);
				product.setImagePath(imagePath);
			}

			retailerService.updateProduct(product);
			response.sendRedirect(request.getContextPath() + "/RetailerServlet?taskType=viewAllProducts");
		} else {
			showError(response.getWriter(), "Product not found.");
		}
	}

	private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productId = request.getParameter("productId");

		if (retailerService.deleteProduct(productId)) {
			response.sendRedirect(request.getContextPath() + "/RetailerServlet?taskType=viewAllProducts");
		} else {
			showError(response.getWriter(), "Failed to delete product.");
		}
	}

	private void viewProductReviews(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<RateReview> reviews = retailerService.productReviewSentByBuyer();
		request.setAttribute("reviews", reviews);
		request.getRequestDispatcher("/viewProductReviews.jsp").forward(request, response);
	}

	private void deleteReview(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String reviewId = request.getParameter("reviewId");

		if (retailerService.deleteReview(reviewId)) {
			response.sendRedirect(request.getContextPath() + "/RetailerServlet?taskType=viewProductReviews");
		} else {
			showError(response.getWriter(), "Failed to delete review.");
		}
	}

	private void viewBuyerOrders(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Order> orders = retailerService.buyerplacedOrders();
		request.setAttribute("orders", orders);
		request.getRequestDispatcher("/viewBuyerOrders.jsp").forward(request, response);
	}

	private void updateOrderStatus(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int orderNo = Integer.parseInt(request.getParameter("orderNo"));
			String newStatus = request.getParameter("status");

			if (retailerService.updateOrderStatus(orderNo, newStatus)) {
				response.sendRedirect(request.getContextPath() + "/RetailerServlet?taskType=viewBuyerOrders");
			} else {
				showError(response.getWriter(), "Failed to update order status.");
			}
		} catch (NumberFormatException e) {
			showError(response.getWriter(), "Invalid order number.");
		} catch (Exception e) {
			showError(response.getWriter(), "An error occurred while updating the order status.");
		}
	}

	private String uploadFile(Part filePart) throws IOException {
		String fileName = filePart.getSubmittedFileName();
		String filePath = UPLOAD_DIR + File.separator + fileName;

		File file = new File(filePath);
		filePart.write(file.getAbsolutePath());

		return "uploads/" + fileName;
	}

	private void showError(PrintWriter out, String message) {
		out.println("<p style='color: red;'>" + message + "</p>");
	}
}
