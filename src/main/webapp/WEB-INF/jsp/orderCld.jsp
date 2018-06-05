<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Booking Calendar</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="content-wrapper">
                <div class="box-header">
                  <h3 class="box-title">Order</h3>                     
				<div class="box-body">
      <table id="example1" class="table table-bordered table-striped">
        <thead>
        <tr>
          <th>Full name</th>
          <th>Date Order</th>
          <th>Class</th>
          <th>Time Order</th>
          <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listUser}" var="listUser">
          <tr>
            <td>${UserLogin.getName()}</td>
            <td>Date Order</td>
            <td>Class</td>
            <td>Time Order</td>
            <td><a href="${contextPath}/updateInfo?userid=${listUser.getUserId()}"><button>Delete</button></a></td>
          </tr>
          <tr>
            <td>${UserLogin.getName()}</td>
            <td>Date Order</td>
            <td>Class</td>
            <td>Time Order</td>
            <td><a href="${contextPath}/updateInfo?userid=${listUser.getUserId()}"><button>Delete</button></a></td>
          </tr>
          <tr>
            <td>${UserLogin.getName()}</td>
            <td>Date Order</td>
            <td>Class</td>
            <td>Time Order</td>
            <td><a href="${contextPath}/updateInfo?userid=${listUser.getUserId()}"><button>Delete</button></a></td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
      </div>
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
                              <label for="">Username</label>
                              <input type="text" class="form-control" required="true" name="username" id="username" placeholder="Enter username">
                            </div>

                            <div class="form-group">
                              <label>Date Order:</label>

                              <div class="input-group">
                                <div class="input-group-addon">
                                  <i class="fa fa-calendar"></i>
                                </div>
                                <input type="date" id="date" name="date" class="form-control" placeholder ="'dd/mm/yyyy'" data-mask>
                              </div>
                              <!-- /.input group -->
                            </div>

                            <div class="form-group">
                                <label>Time</label>
                                <select class="form-control select2" name="role" id="role" required="true" style="width: 100%;">
                                    <option selected="false" value="">The Morning</option>
                                    <option selected="false" value="">The Lunch</option>
                                    <option selected="false" value="">The Afternoon</option>
                                    <option selected="false" value="">The Evening</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Class</label>
                                <select class="form-control select2" name="role" id="role" required="true" style="width: 100%;">
                                    <option selected="false" value="">Class 1</option>
                                    <option selected="false" value="">Class 2</option>
                                    <option selected="false" value="">Class 3</option>
                                    <option selected="false" value="">Class 4</option>
                                    <option selected="false" value="">Class 5</option>
                                </select>
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
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>