package com.ecommerce.dao;

import java.util.List;
import com.ecommerce.entity.Order;
import com.ecommerce.entity.Product;
import com.ecommerce.entity.RateReview;

public interface RetailerDAOInterface {
	List<Product> manageInventoryAndProductDetailsDAO();

	int addProductsDAO(Product product);

	boolean deleteProductDAO(String productId);

	boolean updateProductDAO(Product product);
	
	List<RateReview> productReviewSentByBuyerDAO();

	Product getProductByIdDAO(String productId);

	boolean updateOrderStatusDAO(int orderId, String orderStatus);

	List<Order> buyerplacedOrdersDAO();

	boolean deleteReviewDAO(String reviewId);
}
