
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
<title>Create New User</title>
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

<div class="box-body">
      <table id="example1" class="table table-bordered table-striped">
        <thead>
        <tr>
          <th>User Id</th>
          <th>Full name</th>
          <th>Room</th>
          <th>Date Request</th>
          <th>Date Order</th>
          <th>Time Order</th>
          <th>Status</th>
          <th>Response</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listReq}" var="listReq">
          <tr>
             
            <td>${listReq.getUser().getUserId()}</td>
            <td>${listReq.getUser().getName()}</td>
            <td>${listReq.getRoom().getRoomName()}</td>
            <td>${listReq.getCreatDate()}</td>
            <td>${listReq.getDateReq()}</td>
            <td>${listReq.getTimeOrder()}</td>
            <td>${listReq.getStatus()}</td>
            <td>Button phản hồi</td>
<%--             <td><a href="${contextPath}/updateInfo?userid=${listUser.getUserId()}"><button>Update</button></a></td> --%>
            
          </tr>
          </c:forEach>
        </tbody>
      </table>
      </div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>