
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking Calendar</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="row">
		<div class="col-lg-12 col-md-12">
			<div class="content-wrapper">
				<div class="box-header">
					<h3 class="box-title">Update User</h3>
					<br> ${messUpdate}
				</div>
				<div class="content">
					<form:form action="${contextPath}/orderCalendar"
						modelAttribute="roomForm">
						<div class="box-body">

							<div class="form-group">
								<label for="">Class</label>
								<form:input type="text" path="roomName" class="form-control"
									cssStyle="background-color: rgba(221, 221, 221, 1); width: 125px" readonly="true" />
							</div>

							<div class="input-group">
								<label>Date Order</label>
								<input type="date" id="dateOrder" name="dateOrder"
									 class="form-control" placeholder="'dd/mm/yyyy'" />
							</div>

							<div class="form-group">
								<label>Time</label> <select class="form-control select2"
									name="time" id="time" required="true">
									<option selected="selected" value="Morning">The
										Morning</option>
									<option value="Lunch">The Lunch</option>
									<option value="Afternoon">The Afternoon</option>
									<option value="Evening">The Evening</option>
								</select>
							</div>



							<!-- 								<div class="form-group"> -->
							<!-- 									<label>Date masks:</label> -->



							<!--                             <div class="form-group"> -->
							<!--                                 <label>Content</label> -->
							<!--                                 <textarea class="ckeditor" id="mess_content" required="true" rows="5" name="mess_content" placeholder="Enter your email content"></textarea> -->
							<!--                                 <script> -->
							<!-- //                                      CKEDITOR.replace( 'mess_content', -->
							<!-- //                                       { -->
							<!-- //                                         filebrowserBrowseUrl : '{{ $ADMIN_URL }}ckfinder/ckfinder.html', -->
							<!-- //                                         filebrowserImageBrowseUrl : '{{ $ADMIN_URL }}ckfinder/ckfinder.html?type=Images', -->
							<!-- //                                         filebrowserFlashBrowseUrl : '{{ $ADMIN_URL }}ckfinder/ckfinder.html?type=Flash', -->
							<!-- //                                         filebrowserUploadUrl : '{{ $ADMIN_URL }}ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files', -->
							<!-- //                                         filebrowserImageUploadUrl : '{{ $ADMIN_URL }}ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images', -->
							<!-- //                                         filebrowserFlashUploadUrl : '{{ $ADMIN_URL }}ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash' -->
							<!-- //                                       }); -->
							<!--                                   </script> -->
							<!--                             </div> -->

							<!-- 								<div class="form-group"> -->
							<!-- 									<label>Status</label> <select class="form-control select2" -->
							<!-- 										name="status" id="status" required="true" style="width: 100%;"> -->
							<!-- 										<option selected="selected" value="Actived">Actived</option> -->
							<!-- 										<option value="Blocked">Blocked</option> -->
							<!-- 									</select> -->
							<!-- 								</div> -->

							<!-- 								<div class="form-group"> -->
							<!-- 									<label>Avatar</label> <input type="file" name="hinhanh" -->
							<!-- 										required="true" /> -->
							<!-- 								</div> -->



							<div class="box-footer">
								<button class="btn btn-primary">Submit</button>

							</div>

						</div>
					</form:form>
				</div>
			</div>
		</div>


	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>