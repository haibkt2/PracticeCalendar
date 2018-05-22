<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>Practice Calendar</title>

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,700%7CLato:300,400"
	rel="stylesheet">

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/bootstrap-grid.min.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/bootstrap-theme.min.css">

<!-- Owl Carousel -->
<link type="text/css" rel="stylesheet"
	href="${contextPath}/resources/css/owl.carousel.css" />
<link type="text/css" rel="stylesheet"
	href="${contextPath}/resources/css/owl.theme.default.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet"
	href="${contextPath}/resources/css/style.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>
<body>

	<!-- Header -->
	<header id="header">
		<!-- Top Header -->
		<div id="top-header">
			<div class="container">
				<div class="header-links">
					<div class="row" style="margin-top: 6px; margin-bottom: -9px;">
						<div class="col-lg-7">
							<ul>
								<li><a href="#">Thông báo</a></li>
								<li><a href="#">Quy chế & Quy định</a></li>
								<li><a href="#">Hướng dẫn đăng ký</a></li>
							</ul>
						</div>

						<div class="col-lg-3">
							<form class="form-group login_form" action="${contextPath}/home"
								method="post">
								<div class="row">
									<div class="col-lg-5">
										<input class="form-control" type="text" required
											autocomplete="off" placeholder="Username" name="userId" />
									</div>
									<div class="col-lg-5">
										<input class="form-control" type="password" required
											autocomplete="off" placeholder="Password" name="password" />
									</div>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
									<div class="col-lg-2">
										<button type="submit" class="btn btn-dark">Login</button>
									</div>
								</div>
							</form>
						</div>
						<div class="col-lg-2" s>
							<button style="margin-left: 18px;" type="submit"
								data-toggle="modal" data-target="#logupModal"
								class="btn btn-dark">Logup</button>
							<div class="modal fade" id="logupModal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h2 style="text-align: center;" class="modal-title"
												id="exampleModalLabel">Sign up for free</h2>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<form action="${contextPath}/register" method="post">
												<div class="form-group">
													<div>
														<p for="recipient-name" class="col-form-label">First
															name *</p>
														<input type="text" required minlength="3" maxlength="60"
															autocomplete="off" name="f_name"/>
														
													</div>

													<div>
														<p for="recipient-name" class="col-form-label">Last
															name *</p>
														<input type="text" required autocomplete="off" name="l_name" />
														
													</div>

													<div>
														<p for="recipient-name" class="col-form-label">Student
															Code *</p>
														<input type="text" required autocomplete="off"  name="mssv">
														
													</div>

													<div>
														<p for="recipient-name" class="col-form-label">Phone
															number *</p>
														<input type="tel" required pattern="^[0-9-s()]*$"
															autocomplete="off" name="phone" />
														
													</div>
													
													<div>
														<p for="recipient-mail" class="col-form-label">Email *</p>
														<input type="text" required autocomplete="off"  name="mail">
														
													</div>

													<div>
														<p for="recipient-name" class="col-form-label">Birthday
															*</p>
														<input type="date" id="birthday" name="birthday"
															class="form-control" placeholder="'dd/mm/yyyy'" data-mask>
														
													</div>

<!-- 													<div class="form-group"> -->
<!-- 														<input class="form-control" type="file" name="hinhanh" -->
<!-- 															required="true" /> -->
<!-- 														<p for="recipient-name" class="col-form-label">Avatar -->
<!-- 															*</p> -->
<!-- 													</div> -->

													<div>
														<p for="recipient-name" class="col-form-label">Gender
														</p>
														<select class="form-control select2" name="gender"
															id="gender" required="true" style="width: 100%;">
															<option selected="selected" value="Man">Man</option>
															<option value="Women">Women</option>
														</select>
														
													</div>

													<p for="recipient-name" class="col-form-label"
														style="color: red; text-align: right;">
														<i>Check you email after you finish, please!</i>
													</p>
													<p for="recipient-name" class="col-form-label"
														style="color: red; text-align: right;">
														<a href="https://www.youtube.com/watch?v=MuanZsUy5lQ" target="_blank"><i>Guide to student email</i></a>
													</p>
												</div>
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
													<button type="submit" class="btn btn-primary">Logup</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>

<!-- 							<div class="modal fade" id="forgotpassModal" tabindex="-1" -->
<!-- 								role="dialog" aria-labelledby="exampleModalLabel" -->
<!-- 								aria-hidden="true"> -->
<!-- 								<div class="modal-dialog" role="document"> -->
<!-- 									<div class="modal-content"> -->
<!-- 										<div class="modal-header"> -->
<!-- 											<h5 class="modal-title" id="exampleModalLabel">Enter -->
<!-- 												your student code, please!</h5> -->
<!-- 											<button type="button" class="close" data-dismiss="modal" -->
<!-- 												aria-label="Close"> -->
<!-- 												<span aria-hidden="true">&times;</span> -->
<!-- 											</button> -->
<!-- 										</div> -->
<!-- 										<div class="modal-body"> -->
<!-- 											<form> -->
<!-- 												<div class="form-group"> -->
<!-- 													<p for="recipient-name" class="col-form-label">Student -->
<!-- 														Code</p> -->
<!-- 													<input type="text" class="form-control" id="recipient-name" -->
<!-- 														placeholder="Enter here!"> -->
<!-- 													<p for="recipient-name" class="col-form-label" -->
<!-- 														style="color: red; text-align: right;"> -->
<!-- 														<i>Check you email after you finish.</i> -->
<!-- 													</p> -->
<!-- 												</div> -->
<!-- 											</form> -->
<!-- 										</div> -->
<!-- 										<div class="modal-footer"> -->
<!-- 											<button type="button" class="btn btn-secondary" -->
<!-- 												data-dismiss="modal">Close</button> -->
<!-- 											<button type="button" class="btn btn-primary">Send -->
<!-- 												message</button> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
						</div>
						
						${messageRegis}
					</div>

				</div>
			</div>
		</div>
		<!-- /Top Header -->

	</header>
	<!-- /Header -->


	<!-- SECTION -->
	

	<!-- SECTION -->
	<div class="section">
		<!-- CONTAINER -->
		<div class="container">
			<!-- ROW -->
			<div class="row">
				<!-- Main Column -->
				<div class="col-md-8">
					<!-- row -->
					<div class="row">
						<!-- Column 1 -->
						<div class="col-md-6 col-sm-6">
							
							<!-- ARTICLE -->
							<article class="article">
								<div class="article-img">
									<a href="#"> <img
										src="${contextPath}/resources/img/img-sm-1.jpg" alt="">
									</a>
									<ul class="article-info">
										<li class="article-type"><i class="fa fa-camera"></i></li>
									</ul>
								</div>
								<div class="article-body">
									<h3 class="article-title">
										<a href="#">Thông báo đợt xét tốt nghiệp cuối học kỳ 2</a>
									</h3>
									<ul class="article-meta">
										<li><i class="fa fa-clock-o"></i> January 31, 2017</li>
										<li><i class="fa fa-comments"></i> 33</li>
									</ul>
									<p>Populo tritani laboramus ex mei, no eum iuvaret ceteros
										euripidis, ne alia sadipscing mei. Te inciderint cotidieque
										pro, ei iisque docendi qui, ne accommodare theophrastus
										reprehendunt vel. Et commodo menandri eam.</p>
								</div>
							</article>
							<!-- /ARTICLE -->

							<!-- ARTICLE -->
							<article class="article widget-article">
								<div class="article-img">
									<a href="#"> <img
										src="${contextPath}/resources/img/img-widget-7.jpg" alt="">
									</a>
								</div>
								<div class="article-body">
									<h4 class="article-title">
										<a href="#">Thông báo đợt xét tốt nghiệp cuối học kỳ 2</a>
									</h4>
									<ul class="article-meta">
										<li><i class="fa fa-clock-o"></i> January 31, 2017</li>
										<li><i class="fa fa-comments"></i> 33</li>
									</ul>
								</div>
							</article>
							<!-- /ARTICLE -->

							<!-- ARTICLE -->
							<article class="article widget-article">
								<div class="article-img">
									<a href="#"> <img
										src="${contextPath}/resources/img/img-widget-8.jpg" alt="">
									</a>
								</div>
								<div class="article-body">
									<h4 class="article-title">
										<a href="#">Thông báo đợt xét tốt nghiệp cuối học kỳ 2</a>
									</h4>
									<ul class="article-meta">
										<li><i class="fa fa-clock-o"></i> January 31, 2017</li>
										<li><i class="fa fa-comments"></i> 33</li>
									</ul>
								</div>
							</article>
							<!-- /ARTICLE -->
						</div>
						<!-- /Column 1 -->

						<!-- Column 2 -->
						<div class="col-md-6 col-sm-6">
							

							<!-- ARTICLE -->
							<article class="article">
								<div class="article-img">
									<a href="#"> <img
										src="${contextPath}/resources/img/img-sm-2.jpg" alt="">
									</a>
									<ul class="article-info">
										<li class="article-type"><i class="fa fa-file-text"></i></li>
									</ul>
								</div>
								<div class="article-body">
									<h3 class="article-title">
										<a href="#">Thông báo đợt xét tốt nghiệp cuối học kỳ 2</a>
									</h3>
									<ul class="article-meta">
										<li><i class="fa fa-clock-o"></i> January 31, 2017</li>
										<li><i class="fa fa-comments"></i> 33</li>
									</ul>
									<p>Populo tritani laboramus ex mei, no eum iuvaret ceteros
										euripidis, ne alia sadipscing mei. Te inciderint cotidieque
										pro, ei iisque docendi qui, ne accommodare theophrastus
										reprehendunt vel. Et commodo menandri eam.</p>
								</div>
							</article>
							<!-- /ARTICLE -->

							<!-- ARTICLE -->
							<article class="article widget-article">
								<div class="article-img">
									<a href="#"> <img
										src="${contextPath}/resources/img/img-widget-9.jpg" alt="">
									</a>
								</div>
								<div class="article-body">
									<h4 class="article-title">
										<a href="#">Thông báo đợt xét tốt nghiệp cuối học kỳ 2</a>
									</h4>
									<ul class="article-meta">
										<li><i class="fa fa-clock-o"></i> January 31, 2017</li>
										<li><i class="fa fa-comments"></i> 33</li>
									</ul>
								</div>
							</article>
							<!-- /ARTICLE -->

							<!-- ARTICLE -->
							<article class="article widget-article">
								<div class="article-img">
									<a href="#"> <img
										src="${contextPath}/resources/img/img-widget-10.jpg" alt="">
									</a>
								</div>
								<div class="article-body">
									<h4 class="article-title">
										<a href="#">Thông báo đợt xét tốt nghiệp cuối học kỳ 2</a>
									</h4>
									<ul class="article-meta">
										<li><i class="fa fa-clock-o"></i> January 31, 2017</li>
										<li><i class="fa fa-comments"></i> 33</li>
									</ul>
								</div>
							</article>
							<!-- /ARTICLE -->
						</div>
						<!-- /Column 2 -->
					</div>
					<!-- /row -->

					<!-- row -->
					

					<!-- row -->
					
					<!-- /row -->
				</div>
				<!-- /Main Column -->

				<!-- Aside Column -->
				<div class="col-md-4">
					<!-- Ad widget -->
					<div class="widget center-block hidden-xs">
						<img class="center-block"
							src="${contextPath}/resources/img/ad-1.jpg" alt="">
					</div>
					<!-- /Ad widget -->

					<!-- social widget -->
					<div class="widget social-widget">
						<div class="widget-title">
							<h2 class="title">Stay Connected</h2>
						</div>
						<ul>
							<li><a href="#" class="facebook"><i
									class="fa fa-facebook"></i><br>
								<span>Facebook</span></a></li>
							<li><a href="#" class="twitter"><i class="fa fa-twitter"></i><br>
								<span>Twitter</span></a></li>
							<li><a href="#" class="google"><i class="fa fa-google"></i><br>
								<span>Google+</span></a></li>
							<li><a href="#" class="instagram"><i
									class="fa fa-instagram"></i><br>
								<span>Instagram</span></a></li>
							<li><a href="#" class="youtube"><i class="fa fa-youtube"></i><br>
								<span>Youtube</span></a></li>
							<li><a href="#" class="rss"><i class="fa fa-rss"></i><br>
								<span>RSS</span></a></li>
						</ul>
					</div>
					<!-- /social widget -->

					<!-- subscribe widget -->
					<div class="widget subscribe-widget">
						<div class="widget-title">
							<h2 class="title">Subscribe to Newslatter</h2>
						</div>
						<form>
							<input class="input" type="email" placeholder="Enter Your Email">
							<button class="input-btn">Subscribe</button>
						</form>
					</div>
					<!-- /subscribe widget -->

					<!-- article widget -->
					
					<!-- /article widget -->
				</div>
				<!-- /Aside Column -->
			</div>
			<!-- /ROW -->
		</div>
		<!-- /CONTAINER -->
	</div>
	<!-- /SECTION -->

	<!-- AD SECTION -->
	
	<!-- /AD SECTION -->

	<!-- SECTION -->
	
	<!-- /SECTION -->

	<!-- SECTION -->
	
	<!-- /SECTION -->

	
		<!-- Bottom Footer -->
		<div id="bottom-footer" class="section">
			<!-- CONTAINER -->
			<div class="container">
				<!-- ROW -->
				<div class="row">
					<!-- footer links -->
					<div class="col-md-6 col-md-push-6">
						<ul class="footer-links">
							<li><a href="#">About us</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Advertisement</a></li>
							<li><a href="#">Privacy</a></li>
						</ul>
					</div>
					<!-- /footer links -->

					<!-- footer copyright -->
					<div class="col-md-6 col-md-pull-6">
						<div class="footer-copyright">
							<span>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span>
						</div>
					</div>
					<!-- /footer copyright -->
				</div>
				<!-- /ROW -->
			</div>
			<!-- /CONTAINER -->
		</div>
		<!-- /Bottom Footer -->
	</footer>
	<!-- /FOOTER -->

	<!-- Back to top -->
	<div id="back-to-top"></div>
	<!-- Back to top -->

	<!-- jQuery Plugins -->
	<script src="${contextPath}/resources/js/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${contextPath}/resources/js/main.js"></script>

</body>
</html>
