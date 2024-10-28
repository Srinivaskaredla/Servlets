<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.ecommerce.entity.Product"%>
<%@ page import="com.ecommerce.service.BuyerService"%>
<%
session = request.getSession(false);
if (session == null || session.getAttribute("email") == null) {
	response.sendRedirect(request.getContextPath() + "/login.html");
	return;
}
BuyerService buyerService = new BuyerService();
List<Product> productsList = buyerService.viewAllProducts();
request.setAttribute("products", productsList);
%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Watch Shop | eCommerce</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">

<!-- CSS here -->
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
<style>
/* Custom CSS for product display */
.product-item {
	text-align: center;
	margin-bottom: 30px;
}

.product-item img {
	max-width: 100%;
	height: auto;
}

.product-item h3 {
	font-size: 1.2em;
	margin-top: 10px;
}

.product-item span {
	display: block;
	margin-top: 5px;
	font-size: 1em;
	color: #333;
}

/* Category filter styles */
.filter-slide {
	display: none;
	position: absolute;
	background: #ffffff;
	border: 1px solid #ddd;
	padding: 20px;
	width: 220px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	z-index: 1000;
}

.filter-slide.show {
	display: block;
}

.filter-toggle {
	cursor: pointer;
	margin-bottom: 20px;
	background: #007bff;
	color: #ffffff;
	padding: 10px 15px;
	border-radius: 5px;
	text-align: center;
	font-weight: bold;
	transition: background-color 0.3s;
}

.filter-toggle:hover {
	background: #0056b3;
}

.category-list {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.category-list li {
	margin-bottom: 10px;
}

.category-list a {
	text-decoration: none;
	color: #333;
	display: block;
	padding: 10px;
	border-radius: 5px;
	transition: background-color 0.3s, color 0.3s;
}

.category-list a:hover {
	background-color: #007bff;
	color: #ffffff;
}
</style>
</head>

<body>
	<header>
		<div class="header-area">
			<div class="main-header header-sticky">
				<div class="container-fluid">
					<div class="menu-wrapper">
						<div class="logo">
							<a href="buyerHomepage.jsp"><img
								src="assets/img/logo/logo.png" alt=""></a>
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
					<div class="col-12">
						<div class="mobile_menu d-block d-lg-none"></div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<main>
		<!-- Hero Area Start -->
		<div class="slider-area">
			<div class="single-slider slider-height2 d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap text-center">
								<h2>Watch Shop</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Hero Area End -->

		<section class="popular-items latest-padding">
			<div class="container">
				<div class="row">
					<!-- Category Filter -->
					<div class="col-lg-3 col-md-4">
						<div class="filter-toggle">Categories</div>
						<div class="filter-slide">
							<ul class="category-list">
								<li><a href="products.jsp">All</a></li>
								<li><a href="viewProductsByCategory.jsp?category=Men">Men</a></li>
								<li><a href="viewProductsByCategory.jsp?category=Ladies">Ladies</a></li>
								<li><a href="viewProductsByCategory.jsp?category=Children">Children</a></li>
								<!-- Add more categories as needed -->
							</ul>
						</div>
					</div>
					<!-- Products Display -->
					<div class="col-lg-9 col-md-8">
						<div class="row">
							<!-- Display products -->
							<%
							List<Product> products = (List<Product>) request.getAttribute("products");
							if (products != null && !products.isEmpty()) {
								for (Product product : products) {
							%>
							<div class="col-lg-4 col-md-6 col-sm-6 product-item">
								<div class="single-popular-items mb-50 text-center">
									<div class="popular-img">
										<img src="<%=product.getImagePath()%>" alt="Product Image">
										<div class="img-cap">
											<a
												href="product_details.jsp?productId=<%=product.getProductId()%>"
												class="btn btn-primary">View Details</a>
										</div>
									</div>
									<div class="popular-caption">
										<h3><%=product.getProductName()%></h3>
										<span>$<%=product.getPrice()%></span>
									</div>
								</div>
							</div>
							<%
							}
							} else {
							%>
							<div class="col-12 text-center">
								<p>No products found in this category.</p>
							</div>
							<%
							}
							%>
						</div>
					</div>
				</div>
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
										src="assets/img/logo/logo2_footer.png" alt=""></a>
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
								<ul>
									<li><a href="complaintFile.jsp">Report an issue</a></li>
								</ul>
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
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	<script src="assets/js/main.js"></script>

	<script>
		document.querySelector('.filter-toggle').addEventListener('click',
				function() {
					var filterSlide = document.querySelector('.filter-slide');
					filterSlide.classList.toggle('show');
				});

		if (window.history && window.history.pushState) {
			window.history.pushState(null, null, window.location.href);
			window.onpopstate = function() {
				window.history.go(1);
			};
		}
	</script>
</body>
</html>
