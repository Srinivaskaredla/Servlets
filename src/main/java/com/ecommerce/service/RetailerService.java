package com.ecommerce.service;

import java.util.List;
import com.ecommerce.dao.RetailerDAOInterface;
import com.ecommerce.entity.Order;
import com.ecommerce.entity.Product;
import com.ecommerce.entity.RateReview;
import com.ecommerce.utility.EcommerceDAOFactory;

public class RetailerService implements RetailerServiceInterface {

	RetailerDAOInterface retailerDAO;

	public RetailerService() {
		this.retailerDAO = EcommerceDAOFactory.createRetailerDAO("retailer");
	}

	@Override
	public List<Product> manageInventoryAndProductDetails() {
		return retailerDAO.manageInventoryAndProductDetailsDAO();
	}

	@Override
	public int addProducts(Product product) {
		return retailerDAO.addProductsDAO(product);
	}

	@Override
	public boolean deleteProduct(String productId) {
		return retailerDAO.deleteProductDAO(productId);
	}

	@Override
	public boolean updateProduct(Product product) {
		return retailerDAO.updateProductDAO(product);
	}

	@Override
	public List<RateReview> productReviewSentByBuyer() {
		return retailerDAO.productReviewSentByBuyerDAO();
	}

	@Override
	public boolean deleteReview(String reviewId) {
		return retailerDAO.deleteReviewDAO(reviewId);
	}
	
	public Product getProductById(String productId) {
		return retailerDAO.getProductByIdDAO(productId);
	}

	public boolean updateOrderStatus(int orderId, String orderStatus) {
		return retailerDAO.updateOrderStatusDAO(orderId, orderStatus);
	}

	@Override
	public List<Order> buyerplacedOrders() {
		return retailerDAO.buyerplacedOrdersDAO();
	}
}
