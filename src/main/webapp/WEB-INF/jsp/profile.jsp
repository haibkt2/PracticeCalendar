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
						<!-- Profile Image -->
						<div class="box box-primary">
							<div class="box-body box-profile">
								<img class="profile-user-img img-responsive img-circle"
									src="img/nhat.jpg" alt="User profile picture">

								<h3 class="profile-username text-center">${UserLogin.getName()}</h3>

								<p class="text-muted text-center">${UserLogin.getUserId()}</p>

								<ul class="list-group list-group-unbordered">
									<li class="list-group-item"><b>${UserLogin.getEmail()}</b>
									</li>
									<li class="list-group-item"><b>${UserLogin.getBirthday()}</b>
									</li>
									<li class="list-group-item"><b>${UserLogin.getPhone()}</b>
									</li>
									<li class="list-group-item"><b>${UserLogin.getStatus()}</b>
									</li>

								</ul>
								<a href="javascript:document.forms['logoutForm'].submit();"
									style="color: blue; float: right"
									class="btn btn-primary btn-block"> Log out </a>
								<form id="logoutForm" method="POST"
									action="${contextPath}/logout">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>

							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->

	<script
		src="${contextPath}/resources/AdminUI/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="${contextPath}/resources/AdminUI/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="${contextPath}/resources/AdminUI/bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="${contextPath}/resources/AdminUI/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${contextPath}/resources/AdminUI/dist/js/demo.js"></script>
</body>
</html>