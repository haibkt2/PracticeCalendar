
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
		<h3>List Request</h3>
		<div class="box-body">
			<table id="example" class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>STT</th>
						<th>Full name</th>
						<th>Room</th>
						<th>Time Order</th>
						<th>Date Request</th>
						<th>Date Create</th>
						<th>Status</th>
						<th>Response</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listReq}" var="listReq" varStatus="looprq">
						<tr>

							<td>${looprq.index+1}</td>
							<td>${listReq.getUser().getName()}</td>
							<td>${listReq.getRoom().getRoomName()}</td>
							<td>${listReq.getTimeOrder()}</td>
							<td>${listReq.getCreatDate()}</td>
							<td>${listReq.getDateReq()}</td>
							<td>${listReq.getStatus()}</td>
							<!--             <td>Button phản hồi</td> -->
							<td><input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /><a
								href="${contextPath}/responseRequest?agree=${listReq.getReqId()}"><button>Accept</button></a>

								<a
								href="${contextPath}/responseRequest?disagree=${listReq.getReqId()}"><button>Refuse</button></a>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<h3>History Request</h3>
		<div class="box-body">
			<table id="example1" class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>STT</th>
						<th>Full name</th>
						<th>Room</th>
						<th>Date Request</th>
						<th>Date Order</th>
						<th>Time Order</th>
						<th>Status</th>
						<th>Admin</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listAgr}" var="listAgr" varStatus="loopagr">
						<tr>

							<td>${loopagr.index+1}</td>
							<td>${listAgr.getUser().getName()}</td>
							<td>${listAgr.getRoom().getRoomName()}</td>
							<td>${listAgr.getCreatDate()}</td>
							<td>${listAgr.getDateReq()}</td>
							<td>${listAgr.getTimeOrder()}</td>
							<td>${listAgr.getStatus()}</td>
							<td>${listAgr.getAdminAgree()}</td>
							<td>
							<a
								href="${contextPath}/responseRequest?disagree=${listAgr.getReqId()}"><button>Delete</button></a>
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