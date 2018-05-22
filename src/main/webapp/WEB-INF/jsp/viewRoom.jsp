<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User - Statistics</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div style="margin: 110px 0 0 340px">Hiện thị order cho giáo viên
	<div>
	<c:forEach items="${listRoom}" var="listRoom">
	${listRoom.getRoomName()}
	<br>
		<c:forEach items="${listRoom.getOrderCalendar()}" var="listOr">
		<br>
		${listOr.getTimeOrder()}
		
		${listOr.getDateOrder()}
		</c:forEach>
	</c:forEach>
	
	
	</div>

	</div>
	<div style="margin: 250px 0 0 340px">Hiện thị order cho Sinh viên

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>