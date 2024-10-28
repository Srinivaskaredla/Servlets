<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.ecommerce.entity.Product"%>
<%
session = request.getSession(false);
if (session == null || session.getAttribute("email") == null) {
	response.sendRedirect(request.getContextPath() + "/login.html");
	return;
}

Product product = (Product) request.getAttribute("product");
if (product == null) {
	out.println("Product data not found.");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Update Products</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
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

main {
	margin-top: 20px;
	padding-bottom: 60px;
}

.main-menu {
	display: flex;
	align-items: center;
}

.main-menu ul {
	margin: 0;
	padding: 0;
	list-style: none;
	display: flex;
	flex-wrap: wrap;
}

.main-menu ul li {
	margin-right: 15px;
}

.main-menu ul li a {
	color: #333;
	text-decoration: none;
	font-weight: normal;
}

.main-menu ul li a:hover {
	color: #007bff;
}

.profile-menu {
	display: flex;
	align-items: center;
	position: relative;
}

.profile-menu .fa-user {
	margin-left: auto;
	font-size: 20px;
	color: #000;
	cursor: pointer;
}

.dropdown-menu {
	display: none;
	position: absolute;
	left: -100px;
	top: 45px;
	background: #fff;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
	z-index: 1001;
}

.dropdown-item {
	padding: 10px;
	text-decoration: none;
	color: #333;
	display: flex;
	align-items: center;
	white-space: nowrap;
}

.dropdown-item i {
	margin-right: 10px;
}

.dropdown-item:hover {
	background-color: #f8f9fa;
}

footer {
	position: static;
	background: #343a40;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	height: 60px;
}

footer p {
	margin: 0;
}

form {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background: #fff;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	font-weight: bold;
	margin-bottom: 5px;
	display: block;
}

.form-group input, .form-group textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

.form-group input[type="file"] {
	padding: 3px;
}

.btn-update {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 15px;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

.btn-update:hover {
	background-color: #0056b3;
}

/* Media Queries */
@media ( max-width : 768px) {
	.main-menu {
		display: none;
	}
	.mobile_menu {
		display: block;
	}
	.navbar-toggler {
		display: block;
		border: none;
		background: none;
	}
	.navbar-collapse {
		flex-direction: column;
	}
	.navbar-collapse ul {
		display: flex;
		flex-direction: column;
	}
	.navbar-collapse ul li {
		margin: 0;
	}
	.navbar-collapse ul li a {
		padding: 10px;
	}
	.dropdown-menu {
		width: 100%;
		right: 0;
	}
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
	<main>
		<form action="RetailerServlet?taskType=updateProduct" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="taskType" value="updateProduct"> <input
				type="hidden" name="productId" value="<%=product.getProductId()%>">

			<div class="form-group">
				<label for="productName">Product Name:</label> <input type="text"
					id="productName" name="productName" class="form-control"
					value="<%=product.getProductName()%>" required>
			</div>

			<div class="form-group">
				<label for="description">Description:</label>
				<textarea id="description" name="description" class="form-control"
					required><%=product.getDescription()%></textarea>
			</div>

			<div class="form-group">
				<label for="price">Price:</label> <input type="number" id="price"
					name="price" class="form-control" value="<%=product.getPrice()%>"
					step="0.01" required>
			</div>

			<div class="form-group">
				<label for="stockQuantity">Stock Quantity:</label> <input
					type="number" id="stockQuantity" name="stockQuantity"
					class="form-control" value="<%=product.getStockQuantity()%>"
					required>
			</div>

			<div class="form-group">
				<label for="category">Category:</label> <select id="category"
					name="category" class="form-control" required>
					<option value="Men"
						<%=product.getCategory().equals("Men") ? "selected" : ""%>>Men</option>
					<option value="Ladies"
						<%=product.getCategory().equals("Ladies") ? "selected" : ""%>>Ladies</option>
					<option value="Children"
						<%=product.getCategory().equals("Children") ? "selected" : ""%>>Children</option>
				</select>
			</div>

			<div class="form-group">
				<label for="productImage">Product Image (Leave blank to keep
					existing image):</label> <input type="file" id="productImage"
					name="productImage" class="form-control">
			</div>

			<button type="submit" class="btn-update">Update Product</button>
		</form>
	</main>
	
	<footer>
		<p>&copy; 2024 E-Commerce Platform. All rights reserved.</p>
	</footer>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script>
		function toggleDropdown(event) {
			event.preventDefault();
			event.stopPropagation();
			var dropdownMenu = event.currentTarget.nextElementSibling;
			var isDisplayed = dropdownMenu.style.display === 'block';
			closeAllDropdowns();
			dropdownMenu.style.display = isDisplayed ? 'none' : 'block';
		}

		function toggleProfileDropdown() {
			var dropdown = document
					.querySelector('.profile-menu .dropdown-menu');
			var isDisplayed = dropdown.style.display === 'block';
			closeAllDropdowns();
			dropdown.style.display = isDisplayed ? 'none' : 'block';
		}

		function closeAllDropdowns() {
			document.querySelectorAll('.dropdown-menu').forEach(function(menu) {
				menu.style.display = 'none';
			});
		}

		document.addEventListener('click', function(event) {
			if (!event.target.closest('.dropdown-menu')
					&& !event.target.closest('.profile-menu')) {
				closeAllDropdowns();
			}
		});

		// Prevent caching of pages
		if (window.history && window.history.pushState) {
			window.history.pushState(null, null, window.location.href);
			window.onpopstate = function() {
				window.history.go(1);
			};
		}
	</script>
</body>
</html>
