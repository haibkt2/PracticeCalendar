
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
<title>Practice Calendar</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
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
		<form action="${contextPath}/bookingStatisticsRoom" style="margin-left: 530px" >
			<select name="roomId" id="roomId" onchange="this.form.submit()">
				<option value="all">View All</option>
				<c:forEach items="${listRoom}" var="listRoom" varStatus="loop">
					<option value="${listRoom.getRoomId()}" ${roomIdView eq  listRoom.getRoomId() ? 'selected="selected"': ''} >${listRoom.getRoomName()}</option>
				</c:forEach>
			</select>
		</form>
		<h3>History Request</h3>
		<div class="box-body">
			<table id="example1" class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>STT</th>
						<th>User Id</th>
						<th>Full Name</th>
						<th>Date Booking</th>
						<th>Date Create</th>
						<th>Time Order</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listOrder}" var="listOrder" varStatus="loopagr">
						<tr>

							<td>${loopagr.index+1}</td>
							<td>${listOrder.getUser().getUserId()}</td>
							<td>${listOrder.getUser().getName()}</td>
							<td>${listOrder.getDateOrder()}</td>
							<td>${listOrder.getCreatDate()}</td>
							<td>${listOrder.getTimeOrder()}</td>
							<td><a
								href="${contextPath}/deleteOrder?deleteOrder=${listOrder.getOrderId()}"><button>Delete</button></a>
							</td>
							<!--             <td>Button phản hồi</td> -->
							<!--             <td> -->
							<%--             <a href="${contextPath}/responseRequest?userid=${listUser.getUserId()}"><button>Delete</button></a> --%>
							<!--             </td> -->

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>