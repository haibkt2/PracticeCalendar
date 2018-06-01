<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Single File Upload</h1>
	<form method="post" enctype="multipart/form-data"
		action="singleSave">

		<br />
		<br /> Description: <input type="text" name="desc" /> <br>
		<div class="form-group">
		<textarea class="ckeditor" id="mess_content" required="true" rows="5"
			name="content" placeholder="Enter your email content"></textarea>
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
		<br />
		<input type="submit" value="Upload">
	</form>
</body>
</html>