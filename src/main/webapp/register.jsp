<!doctype html>
<html lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Create Account</title>
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
</head>
<body>
	<header>
		<!-- Header Start -->
		<div class="header-area">
			<div class="main-header header-sticky">
				<div class="container-fluid">
					<div class="menu-wrapper">
						<!-- Logo -->
						<div class="logo">
							<a href="index.html"><img src="assets/img/logo/logo.png"
								alt="Logo"></a>
						</div>
						<!-- Main-menu -->
						<div class="main-menu d-none d-lg-block">
							<nav>
								<ul id="navigation">
									<li><a href="index.html"></a></li>
								</ul>
							</nav>
						</div>
						<!-- Header Right -->
						<div class="header-right">
							<ul>
								<li><a href="login.html"><span class="flaticon-user"></span></a></li>
							</ul>
						</div>
					</div>
					<!-- Mobile Menu -->
					<div class="col-12">
						<div class="mobile_menu d-block d-lg-none"></div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<main>
		<!-- Hero Area Start-->
		<div class="slider-area">
			<div class="single-slider slider-height2 d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap text-center">
								<h2>Registration</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--================Create Account Area =================-->
		<section class="login_part section_padding">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-6">
						<div class="login_part_text text-center">
							<div class="login_part_text_iner">
								<h2>Join Our Shop</h2>
								<p>Join us today to access the best products and offers
									available.</p>
								<a href="login.html" class="btn_3">Already have an account?
									Sign In</a>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="login_part_form">
							<div class="login_part_form_iner">
								<h3>
									Welcome! <br> Create your account
								</h3>
								<form class="row contact_form"
									action="GlobalServlet?taskType=register" method="post"
									novalidate="novalidate" onsubmit="return validateForm()">
									<input type="hidden" name="action" value="register">
									<div class="col-md-12 form-group p_star">
										<input type="text" class="form-control" id="name" name="name"
											placeholder="Full Name" required>
									</div>
									<div class="col-md-12 form-group p_star">
										<input type="email" class="form-control" id="email"
											name="email" placeholder="Email Address" required>
										<p id="emailError" style="color: red; font-size: 0.9em;"></p>
									</div>
									<div class="col-md-12 form-group p_star">
										<input type="password" class="form-control" id="password"
											name="password" placeholder="Password" required>
										<p id="passwordError" style="color: red; font-size: 0.9em;"></p>
									</div>
									<div class="col-md-12 form-group p_star">
										<input type="number" class="form-control" id="age" name="age"
											placeholder="Age" min="15" required>
										<p id="ageError" style="color: red; font-size: 0.9em;"></p>
									</div>
									<div class="col-md-12 form-group p_star">
										<input type="text" class="form-control" id="contactNo"
											name="contactNo" placeholder="Contact Number" required>
										<p id="contactNoError" style="color: red; font-size: 0.9em;"></p>
									</div>
									<div class="col-md-12 form-group p_star">
										<input type="text" class="form-control" id="city" name="city"
											placeholder="City" required>
									</div>
									<div class="col-md-12 form-group p_star">
										<select class="form-control" id="userType" name="userType"
											required>
											<option value="" disabled selected>Select User Type</option>
											<option value="buyer">Buyer</option>
											<option value="retailer">Retailer</option>
										</select>
									</div>
									<div class="col-md-12 form-group">
										<button type="submit" value="submit" class="btn_3">Create
											Account</button>
									</div>
								</form>
								<p id="errorMessage" style="color: red;"></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--================Create Account End =================-->
	</main>
	<footer>
		<!-- Footer Start-->
		<div class="footer-area footer-padding">
			<div class="container">
				<div class="row d-flex justify-content-between">
					<div class="col-xl-3 col-lg-3 col-md-5 col-sm-6">
						<div class="single-footer-caption mb-50">
							<div class="single-footer-caption mb-30">
								<!-- logo -->
								<div class="footer-logo">
									<a href="index.html"><img
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
								<ul>
									<li><a href="#">1998-884-8934</a></li>
									<li><a href="#">customercare@timezone.co.in</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- Footer bottom -->
			</div>
		</div>
		<!-- Footer End-->
	</footer>

	<!-- JS here -->
	<script src="assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/isotope.pkgd.min.js"></script>
	<script src="assets/js/ajax-form.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/imagesloaded.pkgd.min.js"></script>
	<script src="assets/js/scrollIt.js"></script>
	<script src="assets/js/jquery.scrollUp.min.js"></script>
	<script src="assets/js/wow.min.js"></script>
	<script src="assets/js/nice-select.min.js"></script>
	<script src="assets/js/jquery.slicknav.min.js"></script>
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/gijgo.min.js"></script>
	<script src="assets/js/slick.min.js"></script>

	<!--contact js-->
	<script src="assets/js/contact.js"></script>
	<script src="assets/js/jquery.ajaxchimp.min.js"></script>
	<script src="assets/js/jquery.form.js"></script>
	<script src="assets/js/jquery.validate.min.js"></script>
	<script src="assets/js/mail-script.js"></script>
	<script src="assets/js/jquery.slicknav.min.js"></script>

	<script src="assets/js/main.js"></script>

	<script>
		// Add keyup event listeners
		document.getElementById('age').addEventListener('keyup', function() {
			validateAgeLive(this.value);
		});

		document.getElementById('contactNo').addEventListener('keyup',
				function() {
					validateContactNoLive(this.value);
				});

		document.getElementById('email').addEventListener('keyup', function() {
			validateEmailLive(this.value);
		});

		document.getElementById('password').addEventListener('keyup',
				function() {
					validatePasswordLive(this.value);
				});

		// Live validation functions
		function validateAgeLive(age) {
			var ageErrorElement = document.getElementById('ageError');

			if (age === '') {
				ageErrorElement.innerText = '';
				return;
			}

			if (age < 15) {
				ageErrorElement.innerText = 'Age must be greater than 14.';
			} else {
				ageErrorElement.innerText = '';
			}
		}

		function validateContactNoLive(contactNo) {
			var contactNoErrorElement = document
					.getElementById('contactNoError');

			if (contactNo === '') {
				contactNoErrorElement.innerText = '';
				return;
			}

			if (contactNo.length !== 10) {
				contactNoErrorElement.innerText = 'Contact number must be 10 digits.';
			} else {
				contactNoErrorElement.innerText = '';
			}
		}

		function validateEmailLive(email) {
			var emailErrorElement = document.getElementById('emailError');

			if (email === '') {
				emailErrorElement.innerText = '';
				return;
			}

			if (!validateEmail(email)) {
				emailErrorElement.innerText = 'Please enter a valid email address.';
			} else {
				emailErrorElement.innerText = '';
			}
		}

		function validatePasswordLive(password) {
			var passwordErrorElement = document.getElementById('passwordError');

			if (password === '') {
				passwordErrorElement.innerText = '';
				return;
			}

			var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
			if (!passwordPattern.test(password)) {
				passwordErrorElement.innerText = 'Password must be at least 8 characters long, include an uppercase letter, a number, and a special character.';
			} else {
				passwordErrorElement.innerText = '';
			}
		}

		function validateForm() {
			var age = document.getElementById('age').value;
			var contactNo = document.getElementById('contactNo').value;
			var email = document.getElementById('email').value;
			var password = document.getElementById('password').value;

			var isValid = true;

			// Reset error messages
			document.getElementById('ageError').innerText = '';
			document.getElementById('contactNoError').innerText = '';
			document.getElementById('emailError').innerText = '';
			document.getElementById('passwordError').innerText = '';

			// Age Validation
			if (age !== '' && age < 15) {
				document.getElementById('ageError').innerText = 'Age must be greater than 14.';
				isValid = false;
			}

			// Contact Number Validation
			if (contactNo !== '' && contactNo.length !== 10) {
				document.getElementById('contactNoError').innerText = 'Contact number must be 10 digits.';
				isValid = false;
			}

			// Email Validation
			if (email !== '' && !validateEmail(email)) {
				document.getElementById('emailError').innerText = 'Please enter a valid email address.';
				isValid = false;
			}

			// Password Validation
			if (password !== '' && !validatePassword(password)) {
				document.getElementById('passwordError').innerText = 'Password must be at least 8 characters long, include an uppercase letter, a number, and a special character.';
				isValid = false;
			}

			return isValid;
		}

		function validateEmail(email) {
			var re = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
			return re.test(email);
		}

		function validatePassword(password) {
			var passwordPattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
			return passwordPattern.test(password);
		}
	</script>

</body>
</html>
