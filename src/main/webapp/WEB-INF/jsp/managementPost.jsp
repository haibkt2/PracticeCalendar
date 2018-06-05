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
  <title>Management Post</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <div class="content-wrapper">
    <div class="box">
        <div class="box-header">
          <h3 class="box-title">List of Post</h3>
              <p style="text-align: center;">
                <a href = "${contextPath}/createNotify" class="addtop"><img src="assets/img/add.png" alt="" /> 
                  <button type="button" class="btn bg-green margin">Create Post</button>
                  
                </a>
               
              </p>
<p style="text-align: center;color: blue;"> ${mess_nt}</p>
        </div>
            <!-- /.box-header -->
    <div class="box-body">
      <table id="example1" class="table table-bordered table-striped">
        <thead>
        <tr>
          <th>STT</th>
          <th>Summary</th>
          <th>Content</th>
          <th>User</th>
          <th>Date</th>
          <th>Edit</th>
          <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listNt}" var="listNt" varStatus="loop">
          <tr>
             
            <td>${loop.index+1 }</td>
            <td>${listNt.getNotifyTitle()}</td>
             <td>${listNt.getNotifyContent()}</td>
            <td>${listNt.getUser().getName()}</td>
            <td>${listNt.getCreateDate()}</td>
            <td><a href="${contextPath}/updatePost?updatePid=${listNt.getNotifyId()}"><button>Update</button></a></td>
            <td><a href="${contextPath}/updatePost?deletePid=${listNt.getNotifyId()}"><button>Delete</button></a></td>
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