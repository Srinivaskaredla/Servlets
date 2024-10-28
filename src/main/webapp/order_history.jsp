<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.ecommerce.entity.Order"%>
<%@ page import="com.ecommerce.service.BuyerService"%>
<%
session = request.getSession(false);
if (session == null || session.getAttribute("email") == null) {
	response.sendRedirect(request.getContextPath() + "/login.html");
	return;
}

String email = (String) session.getAttribute("email");
request.setAttribute("email", email);
BuyerService buyerService = new BuyerService();
List<Order> orders = buyerService.viewOrders(email);
request.setAttribute("orders", orders);
%>

<!doctype html>
<html lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Cart | eCommers</title>
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
.btn-sm {
	font-size: 0.7rem; /* Adjust font size */
	padding: 0.9rem 0.5rem; /* Adjust padding */
	border-radius: 0.2rem; /* Optional: Adjust border radius */
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
		<div class="container mt-5">
			<h1>Order History</h1>
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Customer email</th>
							<th>Order Date</th>
							<th>Product Id</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Total amount</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<%
						if (orders != null && !orders.isEmpty()) {
						%>
						<%
						for (Order order : orders) {
						%>
						<tr>
							<td><%=order.getEmail()%></td>
							<td><%=order.getOrderDate()%></td>
							<td><%=order.getProductId()%></td>
							<td><%=order.getQuantity()%></td>
							<td><%=order.getPrice()%></td>
							<td><%=order.getTotalAmount()%></td>
							<td><%=order.getStatus()%></td>
						</tr>
						<%
						}
						%>
						<%
						} else {
						%>
						<tr>
							<td colspan="6" class="text-center">No orders found.</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
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
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="./assets/js/popper.min.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<script src="./assets/js/jquery.slicknav.min.js"></script>
	<script src="./assets/js/owl.carousel.min.js"></script>
	<script src="./assets/js/slick.min.js"></script>
	<script src="./assets/js/jquery.magnific-popup.min.js"></script>
	<script src="./assets/js/jquery.nice-select.min.js"></script>
	<script src="./assets/js/jquery.countdown.min.js"></script>
	<script src="./assets/js/jquery.animatedheadline.min.js"></script>
	<script src="./assets/js/main.js"></script>

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
