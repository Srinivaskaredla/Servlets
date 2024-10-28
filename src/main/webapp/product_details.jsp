<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ecommerce.entity.Product"%>
<%@ page import="com.ecommerce.service.BuyerService"%>
<%@ page import="com.ecommerce.entity.RateReview"%>
<%@ page import="com.ecommerce.entity.Cart"%>
<%
String productId = request.getParameter("productId");
if (productId == null || productId.isEmpty()) {
	response.sendRedirect("products.jsp");
	return;
}

BuyerService buyerService = new BuyerService();
Product product = buyerService.viewProductDetails(productId);
%>

<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title><%=product.getProductName()%> | Product Details</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/flaticon.css">
<link rel="stylesheet" href="assets/css/slicknav.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
	<header>
		<div class="header-area">
			<div class="main-header header-sticky">
				<div class="container-fluid">
					<div class="menu-wrapper">
						<div class="logo">
							<a href="buyerHomepage.jsp"><img
								src="assets/img/logo/logo.png" alt="Logo"></a>
						</div>
						<div class="main-menu d-none d-lg-block">
							<nav>
								<ul id="navigation">
									<li><a href="buyerHomepage.jsp">Home</a></li>
									<li><a href="products.jsp">Products</a></li>
									<li><a href="order_history.jsp">Order History</a></li>
								</ul>
							</nav>
						</div>
						<div class="header-right">
							<ul>
								<li><a href="cart.jsp"><span
										class="flaticon-shopping-cart"></span></a></li>
								<li><a
									href="<%=request.getContextPath()%>/GlobalServlet?taskType=logout"
									class="dropdown-item"> <i class="fa fa-sign-out-alt"></i>
										Logout
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<main>
		<div class="slider-area">
			<div class="single-slider slider-height2 d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap text-center">
								<h2>Product Details</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<section class="product-details section-padding">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="product-image">
							<img src="<%=product.getImagePath()%>"
								alt="<%=product.getProductName()%>">
						</div>
					</div>
					<div class="col-lg-6">
						<div class="product-info">
							<h2><%=product.getProductName()%></h2>
							<p><%=product.getDescription()%></p>
							<p>
								<strong>Price:</strong> $<%=product.getPrice()%>
							</p>
							<p>
								<strong>Stock Quantity:</strong> <span id="stockQuantity"><%=product.getStockQuantity()%></span>
							</p>
							<form action="BuyerServlet?taskType=addProductToCart"
								method="post" id="addToCartForm">
								<input type="hidden" name="productId"
									value="<%=product.getProductId()%>"> <input
									type="hidden" name="email"
									value="<%=session.getAttribute("email")%>"> <input
									type="hidden" name="productPrice"
									value="<%=product.getPrice()%>"> <input type="hidden"
									name="productImagePath" value="<%=product.getImagePath()%>">
								<input type="hidden" name="productName"
									value="<%=product.getProductName()%>"> <input
									type="hidden" name="stockQuantity"
									value="<%=product.getStockQuantity()%>">

								<div class="quantity-container">
									<button type="button" id="decreaseQuantity"
										class="btn btn-secondary">-</button>
									<input type="number" id="quantity" name="quantity" value="1"
										min="1" class="form-control d-inline-block"
										style="width: 60px;">
									<button type="button" id="increaseQuantity"
										class="btn btn-secondary">+</button>
								</div>
								<button type="submit" class="btn btn-primary mt-3">Add
									to Cart</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="review-section section-padding">
			<div class="container">
				<h3>Rate and Review This Product</h3>
				<form action="BuyerServlet?taskType=rateAndReview" method="post">
					<input type="hidden" name="productId"
						value="<%=product.getProductId()%>">
					<div class="form-group">
						<label for="rating">Rating:</label></br> <select id="rating"
							name="rating" class="form-control" required>
							<option value="1">1 Star</option>
							<option value="2">2 Stars</option>
							<option value="3">3 Stars</option>
							<option value="4">4 Stars</option>
							<option value="5">5 Stars</option>
						</select>
					</div>
					<div class="form-group">
						<textarea id="review" name="review" class="form-control" rows="4"
							placeholder="Comment here" required></textarea>
					</div>
					<button type="submit" class="btn btn-primary">Submit
						Review</button>
				</form>
			</div>
		</section>
	</main>

	<footer>
		<div class="footer-area footer-padding">
			<div class="container">
				<div class="row d-flex justify-content-between">
					<div class="col-xl-3 col-lg-3 col-md-5 col-sm-6">
						<div class="single-footer-caption mb-50">
							<div class="single-footer-caption mb-30">
								<div class="footer-logo">
									<a href="buyerHomepage.jsp"><img
										src="assets/img/logo/logo2_footer.png" alt="Footer Logo"></a>
								</div>
								<div class="footer-tittle">
									<div class="footer-pera">
										<p>This tagline emphasizes both the enduring quality and
											the personalized touch of your watches, appealing to
											customers who value style and craftsmanship.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 col-md-5 col-sm-7">
						<div class="single-footer-caption mb-50">
							<div class="footer-tittle">
								<h4>Contact</h4>
								<p>1998-884-8934</p>
								<p>customercare@timezone.co.in</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- JS here -->
	<script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>
	<script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/isotope.pkgd.min.js"></script>
	<script src="assets/js/slick.min.js"></script>
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<script src="assets/js/jquery.nice-select.min.js"></script>
	<script src="assets/js/wow.min.js"></script>
	<script src="assets/js/jquery.slicknav.min.js"></script>
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	<script src="assets/js/contact.js"></script>
	<script src="assets/js/jquery.form.js"></script>
	<script src="assets/js/jquery.validate.min.js"></script>
	<script src="assets/js/mail-script.js"></script>
	<script src="assets/js/jquery.ajaxchimp.min.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>

	<script>
		document
				.getElementById('increaseQuantity')
				.addEventListener(
						'click',
						function() {
							var quantityInput = document
									.getElementById('quantity');
							var quantity = parseInt(quantityInput.value);
							var stockQuantity = parseInt(document
									.querySelector('input[name="stockQuantity"]').value);

							if (quantity < stockQuantity) {
								quantityInput.value = quantity + 1;
								document.getElementById('decreaseQuantity').disabled = false;
								if (quantity + 1 >= stockQuantity) {
									this.disabled = true;
								}
							}
						});

		document
				.getElementById('decreaseQuantity')
				.addEventListener(
						'click',
						function() {
							var quantityInput = document
									.getElementById('quantity');
							var quantity = parseInt(quantityInput.value);

							if (quantity > 1) {
								quantityInput.value = quantity - 1;
								document.getElementById('increaseQuantity').disabled = false;
								if (quantity - 1 === 1) {
									this.disabled = true;
								}
							}
						});
	</script>
</body>
</html>
