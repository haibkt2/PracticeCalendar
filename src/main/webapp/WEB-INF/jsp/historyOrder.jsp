<%@page import="PracticeCalendar.Model.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="date" value="${now}" pattern="yyyy-MM-dd" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>History Booking</title>
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
															<th>STT</th>
															<th>Room</th>
															<th>Date Booking</th>
															<th>Time Booking</th>
															<th>Create Date</th>
															<th>Cancel</th>
															<th>Delete</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach items="${orderUser}" var="listOr" varStatus="lopList">
														<tr>
															<td>${lopList.index+1}</td>
															<td>${listOr.getRoom().getRoomName()}</td>
															<td>${listOr.getDateOrder()}</td>
															<td>${listOr.getTimeOrder()}</td>
															<td>${listOr.getCreatDate()}</td>
															
															<td><a href="${contextPath}/manageOrder?cancel=${listOr.getOrderId()}">
																	<button type="button" class="btn bg-green1 margin" ${date ge listOr.getDateOrder() ? 'disabled="disabled"': ''}>Cancel</button>
															</a></td>
															<td><a href="${contextPath}/manageOrder?delete=${listOr.getOrderId()}">
																	<button type="button" class="btn bg-red margin" ${listOr.getDateOrder() gt date ? 'disabled="disabled"': ''}>Delete</button>
															</a></td>
														</tr>
													
													</c:forEach>
														
													</tfoot>
												</table>
											</div>
											<c:if test="${UserLogin.getRole().getRoleName() ne 'ROLE_STUDENT' }">
											<div class="box-body">
											<h3>List Request</h3>
												<table id="example1"
													class="table table-bordered table-striped">
													<thead>
														<tr>
															<th>STT</th>
															<th>Room</th>
															<th>Date Request</th>
															<th>Time Request</th>
															<th>Create Date</th>
															<th>Status</th>
															<th>Cancel</th>
															<th>Delete</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach items="${listRq}" var="listRq" varStatus="lopList">
														<tr>
															<td>${lopList.index+1}</td>
															<td>${listRq.getRoom().getRoomName()}</td>
															<td>${listRq.getDateReq()}</td>
															<td>${listRq.getTimeOrder()}</td>
															<td>${listRq.getCreatDate()}</td>
															<td>${listRq.getStatus()}</td>
															<td><a href="${contextPath}/manageRequest?cancel=${listRq.getReqId()}">
																	<button type="button" class="btn bg-green1 margin" ${date ge listRq.getDateReq() ? 'disabled="disabled"': ''}>Cancel</button>
															</a></td>
															<td><a href="${contextPath}/manageRequest?delete=${listRq.getReqId()}">
																	<button type="button" class="btn bg-red margin" ${listRq.getDateReq() gt date ? 'disabled="disabled"': ''}>Delete</button>
															</a></td>
														</tr>
													
													</c:forEach>
														
													</tfoot>
												</table>
											</div>
											</c:if>
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