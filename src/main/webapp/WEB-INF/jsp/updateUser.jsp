
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update User</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="content-wrapper">
					<div class="box-header">
						<h3 class="box-title">Update User</h3>
						<br>
						${messUpdate}
					</div>
					<div class="content">
						<form:form action = "${contextPath}/updateInfo" modelAttribute="userForm">
							<div class="box-body">

								<div class="form-group">
									<label for="">User Id</label>
									<form:input type="text" path="userId" class="form-control"
										required="true" name="userId" id="username"
										readonly="true" />
								</div>

								<div class="form-group">
									<label for="">Full of name</label>
									<form:input type="text" path="name" class="form-control"
										required="true" name="fullname" id="fullname"
										/>
								</div>

								<div class="form-group">
									<label>Role</label>
									<form:select class="form-control select2" name="role" id="role"
										required="true" style="width: 100%;" path="role">
										<c:forEach items="${lstRole}" var="items">
											<option value="<c:out value = "${items.roleId}"/>"
												${items.roleId == 1 ? 'selected' : ''}><c:out
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
										class="form-control" />
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

									<div class="input-group">
										<label>Birthday</label>
										<form:input type="date" id="birthday" name="birthday" path="birthday" class="form-control" placeholder="'dd/mm/yyyy'"/> 
									</div>

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