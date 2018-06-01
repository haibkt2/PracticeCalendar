<%@page import="PracticeCalendar.Model.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | User Profile</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper1">

		<!-- Content Wrapper. Contains page content -->
		<div class="content">
			<!-- Content Header (Page header) -->

			<!-- Main content -->
			<section class="content">

				<div class="row">
					<div class="col-md-3">

						<jsp:include page="profile.jsp"></jsp:include>

					</div>
					<!-- /.col -->
					<div class="col-md-9">
						<hr style="margin-top: 1px" />
						<div class="nav-tabs-custom">
							<jsp:include page="headerUser.jsp"></jsp:include>
							<div class="tab-content">
								<div class="active tab-pane" id="settings">
									<div class="">
										<h3 class="">Update your information</h3>
										<hr>
										${mss_up }

										<p style="text-align: center;">
											<a href="#" class="addtop"><img src="assets/img/add.png"
												alt="" /> </a>
										</p>
									</div>
									<form:form action="${contextPath}/updateInfoUser?${_csrf.parameterName}=${_csrf.token}"
										modelAttribute="userForm" enctype="multipart/form-data">
										<div class="box-body">
											<div class="form-group">
												<label for="">Username</label> <input type="text"
													class="form-control" required="true" name="name" id="name"
													value="${UserLogin.getName()}">
											</div>

											<div class="form-group">
												<label for="">Password</label> <input type="password"
													class="form-control" name="password" id="password"
													placeholder="Enter password">
											</div>

											<div class="form-group">
												<label for="exampleInputEmail1">Email address</label> <input
													type="email" class="form-control" required="true"
													name="email" id="email" value="${UserLogin.getEmail()}" />
											</div>

											<div class="form-group">
												<label>Phone number</label> <input class="form-control"
													type="tel" required="true" pattern="^[0-9-+s()]*$"
													name="phone" id="phone" value="${UserLogin.getPhone()}">
												<!-- /.input group -->
											</div>

											<div class="form-group">
												<label>Gender</label> <select class="form-control"
													name="gender" id="gender" required="true">
													<option selected="selected">Man</option>
													<option>Woman</option>
												</select>
											</div>

											<div class="form-group">
												<label>Birthday</label>
												<div class="form-group">
													<input type="text" id="birthday" name="birthday"
														class="form-control" value="${UserLogin.getBirthday()}">
												</div>
												<!-- /.input group -->
											</div>

											<div class="form-group">
												<label>Choose a new Avartar</label> <input
													class="form-control" type="file" name="file"
													placeholder="Choose your picture"
													value="Choose your picture" />
											</div>
											<div class="form-group">
												<label>Your current picture</label> <br /> <img
													src="${contextPath}/Reponsitory/Avatar/${UserLogin.getAvatar()}" name="oldPicture" width="30%"
													height="30%">
											</div>

										</div>
										<!-- /.box-body -->

										<div class="box-footer" style="text-align: center;">
											<button type="submit" class="btn btn-primary">Submit</button>
										</div>

										<input type="hidden" class="form-control" name="role"
											id="role" value="${UserLogin.getRole().getRoleId()}">
										<input type="hidden" class="form-control" name="status"
											id="status" value="Actived">
										<input type="hidden" class="form-control" name="userId"
											id="userId" value="${UserLogin.getUserId()}">

										<div class="clearfix"></div>
									</form:form>
								</div>
								<!-- /.tab-pane -->
							</div>
							<!-- /.tab-content -->
						</div>
						<!-- /.nav-tabs-custom -->
					</div>
					>
					<!-- /.col -->
				</div>
				<!-- /.row -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<div class="control-sidebar-bg"></div>

		<!-- MODEL -->
		<!-- Modal -->




	</div>

</body>
</html>