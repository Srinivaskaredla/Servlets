<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.ecommerce.entity.User"%>
<%@ page import="com.ecommerce.service.AdminService"%>
<%
session = request.getSession(false);
if (session == null || session.getAttribute("email") == null) {
	response.sendRedirect(request.getContextPath() + "/login.html");
	return;
}

AdminService adminService = new AdminService();
List<User> users = adminService.viewAllUsers();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Admin Dashboard - All Users</title>
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

.main-menu ul {
	list-style: none;
	display: flex;
	flex-wrap: wrap;
	padding: 0;
	margin: 0;
}

.main-menu ul li {
	margin-right: 15px;
}

.main-menu ul li a {
	color: #333;
	text-decoration: none;
}

.profile-menu {
	position: relative;
	display: flex;
	align-items: center;
}

.profile-menu .fa-user {
	cursor: pointer;
	font-size: 20px;
	color: #000;
}

.dropdown-menu {
	display: none;
	position: absolute;
	top: 45px;
	left: -100px;
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
}

footer {
	background: #343a40;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	height: 60px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	border: 1px solid #ddd;
}

th {
	background-color: #f4f4f4;
}

.action-buttons {
	display: flex;
	gap: 5px;
}

.action-buttons button {
	border: none;
	background: none;
	cursor: pointer;
	font-size: 14px;
}

@media ( max-width : 768px) {
	.main-menu {
		display: none;
	}
	.navbar-collapse ul {
		display: flex;
		flex-direction: column;
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
						<div class="logo">
							<a href="adminHomePage.jsp"><img
								src="assets/img/logo/logo.png" alt="Logo"></a>
						</div>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarNav"
							aria-controls="navbarNav" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
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
			<h1 class="display-4">All Users</h1>
			<table>
				<thead>
					<tr>
						<th>Name</th>
						<th>Email</th>
						<th>Contact Number</th>
						<th>City</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (users != null && !users.isEmpty()) {
						for (User user : users) {
					%>
					<tr>
						<td><%=user.getName()%></td>
						<td><%=user.getEmail()%></td>
						<td><%=user.getContactNo()%></td>
						<td><%=user.getCity()%></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="4">No users found.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</main>

	<!-- Footer Start -->
	<footer>
		<p>&copy; 2024 E-Commerce Platform. All rights reserved.</p>
	</footer>
	<!-- Footer End -->

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script>
		function toggleDropdown() {
			var dropdown = document.querySelector('.dropdown-menu');
			dropdown.style.display = dropdown.style.display === 'block' ? 'none'
					: 'block';
		}
		window.onclick = function(event) {
			if (!event.target.matches('.fa-user')) {
				var dropdowns = document
						.getElementsByClassName("dropdown-menu");
				for (var i = 0; i < dropdowns.length; i++) {
					var openDropdown = dropdowns[i];
					if (openDropdown.style.display === 'block') {
						openDropdown.style.display = 'none';
					}
				}
			}
		}

		if (window.history && window.history.pushState) {
			window.history.pushState(null, null, window.location.href);
			window.onpopstate = function() {
				window.history.go(1);
			};
		}
	</script>
</body>
</html>
