<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session = request.getSession(false);
if (session == null || session.getAttribute("email") == null) {
	response.sendRedirect(request.getContextPath() + "/login.html");
	return;
}

String email = (String) session.getAttribute("email");
String orderId = request.getParameter("orderId");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Confirmation</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/style.css">
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
					<div class="col-12">
						<div class="mobile_menu d-block d-lg-none"></div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-12 text-center">
				<h2>Order Confirmation</h2>
				<p>
					Thank you for your purchase,
					<%=email%>!
				</p>
				<p>You will receive an email confirmation shortly.</p>
				<a href="buyerHomepage.jsp" class="btn btn-primary mt-4">Return
					to Home</a>
			</div>
		</div>
	</div>

	<footer>
		<div class="footer-area footer-padding">
			<div class="container">
				<div class="row d-flex justify-content-between">
					<div class="col-xl-3 col-lg-3 col-md-5 col-sm-6">
						<div class="single-footer-caption mb-50">
							<div class="footer-logo">
								<a href="buyerHomepage.jsp"><img
									src="assets/img/logo/logo2_footer.png" alt="Footer Logo"></a>
							</div>
							<div class="footer-tittle">
								<p>Stylish and enduring watches crafted for your timeless
									moments.</p>
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
