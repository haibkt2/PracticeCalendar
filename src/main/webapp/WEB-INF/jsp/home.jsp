<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="content_area">
		<div class="container">
			<div class="row" style="padding-left: 65px;">
				<div>
					<form method="GET" action="${contextPath}/register">
						<input type="submit" class="btn btn-primary btn-md"
							style="margin-left: 20px;"
							value="btn.createnew" />
					</form>
				</div>
				<div style="padding-left: 30px">
					<div class="row"></div>
				</div>
			</div>

			<div class="container height_checkin" style="margin-top: 50px;">
				<div class="row"></div>

				<div
					style="text-align: center; color: red; padding-top: 20px; font-size: 20px;"
					class="form-group_checkIN">time</div>

			</div>
		</div>
	</div>
	<!-- /container -->
</body>
</html>