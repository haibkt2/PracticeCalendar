<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>register</title>
</head>
<body>
	<form:form action="${contextPath}/register" modelAttribute="userForm">
		mssv : <form:input type="text" id="name" path="userId" />
		<br>
		name : <form:input type="text" path="name" />
		<br>
		email : <form:input type="text" path="email" />
		<br>
		phone : <form:input type="text" id="phone" path="phone" />
		<br>
		<button type="submit">degister</button>
	</form:form>
</body>
</html>