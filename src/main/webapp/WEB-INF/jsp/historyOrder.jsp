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
							<div>

								<div class="tab-pane" id="post">
									<div class="">
										<div class="">
											<div class="">
												<h3 class="box-title">History of Your Booking</h3>
												<hr>
												<br>
											</div>
											<!-- /.box-header -->
											<div class="box-body">
												<table id="example1"
													class="table table-bordered table-striped">
													<thead>
														<tr>
															<th>Post ID</th>
															<th>Post Name</th>
															<th>Category</th>
															<th>Author</th>
															<th>Discription</th>
															<th>Avatar</th>
															<th>Create at</th>
															<th>Update at</th>
															<th>Status</th>
															<th>Edit</th>
															<th>Delete</th>
														</tr>
													</thead>
													<tbody>

														<tr>
															<td>Google</td>
															<td>Google</td>
															<td>Google</td>
															<td>Google</td>
															<td>Google</td>
															<td><img src="img/nhat.jpg" alt="" height="80px"
																width="80px" /></td>
															<td>Google</td>
															<td>Google</td>
															<td>Google</td>

															<td><a href="#">
																	<button type="button" class="btn bg-green1 margin">Cancel</button>
															</a></td>
															<td><a href="#">
																	<button type="button" class="btn bg-red margin">Delete</button>
															</a></td>
														</tr>
													</tfoot>
												</table>
											</div>
											<!-- /.box-body -->
										</div>
									</div>
								</div>

								<!-- /.tab-pane -->
							</div>
							<!-- /.tab-content -->
						</div>
						<!-- /.nav-tabs-custom -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<div class="control-sidebar-bg"></div>
	</div>
</body>
</html>