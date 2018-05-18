<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Room</title>
<link href="${contextPath}/resources/css/multifreezer.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
  rel="stylesheet">
<link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"
  rel="stylesheet">
<script src="${contextPath}/resources/js/jquery-1.12.1.min.js"></script>
<script src="${contextPath}/resources/js/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/js/pagination.js"></script>
<script src="${contextPath}/resources/js/materialize.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/multifreezer.js"></script>
<script src="${contextPath}/resources/js/jquery-ui.js"></script>
</head>
<script>
  $(document)
      .ready(
          function() {
            $("#date-picker")
                .datepicker(
                    {
                      dateFormat : 'yy/mm/dd',
                      onSelect : function(dateText, inst) {
                        var queryParameters = {}, queryString = location.search
                            .substring(1), re = /([^&=]+)=([^&]*)/g, m;
                        while (m = re.exec(queryString)) {
                          queryParameters[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
                        }
                        queryParameters['d'] = dateText;
                        location.search = $.param(queryParameters);
                      },
                      changeMonth : true,
                      changeYear : true,
                      yearRange : "1950:2050"
                    });
            $('#tableBody').pageMe({
              pagerSelector : '#page_number',
              showPrevNext : true,
              perPage : 20
            });
          });
</script>
<jsp:include page="testHead.jsp"></jsp:include>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">List of Class</h3>
					<div class="form-group">
						<div class="input-group" style="margin-left: 440px;">
							<input type="text" id="date-picker" class="picker"
								readonly="readonly" value="<%=request.getParameter("d")%>" />
						</div>
					</div>

				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table id="example1" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>Class Name</th>
								<th>Room Type</th>
								<th>Quantity Order</th>
								<th>Status Class</th>
								<th>Order</th>
							</tr>
						</thead>
						<tbody id="tableBody">
							<c:forEach items="${listRoom}" var="listRoom">
								<tr>
									<td>${listRoom.getRoomName()}</td>
									<td>${listRoom.getRoomType().getRoomTypeValue()}</td>
									<td>${listRoom.getOrderCalendar().getOrderMin()}/${listRoom.getOrderMax()}</td>
									<td>${listRoom.getRoomStatus().getRoomStatusValue()}</td>
									<td><a
										href="${contextPath}/orderCalendar?roomName=${listRoom.getRoomName()}">
											<button
												${listRoom.getOrderMax() < listRoom.getOrderCalendar().getOrderMin()
            ||
            (listRoom.getRoomType().getRoomTypeValue() eq 'Private' && UserLogin.getRole().getRoleName() ne 'ROLE_ADMIN')
            ||
            (listRoom.getRoomType().getRoomTypeValue() eq 'Protected' && ( UserLogin.getRole().getRoleName() ne 'ROLE_ADMIN' || UserLogin.getRole().getRoleName() ne 'ROLE_TEACHER'))
            ? 'disabled="disabled"': ''}>
												Order</button>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 paginate">
						<ul class="pagination" id="page_number"></ul>
					</div>
				</div>
				<br> <br>
<!-- 				<div class="box-body"> -->
<!-- 					<table id="example1" class="table table-bordered table-striped"> -->
<!-- 						<thead> -->
<!-- 							<tr> -->
<!-- 								<th>Class Name</th> -->
<!-- 								<th>Room Type</th> -->
<!-- 								<th>Quantity Order</th> -->
<!-- 								<th>Status Class</th> -->
<!-- 								<th>Order</th> -->
<!-- 							</tr> -->
<!-- 						</thead> -->
<!-- 						<tbody> -->
<%-- 							<c:forEach items="${listRoom}" var="listRoom"> --%>
<!-- 								<tr> -->
<%-- 									<td>${listRoom.getRoomName()}</td> --%>
<%-- 									<td>${listRoom.getRoomType().getRoomTypeValue()}</td> --%>
<%-- 									<td>${listRoom.getOrderMin()}/${listRoom.getOrderMax()}</td> --%>
<%-- 									<td>${listRoom.getRoomStatus().getRoomStatusValue()}</td> --%>
<!-- 									<td><a -->
<%-- 										href="${contextPath}/viewRoom?roomName=${listRoom.getRoomName()}"><button>Delete</button></a> --%>
<!-- 										<a -->
<%-- 										href="${contextPath}/viewRoom?roomName=${listRoom.getRoomName()}"><button>Off</button></a> --%>
<!-- 									</td> -->
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>
<!-- 						</tbody> -->
<!-- 					</table> -->
<!-- 				</div> -->
				<!-- /.box-body -->
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>