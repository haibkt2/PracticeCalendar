<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="${contextPath}/resources/AdminUI/ckeditor/ckeditor.js"></script>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/bower_components/Ionicons/css/ionicons.min.css">
<!-- daterange picker -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/bower_components/bootstrap-daterangepicker/daterangepicker.css">
<!-- bootstrap datepicker -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="plugins/iCheck/all.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/plugins/timepicker/bootstrap-timepicker.min.css">
<!-- Select2 -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/bower_components/select2/dist/css/select2.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/dist/css/skins/_all-skins.min.css">
<!-- Morris chart -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/bower_components/morris.js/morris.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<!-- jvectormap -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/bower_components/jvectormap/jquery-jvectormap.css">
<!-- Date Picker -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/bower_components/bootstrap-daterangepicker/daterangepicker.css">
<!-- Select2 -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/bower_components/select2/dist/css/select2.min.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet"
	href="${contextPath}/resources/AdminUI/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<script
		src="${contextPath}/resources/js/scripts.js"></script>
</head>
<body>
	<header class="main-header">
		<!-- Logo -->
		<a href="#" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini"><b>Pet</b></span> <!-- logo for regular state and mobile devices -->
			<span class="logo-lgp"><b>Practice </b> Calendar</span>
		</a>
		<!-- Header Navbar: style can be found in header.less -->
		<nav class="navbar navbar-static-top">
			<!-- Sidebar toggle button-->
			<a href="#" class="sidebar-toggle" data-toggle="push-menu"
				role="button"> <span class="sr-only">Toggle navigation</span>
			</a>

			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<!-- Messages: style can be found in dropdown.less-->
					<li class="dropdown messages-menu"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <i
							class="fa fa-envelope-o"></i> <span class="label label-success">4</span>
					</a>
						<ul class="dropdown-menu">
							<li class="header">You have 4 messages</li>
							<li>
								<!-- inner menu: contains the actual data -->
								<ul class="menu">
									<li>
										<!-- start message --> <a href="#">
											<div class="pull-left">
												<img
													src="${contextPath}/resources/AdminUI/dist/img/user2-160x160.jpg"
													class="img-circle" alt="User Image">
											</div>
											<h4>
												Support Team <small><i class="fa fa-clock-o"></i> 5
													mins</small>
											</h4>
											<p>Why not buy a new awesome theme?</p>
									</a>
									</li>
									<!-- end message -->
									<li><a href="#">
											<div class="pull-left">
												<img
													src="${contextPath}/resources/AdminUI/dist/img/user3-128x128.jpg"
													class="img-circle" alt="User Image">
											</div>
											<h4>
												Petfinder Management <small><i class="fa fa-clock-o"></i>
													2 hours</small>
											</h4>
											<p>Why not buy a new awesome theme?</p>
									</a></li>
									<li><a href="#">
											<div class="pull-left">
												<img
													src="${contextPath}/resources/AdminUI/dist/img/user4-128x128.jpg"
													class="img-circle" alt="User Image">
											</div>
											<h4>
												Developers <small><i class="fa fa-clock-o"></i>
													Today</small>
											</h4>
											<p>Why not buy a new awesome theme?</p>
									</a></li>
									<li><a href="#">
											<div class="pull-left">
												<img
													src="${contextPath}/resources/AdminUI/dist/img/user3-128x128.jpg"
													class="img-circle" alt="User Image">
											</div>
											<h4>
												Sales Department <small><i class="fa fa-clock-o"></i>
													Yesterday</small>
											</h4>
											<p>Why not buy a new awesome theme?</p>
									</a></li>
									<li><a href="#">
											<div class="pull-left">
												<img
													src="${contextPath}/resources/AdminUI/dist/img/user4-128x128.jpg"
													class="img-circle" alt="User Image">
											</div>
											<h4>
												Reviewers <small><i class="fa fa-clock-o"></i> 2
													days</small>
											</h4>
											<p>Why not buy a new awesome theme?</p>
									</a></li>
								</ul>
							</li>
							<li class="footer"><a href="#">See All Messages</a></li>
						</ul></li>
					<!-- Notifications: style can be found in dropdown.less -->
					<!--           <li class="dropdown notifications-menu"> -->
					<!--             <a href="#" class="dropdown-toggle" data-toggle="dropdown"> -->
					<!--               <i class="fa fa-bell-o"></i> -->
					<!--               <span class="label label-warning">10</span> -->
					<!--             </a> -->
					<!--             <ul class="dropdown-menu"> -->
					<!--               <li class="header">You have 10 notifications</li> -->
					<!--               <li> -->
					<!--                 inner menu: contains the actual data -->
					<!--                 <ul class="menu"> -->
					<!--                   <li> -->
					<!--                     <a href="#"> -->
					<!--                       <i class="fa fa-users text-aqua"></i> 5 new members joined today -->
					<!--                     </a> -->
					<!--                   </li> -->
					<!--                   <li> -->
					<!--                     <a href="#"> -->
					<!--                       <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the -->
					<!--                       page and may cause design problems -->
					<!--                     </a> -->
					<!--                   </li> -->
					<!--                   <li> -->
					<!--                     <a href="#"> -->
					<!--                       <i class="fa fa-users text-red"></i> 5 new members joined -->
					<!--                     </a> -->
					<!--                   </li> -->
					<!--                   <li> -->
					<!--                     <a href="#"> -->
					<!--                       <i class="fa fa-shopping-cart text-green"></i> 25 sales made -->
					<!--                     </a> -->
					<!--                   </li> -->
					<!--                   <li> -->
					<!--                     <a href="#"> -->
					<!--                       <i class="fa fa-user text-red"></i> You changed your username -->
					<!--                     </a> -->
					<!--                   </li> -->
					<!--                 </ul> -->
					<!--               </li> -->
					<!--               <li class="footer"><a href="#">View all</a></li> -->
					<!--             </ul> -->
					<!--           </li> -->
					<!-- Tasks: style can be found in dropdown.less -->
					<!--           <li class="dropdown tasks-menu"> -->
					<!--             <a href="#" class="dropdown-toggle" data-toggle="dropdown"> -->
					<!--               <i class="fa fa-flag-o"></i> -->
					<!--               <span class="label label-danger">9</span> -->
					<!--             </a> -->
					<!--             <ul class="dropdown-menu"> -->
					<!--               <li class="header">You have 9 tasks</li> -->
					<!--               <li> -->
					<!--                 inner menu: contains the actual data -->
					<!--                 <ul class="menu"> -->
					<!--                   <li>Task item -->
					<!--                     <a href="#"> -->
					<!--                       <h3> -->
					<!--                         Design some buttons -->
					<!--                         <small class="pull-right">20%</small> -->
					<!--                       </h3> -->
					<!--                       <div class="progress xs"> -->
					<!--                         <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" -->
					<!--                              aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"> -->
					<!--                           <span class="sr-only">20% Complete</span> -->
					<!--                         </div> -->
					<!--                       </div> -->
					<!--                     </a> -->
					<!--                   </li> -->
					<!--                   end task item -->
					<!--                   <li>Task item -->
					<!--                     <a href="#"> -->
					<!--                       <h3> -->
					<!--                         Create a nice theme -->
					<!--                         <small class="pull-right">40%</small> -->
					<!--                       </h3> -->
					<!--                       <div class="progress xs"> -->
					<!--                         <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" -->
					<!--                              aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"> -->
					<!--                           <span class="sr-only">40% Complete</span> -->
					<!--                         </div> -->
					<!--                       </div> -->
					<!--                     </a> -->
					<!--                   </li> -->
					<!--                   end task item -->
					<!--                   <li>Task item -->
					<!--                     <a href="#"> -->
					<!--                       <h3> -->
					<!--                         Some task I need to do -->
					<!--                         <small class="pull-right">60%</small> -->
					<!--                       </h3> -->
					<!--                       <div class="progress xs"> -->
					<!--                         <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" -->
					<!--                              aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"> -->
					<!--                           <span class="sr-only">60% Complete</span> -->
					<!--                         </div> -->
					<!--                       </div> -->
					<!--                     </a> -->
					<!--                   </li> -->
					<!--                   end task item -->
					<!--                   <li>Task item -->
					<!--                     <a href="#"> -->
					<!--                       <h3> -->
					<!--                         Make beautiful transitions -->
					<!--                         <small class="pull-right">80%</small> -->
					<!--                       </h3> -->
					<!--                       <div class="progress xs"> -->
					<!--                         <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" -->
					<!--                              aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"> -->
					<!--                           <span class="sr-only">80% Complete</span> -->
					<!--                         </div> -->
					<!--                       </div> -->
					<!--                     </a> -->
					<!--                   </li> -->
					<!--                   end task item -->
					<!--                 </ul> -->
					<!--               </li> -->
					<!--               <li class="footer"> -->
					<!--                 <a href="#">View all tasks</a> -->
					<!--               </li> -->
					<!--             </ul> -->
					<!--           </li> -->
					<!-- User Account: style can be found in dropdown.less -->
					<li class="dropdown user user-menu"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> <img
							src="${contextPath}/resources/AdminUI/dist/img/user2-160x160.jpg"
							class="user-image" alt="User Image"> <span
							class="hidden-xs">${UserLogin.getName()}</span>
					</a>
						<ul class="dropdown-menu">
							<!-- User image -->
							<li class="user-header"><img
								src="${contextPath}/resources/AdminUI/dist/img/user2-160x160.jpg"
								class="img-circle" alt="User Image">

								<p>
									${UserLogin.getRole().getRoleName()} - ${UserLogin.getName()} <small>Member
										since ${UserLogin.getCreateDate()}</small>
								</p></li>
							<li class="user-footer">
								<div class="pull-left">
									<a href="${contextPath}/profile"
										class="btn btn-default btn-flat">Profile</a>
								</div>
								<div class="pull-right">
									<a href="${contextPath}/home?logout=log"
										class="btn btn-default btn-flat">Logout</a>
								</div>
							</li>
						</ul></li>
					<!-- Control Sidebar Toggle Button -->
				</ul>
			</div>
		</nav>
	</header>
</body>
</html>