<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
                    <form role="form" action="#" method="post" enctype="multipart/form-data">
                        <div class="box-body">
                            <div class="form-group">
                              <label for="">User Id</label>
                              <input type="text" class="form-control" required="true" name="username" id="username" placeholder="Enter username">
                            </div>

                            <div class="form-group">
                              <label for="">Full of name</label>
                              <input type="text" class="form-control" required="true" name="fullname" id="fullname" placeholder="Enter fullname">
                            </div>

                            <div class="form-group">
                                <label>Role</label>
                                <select class="form-control select2" name="role" id="role" required="true" style="width: 100%;">
                                    <option selected="false" value="">Option 1</option>
                                    <option selected="false" value="">Option 1</option>
                                    <option selected="false" value="">Option 1</option>
                                    <option selected="false" value="">Option 1</option>
                                </select>
                            </div>

                            <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input type="email" class="form-control" required="true" name="email" id="email" placeholder="Enter email">
                            </div>

                            <div class="form-group">
                                <label>Phone number:</label>

                                <input type="tel" required="true" pattern="^[0-9-+s()]*$" name="phone_number" id="phone_number" class="form-control" placeholder="Enter your phone number">
                                <!-- /.input group -->
                            </div>

                            <div class="form-group">
                                <label>Gender</label>
                                <select class="form-control select2" name="gender" id="gender" required="true" style="width: 100%;">
                                  <option selected="selected">Man</option>
                                  <option>Women</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Date masks:</label>

                                <div class="input-group">
                                  <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                  </div>
                                  <input type="date" id="birthday" name="birthday" class="form-control" placeholder ="'dd/mm/yyyy'" data-mask>
                                </div>
                                <!-- /.input group -->
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

                            <div class="form-group">
                                <label>Status</label>
                                <select class="form-control select2" name="status" id="status" required="true" style="width: 100%;">
                                  <option selected="selected">Actived</option>
                                  <option>Blocked</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Avatar</label>
                                <input type="file" name="hinhanh" required="true" />
                            </div>
                            </div>
                          <!-- /.box-body -->

                          <div class="box-footer">
                            <button type="submit" class="btn btn-primary">Submit</button>
                          </div>

                        <div class="clearfix"></div>
                    </form>
                </div>
            </div>
        </div>


    </div>
</div>
</body>
</html>