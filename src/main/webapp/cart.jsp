<%@ page import="java.util.List"%>
<%@ page import="com.ecommerce.entity.Cart"%>
<%@ page import="com.ecommerce.service.BuyerService"%>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
session = request.getSession(false);
if (session == null || session.getAttribute("email") == null) {
	response.sendRedirect(request.getContextPath() + "/login.html");
	return;
}

String email = (String) session.getAttribute("email");
request.setAttribute("email", email);

BuyerService buyerService = new BuyerService();
List<Cart> carts = buyerService.viewCart(email);
double overallTotal = 0.0;
%>

<!doctype html>
<html lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Cart | eCommers</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/style.css">
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

<style>
.btn-sm {
	font-size: 0.7rem;
	padding: 0.9rem 0.5rem;
	border-radius: 0.2rem;
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

	<div class="container mt-4">
		<h2>Shopping Cart</h2>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Product Image</th>
					<th>Product ID</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Total Price</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (carts != null && !carts.isEmpty()) {
					for (Cart cart : carts) {
						double price = cart.getPrice();
						int quantity = cart.getQuantity();
						double totalPrice = price * quantity;
						overallTotal += totalPrice;
				%>
				<tr>
					<td><img src="<%=cart.getImagePath()%>" alt="Product Image"
						style="width: 100px; height: auto;"></td>
					<td><%=cart.getProductId()%></td>
					<td><%=cart.getQuantity()%></td>
					<td><%=cart.getPrice()%></td>
					<td><%=totalPrice%></td>
					<td>
						<form action="BuyerServlet?taskType=removeProductFromCart"
							method="post" style="display: inline;">
							<input type="hidden" name="email" value="<%=email%>"> <input
								type="hidden" name="cartId" value="<%=cart.getCartId()%>">
							<input type="hidden" name="productId"
								value="<%=cart.getProductId()%>">
							<button type="submit" class="btn btn-danger btn-sm">Remove</button>
						</form>
					</td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="6">No items in the cart.</td>
				</tr>
				<%
				}
				%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5" class="text-right"><strong>Total:</strong></td>
					<td><strong><%=String.format("%.2f", overallTotal)%></strong></td>
				</tr>
			</tfoot>
		</table>

		<%
		if (carts != null && !carts.isEmpty()) {
		%>
		<form action="BuyerServlet?taskType=createOrder" method="post"
			class="mt-4">
			<input type="hidden" name="email" value="<%=email%>">
			<%
			for (Cart cart : carts) {
			%>
			<input type="hidden" name="productId"
				value="<%=cart.getProductId()%>"> <input type="hidden"
				name="quantity" value="<%=cart.getQuantity()%>">
			<%
			}
			%>
			<input type="hidden" name="orderTotal"
				value="<%=String.format("%.2f", overallTotal)%>">
			<button type="submit" class="btn btn-primary">Place Order</button>
		</form>
		<%
		}
		%>
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
</body>
</html>
