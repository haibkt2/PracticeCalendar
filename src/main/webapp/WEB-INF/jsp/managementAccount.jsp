<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Petfinder</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <div class="content-wrapper">
    <div class="box">
        <div class="box-header">
          <h3 class="box-title">List of Account</h3>
              <p style="text-align: center;">
                <a href = "${contextPath}/addUser" class="addtop"><img src="assets/img/add.png" alt="" /> 
                  <button type="button" class="btn bg-green margin">Create User</button>
                </a>
              </p>

        </div>
            <!-- /.box-header -->
    <div class="box-body">
      <table id="example1" class="table table-bordered table-striped">
        <thead>
        <tr>
          <th>User Id</th>
          <th>Full name</th>
          <th>Role</th>
          <th>Email</th>
          <th>Birthday</th>
          <th>Phone number</th>
          <th>Gender</th>
          <th>Status</th>
          <th>Edit</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listUser}" var="listUser">
          <tr>
             
            <td>${listUser.getUserId()}</td>
            <td>${listUser.getName()}</td>
            <td>${listUser.getRole().getRoleName()}</td>
            <td>${listUser.getEmail()}</td>
            <td>${listUser.getBirthday()}</td>
            <td>${listUser.getPhone()}</td>
            <td>${listUser.getGender()}</td>
            <td>${listUser.getStatus()}</td>
            <td><a href="${contextPath}/updateInfo?userid=${listUser.getUserId()}"><button>Update</button></a></td>
            
          </tr>
          </c:forEach>
        </tbody>
      </table>
      </div>
      <!-- /.box-body -->
    </div>
  </div>
  </div>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>