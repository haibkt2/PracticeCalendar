
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="${contextPath}/resources/js/scripts.js"></script>
<script
		src="${contextPath}/resources/AdminUI/bower_components/jquery/dist/jquery.min.js"></script>
<title>Create New User</title>
</head>
<body class="hold-transition skin-blue sidebar-mini"
	onload="startTime();">
	
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div id="header-info-center">
				<div id="header-time"
					style="padding-top: 10px; text-align: center; color: red; font-size: 40px;"></div>
			</div>
			<input type="hidden" id="serverTime" />
		</section>
</div>
</body>
</html>