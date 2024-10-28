<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session = request.getSession(false);
if (session == null || session.getAttribute("email") == null) {
	response.sendRedirect(request.getContextPath() + "/login.html");
	return;
}
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
		<div class="slider-area">
			<div class="slider-active">
				<div
					class="single-slider slider-height d-flex align-items-center slide-bg">
					<div class="container">
						<div class="row justify-content-between align-items-center">
							<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8">
								<div class="hero__caption">
									<h1 data-animation="fadeInLeft" data-delay=".4s"
										data-duration="2000ms">Discover Our Latest Collections</h1>
									<p data-animation="fadeInLeft" data-delay=".7s"
										data-duration="2000ms">Find the perfect watch for you from
										our wide selection of styles and brands.</p>

									<div class="hero__btn" data-animation="fadeInLeft"
										data-delay=".8s" data-duration="2000ms">
										<a href="products.jsp" class="btn hero-btn">Shop Now</a>
									</div>
								</div>
							</div>
							<div
								class="col-xl-3 col-lg-3 col-md-4 col-sm-4 d-none d-sm-block">
								<div class="hero__img" data-animation="bounceIn"
									data-delay=".4s">
									<img src="assets/img/hero/watch.png" alt="" class="heartbeat">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<div class="watch-area section-padding30">
		<div class="container">
			<div class="row align-items-center justify-content-between">
				<div class="col-lg-6 col-md-6 col-sm-10">
					<div class="choice-watch-img mb-40">
						<img src="assets/img/gallery/choce_watch2.png" alt="">
					</div>
				</div>
				<div class="col-lg-5 col-md-6">
					<div class="watch-details mb-40">
						<h2>Watch of Choice</h2>
						<p>Each watch in our collection is crafted with precision and
							attention to detail, using only the finest materials. These are
							not just timepieces; they are expressions of luxury and
							refinement.</p>
						<a href="products.jsp" class="btn">Show Watches</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="gallery-area">
		<div class="container-fluid p-0 fix">
			<div class="row">
				<div class="col-xl-6 col-lg-4 col-md-6 col-sm-6">
					<div class="single-gallery mb-30">
						<div class="gallery-img big-img"
							style="background-image: url(assets/img/gallery/gallery1.png);"></div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
					<div class="single-gallery mb-30">
						<div class="gallery-img big-img"
							style="background-image: url(assets/img/gallery/gallery2.png);"></div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-4 col-md-12">
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-6 col-sm-6">
							<div class="single-gallery mb-30">
								<div class="gallery-img small-img"
									style="background-image: url(assets/img/gallery/gallery3.png);"></div>
							</div>
						</div>
						<div class="col-xl-12 col-lg-12  col-md-6 col-sm-6">
							<div class="single-gallery mb-30">
								<div class="gallery-img small-img"
									style="background-image: url(assets/img/gallery/gallery4.png);"></div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="watch-area section-padding30">
		<div class="container">
			<div
				class="row align-items-center justify-content-between padding-130">
				<div class="col-lg-5 col-md-6">
					<div class="watch-details mb-40">
						<h2>Watch of Choice</h2>
						<p>From daily wear to special events, our watches are designed
							to complement your unique style. Make a lasting impression with a
							watch that speaks to your personality.</p>
						<a href="products.jsp" class="btn">Show Watches</a>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-10">
					<div class="choice-watch-img mb-40">
						<img src="assets/img/gallery/choce_watch1.png" alt="">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="shop-method-area">
		<div class="container">
			<div class="method-wrapper">
				<div class="row d-flex justify-content-between">
					<div class="col-xl-4 col-lg-4 col-md-6">
						<div class="single-method mb-40">
							<i class="ti-package"></i>
							<h6>Free Shipping Method</h6>
							<p>Now, when you shop with us, you'll enjoy Free Shipping on
								all your favorite items. No minimum purchase required!</p>
						</div>
					</div>
					<div class="col-xl-4 col-lg-4 col-md-6">
						<div class="single-method mb-40">
							<i class="ti-unlock"></i>
							<h6>Secure Payment System</h6>
							<p>We use advanced encryption technology to safeguard your
								payment details. Shop with confidence knowing that your
								transactions are secure and private.</p>
						</div>
					</div>
					<div class="col-xl-4 col-lg-4 col-md-6">
						<div class="single-method mb-40">
							<i class="ti-reload"></i>
							<h6>Easy Returns, No Worries</h6>
							<p>Changed your mind? No problem. Our easy return process
								lets you send back items with just a few clicks. No complicated
								procedures, just straightforward returns.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

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
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>
	<script src="assets/js/vendor/jquery-3.6.0.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/slicknav.min.js"></script>
	<script src="assets/js/magnific-popup.min.js"></script>
	<script src="assets/js/jquery.nice-select.min.js"></script>
	<script src="assets/js/slick.min.js"></script>
	<script src="assets/js/main.js"></script>

	<script>
		if (window.history && window.history.pushState) {
			window.history.pushState(null, null, window.location.href);
			window.onpopstate = function() {
				window.history.go(1);
			};
		}
	</script>
</body>
</html>
