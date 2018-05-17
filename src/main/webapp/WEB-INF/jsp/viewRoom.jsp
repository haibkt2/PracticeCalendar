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
<title>Practice</title>
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
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">List of Class</h3>
					<div class="input-group" style="margin-left: 440px;">
						<input type="text" id="date-picker" class="picker"
							readonly="readonly" value="<%=request.getParameter("d")%>" />
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
						<tbody>
							<c:forEach items="${listRoom}" var="listRoom">
								<tr>
									<td>${listRoom.getRoomName()}</td>
									<td>${listRoom.getRoomType().getRoomTypeValue()}</td>
									<td>${listRoom.getOrderMin()}/${listRoom.getOrderMax()}</td>
									<td>${listRoom.getRoomStatus().getRoomStatusValue()}</td>
									<td><a
										href="${contextPath}/orderCalendar?roomName=${listRoom.getRoomName()}">
											<button
												${listRoom.getOrderMax() < listRoom.getOrderMin()
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
				</div>
				<br> <br>
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
						<tbody>
							<c:forEach items="${listRoom}" var="listRoom">
								<tr>
									<td>${listRoom.getRoomName()}</td>
									<td>${listRoom.getRoomType().getRoomTypeValue()}</td>
									<td>${listRoom.getOrderMin()}/${listRoom.getOrderMax()}</td>
									<td>${listRoom.getRoomStatus().getRoomStatusValue()}</td>
									<td><a
										href="${contextPath}/viewRoom?roomName=${listRoom.getRoomName()}"><button>Delete</button></a>
										<a
										href="${contextPath}/viewRoom?roomName=${listRoom.getRoomName()}"><button>Off</button></a>
									</td>
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