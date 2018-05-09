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
<div style="margin: 340px">
Hiện thị thời gian hiện tại
<br>
Số người truy cập trong ngày : 20
<br>
Số người feedback trong ngày : 4
<br>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>