package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.Order;
import com.ecommerce.entity.Product;
import com.ecommerce.entity.RateReview;

public interface RetailerServiceInterface {
	List<Product> manageInventoryAndProductDetails();
	
    int addProducts(Product product);
    
    boolean deleteProduct(String productId);

    boolean updateProduct(Product product);

    List<Order> buyerplacedOrders();

    List<RateReview> productReviewSentByBuyer();

    boolean deleteReview(String reviewId);
    
    Product getProductById(String productId);
    
    boolean updateOrderStatus(int orderId, String orderStatus);
}
