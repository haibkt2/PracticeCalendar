
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body lass="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="content-wrapper">
					<div class="box-header">
						<h3 class="box-title">Create a new account</h3>
						<c:choose>
							<c:when test="${message=='1'}">
								<spring:message code="msg.save.success" />
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="content">
						<form:form action="${contextPath}/addUser"
							modelAttribute="userForm" method="POST">
							<div class="box-body">

								<div class="form-group">
									<label for="">User Id</label>
									<form:input type="text" path="userId" class="form-control"
										required="true" name="userId" id="username"
										placeholder="Enter User Id" />
								</div>

								<div class="form-group">
									<label for="">Full of name</label>
									<form:input type="text" path="name" class="form-control"
										required="true" name="fullname" id="fullname"
										placeholder="Enter fullname" />
								</div>

								<div class="form-group">
									<label>Role</label>
									<form:select class="form-control select2" name="role" id="role"
										required="true" style="width: 100%;" path="role">
										<c:forEach items="${lstRole}" var="items">
											<option value="<c:out value = "${items.roleId}"/>"
												${items.roleId == 2 ? 'selected' : ''}><c:out
													value="${items.roleName}" /></option>
										</c:forEach>
									</form:select>
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label>
									<form:input type="email" class="form-control" required="true"
										name="email" id="email" placeholder="Enter email" path="email" />
								</div>

								<div class="form-group">
									<label>Phone number:</label>
									<form:input type="tel" path="phone" required="true"
										class="form-control" placeholder="Enter your phone number" />
								</div>

								<div class="form-group">
									<label>Gender</label> <select class="form-control select2"
										name="gender" id="gender" required="true" style="width: 100%;">
										<option selected="selected" value="Man">Man</option>
										<option value="Women">Women</option>
									</select>
								</div>

								<!-- 								<div class="form-group"> -->
								<!-- 									<label>Date masks:</label> -->

								<!-- 									<div class="input-group"> -->
								<!-- 										<div class="input-group-addon"> -->
								<!-- 											<i class="fa fa-calendar"></i> -->
								<!-- 										</div> -->
								<!-- 										<input type="date" id="birthday" name="birthday" -->
								<!-- 											class="form-control" placeholder="'dd/mm/yyyy'"> -->
								<!-- 									</div> -->
								<!-- 								</div> -->

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

								<div class="form-group">
									<label>Status</label> <select class="form-control select2"
										name="status" id="status" required="true" style="width: 100%;">
										<option selected="selected" value="Actived">Actived</option>
										<option value="Blocked">Blocked</option>
									</select>
								</div>

								<!-- 								<div class="form-group"> -->
								<!-- 									<label>Avatar</label> <input type="file" name="hinhanh" -->
								<!-- 										required="true" /> -->
								<!-- 								</div> -->
							</div>
							<!-- /.box-body -->

							<div class="box-footer">
								<button class="btn btn-primary">Submit</button>
							</div>

							<div class="clearfix"></div>
						</form:form>
					</div>
				</div>
			</div>


		</div>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>