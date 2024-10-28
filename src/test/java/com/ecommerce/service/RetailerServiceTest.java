package com.ecommerce.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.ecommerce.dao.RetailerDAOInterface;
import com.ecommerce.entity.Order;
import com.ecommerce.entity.Product;
import com.ecommerce.entity.RateReview;

public class RetailerServiceTest {

	private RetailerService retailerService;
	private RetailerDAOInterface retailerDAO;

	@Before
	public void setUp() {
		retailerDAO = new RetailerDAOTestImpl();
		retailerService = new RetailerService();
		retailerService.retailerDAO = retailerDAO;
	}

	@Test
	public void testManageInventoryAndProductDetails() {
		List<Product> products = retailerService.manageInventoryAndProductDetails();
		assertNotNull(products);
		assertEquals(2, products.size());
	}

	@Test
	public void testAddProducts() {
		Product product = new Product();
		int result = retailerService.addProducts(product);
		assertEquals(1, result);
	}

	@Test
	public void testDeleteProduct() {
		String productId = "123";
		boolean result = retailerService.deleteProduct(productId);
		assertTrue(result);
	}

	@Test
	public void testUpdateProduct() {
		Product product = new Product();
		boolean result = retailerService.updateProduct(product);
		assertTrue(result);
	}

	@Test
	public void testProductReviewSentByBuyer() {
		List<RateReview> reviews = retailerService.productReviewSentByBuyer();
		assertNotNull(reviews);
		assertEquals(2, reviews.size());
	}

	@Test
	public void testDeleteReview() {
		String reviewId = "456";
		boolean result = retailerService.deleteReview(reviewId);
		assertTrue(result);
	}

	@Test
	public void testGetProductById() {
		String productId = "789";
		Product product = retailerService.getProductById(productId);
		assertNotNull(product);
	}

	@Test
	public void testBuyerplacedOrders() {
		List<Order> orders = retailerService.buyerplacedOrders();
		assertNotNull(orders);
		assertEquals(2, orders.size());
	}

	@Test
	public void testUpdateOrderStatus() {
		int orderNo = 101;
		String orderStatus = "Shipped";
		boolean result = retailerService.updateOrderStatus(orderNo, orderStatus);
		assertTrue(result);
	}

	private class RetailerDAOTestImpl implements RetailerDAOInterface {

		@Override
		public List<Product> manageInventoryAndProductDetailsDAO() {
			List<Product> products = new ArrayList<>();
			products.add(new Product());
			products.add(new Product());
			return products;
		}

		@Override
		public int addProductsDAO(Product product) {
			return 1;
		}

		@Override
		public boolean deleteProductDAO(String productId) {
			return true;
		}

		@Override
		public boolean updateProductDAO(Product product) {
			return true;
		}

		@Override
		public List<RateReview> productReviewSentByBuyerDAO() {
			List<RateReview> reviews = new ArrayList<>();
			reviews.add(new RateReview());
			reviews.add(new RateReview());
			return reviews;
		}

		@Override
		public boolean deleteReviewDAO(String reviewId) {
			return true;
		}

		@Override
		public Product getProductByIdDAO(String productId) {
			return new Product();
		}

		@Override
		public boolean updateOrderStatusDAO(int orderNo, String orderStatus) {
			return true;
		}

		@Override
		public List<Order> buyerplacedOrdersDAO() {
			List<Order> orders = new ArrayList<>();
			orders.add(new Order());
			orders.add(new Order());
			return orders;
		}
	}
}
