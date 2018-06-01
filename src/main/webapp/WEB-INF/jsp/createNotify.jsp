<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="header.jsp"></jsp:include><html>
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
						<form
							action="${contextPath}/savePost?${_csrf.parameterName}=${_csrf.token}"
							method="POST" enctype="multipart/form-data">
							<div class="box-body">


								<div class="form-group">
									<label for="">Tiêu đề</label> <input type="text"
										class="form-control" required="true" name="title"
										id="fullname" placeholder="Enter fullname">
								</div>
								<div class="form-group">
									<label>Content</label>
									<textarea class="ckeditor" id="mess_content" required="true"
										rows="5" name="content" placeholder="Enter your email content"></textarea>
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
								<br> Upload File: <input type="file" name="file"> <br />
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
							<div class="clearfix"></div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
						<a href="${contextPath}/managementPost"><button
								class="btn btn-cancel"
								style="background-color: red; margin-left: 12px">Cancel</button></a>
					</div>
				</div>
			</div>


		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>