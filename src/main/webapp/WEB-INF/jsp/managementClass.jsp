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
          <h3 class="box-title">List of Room</h3>
              <p style="text-align: center;">
                <a href = "${contextPath}/addUser" class="addtop"><img src="assets/img/add.png" alt="" /> 
<!--                   <button type="button" class="btn bg-green margin">Create Post</button> -->
                </a>
              </p>

        </div>
            <!-- /.box-header -->
    <div class="box-body">
      <table id="example1" class="table table-bordered table-striped">
        <thead>
        <tr>
          <th>STT</th>
          <th>Room Name</th>
          <th>Room Type</th>
          <th>Room Status</th>
          <th>Quantum</th>
          <th>Info</th>
          <th>Update</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listRm}" var="listRm" varStatus="loopR">
          <tr>
             
            <td>${loopR.index + 1}</td>
            <td><a href="#">${listRm.getRoomName()}</a></td>
            <td>${listRm.getRoomType().getRoomTypeValue()}</td>
            <td>${listRm.getRoomStatus().getRoomStatusValue()}</td>
            <td>${listRm.getOrderMax()}</td>
            <td>${listRm.getInfo()}</td>
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