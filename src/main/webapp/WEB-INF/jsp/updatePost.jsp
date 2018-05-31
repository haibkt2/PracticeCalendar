
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
<title>Insert title here</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="content-wrapper">
					<div class="box-header">
						<h3 class="box-title">Create a new Post</h3>

					</div>
					<div class="content">
						<!--  @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif -->
						<form:form action="${contextPath}/updatePost"
							modelAttribute="notifyForm">
							<div class="box-body">


								<div class="form-group">
									<form:input type="text" class="form-control" required="true"
										name="title" path="notifyId" id="fullname"
										placeholder="Enter fullname" readonly="true"/>
								</div>
								<div class="form-group">
									<label for="">Tiêu đề</label>
									<form:input type="text" class="form-control" required="true"
										name="title" path="notifyTitle" id="fullname"
										placeholder="Enter fullname" />
								</div>
								<div class="form-group">
									<label>Content</label>
									<form:textarea class="ckeditor" id="mess_content"
										required="true" rows="5" name="notifyContent"
										placeholder="Enter your email content" path="notifyContent"></form:textarea>
									<script>
										CKEDITOR
												.replace(
														'mess_content',
														{
															filebrowserBrowseUrl : '{{ $ADMIN_URL }}ckfinder/ckfinder.html',
															filebrowserImageBrowseUrl : '{{ $ADMIN_URL }}ckfinder/ckfinder.html?type=Images',
															filebrowserFlashBrowseUrl : '{{ $ADMIN_URL }}ckfinder/ckfinder.html?type=Flash',
															filebrowserUploadUrl : '{{ $ADMIN_URL }}ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
															filebrowserImageUploadUrl : '{{ $ADMIN_URL }}ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
															filebrowserFlashUploadUrl : '{{ $ADMIN_URL }}ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash'
														});
									</script>
								</div>
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
								<button type="submit" class="btn btn-primary">Submit</button>
								<a href="${contextPath}/managementPost"><button
										class="btn btn-primary" style="background-color: red">Cancel</button></a>
							</div>
							<div class="clearfix"></div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form:form>
					</div>
				</div>
			</div>


		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>