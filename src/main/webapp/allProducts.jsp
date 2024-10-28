<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.ecommerce.entity.Product"%>
<%
session = request.getSession(false);
if (session == null || session.getAttribute("email") == null) {
	response.sendRedirect(request.getContextPath() + "/login.html");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Products</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
/* General styling */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

/* Header styling */
header {
	background: #f8f9fa;
	border-bottom: 1px solid #ddd;
}

.header-area {
	padding: 10px 0;
}

.logo img {
	max-height: 40px;
}

.menu-wrapper {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 20px;
}

.main-menu {
	display: flex;
	align-items: center;
	flex: 1;
}

.main-menu ul li {
	position: relative;
}

.main-menu ul li a {
	color: #333;
	text-decoration: none;
	padding: 8px 15px;
}

.dropdown-menu {
	display: none;
	position: absolute;
	top: 100%;
	background: #fff;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
	z-index: 1001;
	min-width: 160px;
}

.dropdown-menu li {
	margin: 0;
}

.dropdown-menu li a {
	padding: 8px 15px;
	color: #333;
	display: block;
}

.dropdown-menu li a:hover {
	background-color: #f8f9fa;
}

/* Footer styling */
footer {
	background: #343a40;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	position: fixed;
	bottom: 0;
	width: 100%;
}

footer p {
	margin: 0;
}

/* Main content styling */
main {
	margin-top: 20px;
	padding-bottom: 80px; /* Space for the footer */
}

/* Profile Icon and Dropdown */
.profile-menu {
	position: relative;
	display: inline-block;
}

.profile-menu .fa-user {
	cursor: pointer;
	font-size: 1.5rem;
}

.profile-menu .dropdown-menu {
	top: 100%;
	left: 0;
	margin-top: 10px;
	width: 160px;
}

/* Responsive Design */
@media ( max-width : 768px) {
	.main-menu {
		display: none;
	}
	.navbar-collapse {
		flex-direction: column;
		align-items: flex-start;
	}
	.navbar-collapse ul {
		display: flex;
		flex-direction: column;
		width: 100%;
		padding: 0;
	}
	.navbar-collapse ul li {
		margin: 0;
	}
	.navbar-collapse ul li a {
		padding: 10px;
		width: 100%;
	}
	.dropdown-menu {
		width: 100%;
		right: 0;
	}
}

/* Table Styling for All Products Page */
.table {
	width: 100%;
	margin: 20px 0;
	border-collapse: collapse;
}

.table th, .table td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.table th {
	background-color: #f8f9fa;
}

.table-striped tbody tr:nth-of-type(odd) {
	background-color: #f9f9f9;
}

/* Custom Button Styles */
.btn-edit {
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	padding: 5px 10px;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.btn-edit:hover {
	background-color: #0056b3;
}

.btn-delete {
	background-color: #dc3545;
	color: #fff;
	border: none;
	border-radius: 4px;
	padding: 5px 10px;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.btn-delete:hover {
	background-color: #c82333;
}
</style>
</head>

<body>
	<!-- Header Start -->
	<header>
		<div class="header-area">
			<div class="main-header header-sticky">
				<div class="container-fluid">
					<div class="menu-wrapper">
						<!-- Logo -->
						<div class="logo">
							<a href="retailerHomepage.jsp"><img
								src="assets/img/logo/logo.png" alt="Logo"></a>
						</div>
						<!-- Navbar Toggle for Mobile -->
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarNav"
							aria-controls="navbarNav" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<!-- Main-menu -->
						<div class="main-menu d-none d-lg-block">
							<nav>
								<ul id="navigation">
									<li><a href="retailerHomepage.jsp">Home</a></li>
									<li><a href="RetailerServlet?taskType=viewAllProducts">All
											Products</a></li>
									<li><a href="RetailerServlet?taskType=addProduct">Add
											Product</a></li>
									<li><a href="RetailerServlet?taskType=viewBuyerOrders">Buyer
											Orders</a></li>
									<li><a href="RetailerServlet?taskType=viewProductReviews">Product
											Reviews</a></li>
								</ul>
							</nav>
						</div>
						<!-- Mobile Menu -->
						<div class="collapse navbar-collapse" id="navbarNav">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link"
									href="retailerHomepage.jsp">Home</a></li>
								<li class="nav-item"><a class="nav-link"
									href="RetailerServlet?taskType=viewAllProducts">All
										Products</a></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#"
									id="manageProductDropdown" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">Manage Product</a>
									<div class="dropdown-menu"
										aria-labelledby="manageProductDropdown">
										<a class="dropdown-item"
											href="RetailerServlet?taskType=addProduct">Add Product</a> <a
											class="dropdown-item"
											href="RetailerServlet?taskType=updateProduct">Update
											Product</a>
									</div></li>
								<li class="nav-item"><a class="nav-link"
									href="RetailerServlet?taskType=viewBuyerOrders">Buyer
										Orders</a></li>
								<li class="nav-item"><a class="nav-link"
									href="RetailerServlet?taskType=viewProductReviews">Product
										Reviews</a></li>
							</ul>
						</div>
						<!-- Profile Icon and Dropdown -->
						<div class="profile-menu">
							<i class="fa fa-user" onclick="toggleProfileDropdown()"></i>
							<div class="dropdown-menu">
								<a
									href="<%=request.getContextPath()%>/GlobalServlet?taskType=logout"
									class="dropdown-item"><i class="fa fa-sign-out-alt"></i>
									Logout</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="container">
		<h1 class="my-4">All Products</h1>
		<table class="table table-bordered table-hover product-table">
			<thead>
				<tr>
					<th>Product ID</th>
					<th>Product Name</th>
					<th>Description</th>
					<th>Price</th>
					<th>Stock Quantity</th>
					<th>Category</th>
					<th>Image</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Product> products = (List<Product>) request.getAttribute("products");
				if (products != null) {
					for (Product product : products) {
				%>
				<tr>
					<td><%=product.getProductId()%></td>
					<td><%=product.getProductName()%></td>
					<td><%=product.getDescription()%></td>
					<td><%=product.getPrice()%></td>
					<td><%=product.getStockQuantity()%></td>
					<td><%=product.getCategory()%></td>
					<td><img src="<%=product.getImagePath()%>" alt="Product Image"
						style="width: 50px; height: 50px;"></td>
					<td><a
						href="RetailerServlet?taskType=updateProduct&productId=<%=product.getProductId()%>"
						class="btn-edit">Edit</a> <a
						href="RetailerServlet?taskType=deleteProduct&productId=<%=product.getProductId()%>"
						class="btn-delete">Delete</a></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</div>

	<!-- Footer Start -->
	<footer>
		<div class="container">
			<p>&copy; 2024 E-Commerce Platform. All Rights Reserved.</p>
		</div>
	</footer>
	<!-- Footer End -->

	<!-- JavaScript Libraries -->
	<script src="assets/js/jquery-3.6.0.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script>
		function toggleProfileDropdown() {
			document.querySelector(".profile-menu .dropdown-menu").classList
					.toggle("show");
		}

		// Close dropdown if clicked outside
		document.addEventListener("click", function(event) {
			const dropdown = document
					.querySelector(".profile-menu .dropdown-menu");
			const icon = document.querySelector(".profile-menu .fa-user");

			if (!dropdown.contains(event.target)
					&& !icon.contains(event.target)) {
				dropdown.classList.remove("show");
			}
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
