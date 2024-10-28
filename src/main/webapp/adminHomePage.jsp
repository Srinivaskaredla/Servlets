<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Admin Dashboard - Home</title>
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
	padding-bottom: 60px; /* Add padding to prevent overlap */
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

/* Dropdown menu styles */
.dropdown-menu {
	display: none; /* Hidden by default */
	position: absolute;
	left: -100px; /* Adjust this value to move the dropdown as needed */
	top: 45px;
	/* Adjust this value to move the dropdown closer to the icon */
	background: #fff;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
	z-index: 1001; /* Higher than the footer's z-index */
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

/* Footer Styles */
footer {
	position: static; /* Changed from fixed to static */
	background: #343a40;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	height: 60px; /* Set a specific height */
}

footer p {
	margin: 0;
}

/* Responsive Table */
table {
	width: 100%;
	border-collapse: collapse;
}

table th, table td {
	padding: 10px;
	text-align: left;
}

/* Space between header and main content */
main {
	margin-top: 20px;
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
							<a href="adminHomePage.jsp"><img
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
									<li><a href="adminHomePage.jsp">Home</a></li>
									<li><a href="allUsers.jsp">View All Users</a></li>
									<li><a href="all_buyers.jsp">View All Buyers</a></li>
									<li><a href="all_retailers.jsp">View All Retailers</a></li>
								</ul>
							</nav>
						</div>
						<!-- Mobile Menu -->
						<div class="collapse navbar-collapse" id="navbarNav">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link"
									href="adminHomePage.jsp">Home</a></li>
								<li class="nav-item"><a class="nav-link"
									href="allUsers.jsp">View All Users</a></li>
								<li class="nav-item"><a class="nav-link"
									href="all_buyers.jsp">View All Buyers</a></li>
								<li class="nav-item"><a class="nav-link"
									href="all_retailers.jsp">View All Retailers</a></li>
							</ul>
						</div>
						<!-- Profile Icon and Dropdown -->
						<div class="profile-menu">
							<i class="fa fa-user" onclick="toggleDropdown()"></i>
							<div class="dropdown-menu">
								<a
									href="<%=request.getContextPath()%>/GlobalServlet?taskType=logout"
									class="dropdown-item"> <i class="fa fa-sign-out-alt"></i>
									Logout
								</a>
							</div>
						</div>
					</div>
					<div class="col-12">
						<div class="mobile_menu d-block d-lg-none"></div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Header End -->

	<main>
		<div class="container">
			<h1 class="display-4">Welcome to the Admin Home Page!</h1>
			<p>Use the navigation links above to manage the e-commerce
				platform efficiently.</p>
		</div>
	</main>

	<footer>
		<p>&copy; 2024 E-Commerce Platform. All Rights Reserved.</p>
	</footer>

	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script>
		function toggleDropdown() {
			var dropdown = document.querySelector('.dropdown-menu');
			dropdown.style.display = dropdown.style.display === 'block' ? 'none'
					: 'block';
		}

		// Close the dropdown if clicked outside
		document.addEventListener('click', function(event) {
			var dropdown = document.querySelector('.dropdown-menu');
			var profileIcon = document.querySelector('.fa-user');
			if (!profileIcon.contains(event.target)
					&& !dropdown.contains(event.target)) {
				dropdown.style.display = 'none';
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
