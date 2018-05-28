<%@page import="PracticeCalendar.Model.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | User Profile</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper1">

		<!-- Content Wrapper. Contains page content -->
		<div class="content">
			<!-- Content Header (Page header) -->

			<!-- Main content -->
			<section class="content">

				<div class="row">
					<div class="col-md-3">

						<jsp:include page="profile.jsp"></jsp:include>

					</div>
					<!-- /.col -->
					<div class="col-md-9">
						<hr style="margin-top: 1px" />
						<div class="nav-tabs-custom">
							<jsp:include page="headerUser.jsp"></jsp:include>
							<div class="tab-content">
								<div>
									<div class="">
										<div class="">
											<div class="">
												<jsp:include page="testHead.jsp"></jsp:include>
												<section class="content-header">
													<div id="header-info-center">
														<div id="header-time"
															style="padding-top: 10px; text-align: center; color: red; font-size: 40px;"></div>
													</div>
													<input type="hidden" id="serverTime" />
												</section>
												<hr>
											</div>
											<!-- /.box-header -->
											<div class="box-body">
												<table id="example1"
													class="table table-bordered table-striped"
													style="font-size: 14px;">
													<thead style="background-color: #2fb7d8">
														<tr>
															<th style="color: black;">Room</th>
															<%
																List<String> setDay = (List) request.getAttribute("setDay");
																for (int i = 0; i < setDay.size(); i++) {
																	if (setDay.get(i).substring(0, 3).equals("Sat") || setDay.get(i).substring(0, 3).equals("Sun")) {
															%>
															<th style="color: black; background-color: red"><%=setDay.get(i)%></th>

															<%
																} else {
															%>
															<th style="color: black;"><%=setDay.get(i)%></th>
															<%
																}
																}
															%>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${listRoom}" var="listRoom">
															<%
																String oder_min = ((Room) pageContext.findAttribute("listRoom")).getOrderMax();
															%>
															<tr>
																<td>
																	<button type="button" class="btn btn-primary"
																		data-toggle="modal"
																		data-target="#class-info${listRoom.getRoomName()}"
																		style="margin-top: 15px;">${listRoom.getRoomName()}</button>
																	<div class="modal fade"
																		id="class-info${listRoom.getRoomName()}" tabindex="-1"
																		role="dialog" aria-labelledby="exampleModalLongTitle"
																		aria-hidden="true">
																		<div class="modal-dialog" role="document">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h2 class="modal-title" id="exampleModalLongTitle">Chi
																						tiết phòng</h2>
																					<button type="button" class="close"
																						data-dismiss="modal" aria-label="Close">
																						<span aria-hidden="true">&times;</span>
																					</button>
																				</div>
																				<div class="modal-body">
																					<p>Tên: ${listRoom.getRoomName()}</p>
																					<p>Trạng thái: Sẵn sàng</p>
																					<p>Số lượng hiện tại: 10</p>
																					<h2>Danh sách các thiết bị</h2>

																					<table class="table table-striped"
																						style="font-size: 16px !important">
																						<thead>
																							<tr>
																								<th style="color: #337ab7;"col">#</th>
																								<th style="color: #337ab7;"col">Tên</th>
																								<th style="color: #337ab7;"col">Loại</th>
																								<th style="color: #337ab7;"col">Trạng thái</th>
																							</tr>
																						</thead>
																						<tbody>
																							<tr>
																								<th scope="row">1</th>
																								<td>Mark</td>
																								<td>Otto</td>
																								<td>@mdo</td>
																							</tr>
																							<tr>
																								<th scope="row">2</th>
																								<td>Jacob</td>
																								<td>Thornton</td>
																								<td>@fat</td>
																							</tr>
																							<tr>
																								<th scope="row">3</th>
																								<td>Larry</td>
																								<td>the Bird</td>
																								<td>@twitter</td>
																							</tr>
																						</tbody>
																					</table>
																				</div>
																				<div class="modal-footer">
																					<button type="button" class="btn btn-secondary"
																						data-dismiss="modal">Close</button>
																					<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
																				</div>
																			</div>
																		</div>
																	</div> <c:forEach begin="0" end="6" varStatus="loopday">
																		<!-- 																		ss -->
																		<%
																			int i = 0;
																					int j = 0;
																					String b_cl_s = "#00c0ef52";
																					String b_cl_c = "#00c0ef52";
																					List<User> students_s = new ArrayList();
																					List<User> students_c = new ArrayList();
																		%>
																		<c:if
																			test="${setDay.get(loopday.index).substring(0,3) eq 'Sun'}">
																			<td style="background-color: #00c0ef52"><c:choose>
																					<c:when
																						test="${UserLogin.getRole().getRoleName() eq 'ROLE_STUDENT' }">
																						<a data-toggle="modal" data-target="#booking-info">
																							Day Off </a>
																					</c:when>
																					<c:otherwise>
																						<c:if test="${empty listRoom.getRequestCalendar()}">
																						<a data-toggle="modal" data-target="#booking-info">
																							Sáng : Request </a>
																						<a data-toggle="modal" data-target="#booking-info">
																							Chiều : Request </a>
																						</c:if>
																						${listRoom.getRequestCalendar().getReqId()}
																					</c:otherwise>
																				</c:choose></td>
																		</c:if>
																		<c:if
																			test="${setDay.get(loopday.index).substring(0,3) ne 'Sun'}">
																			<c:choose>
																				<c:when test="${empty listRoom.getOrderCalendar()}">
																					<!-- 																			dd -->
																					<td style="background-color: #00c0ef52"><a
																						href="${contextPath}/<%if(b_cl_s.equals("red") || Integer.parseInt(oder_min) < i){%>#yourpet<%} else {%>orderCalendar?room=${listRoom.getRoomName()}&dayBooking=${setDay.get(loopday.index).substring(4,9)}&timeBooking=Morning<%}%>"
																						style="background-color: #00c0ef52"> <span>
																								Sáng: </span> <strong
																							style="padding-left: 10px; padding-right: 5px;">
																								<a data-toggle="modal"
																								data-target="#booking-info${listRoom.getRoomName()}${loopday.index}s">
																									0/${listRoom.getOrderMax() }</a>
																						</strong>
																					</a><a
																						href="${contextPath}/<%if(b_cl_s.equals("red") || Integer.parseInt(oder_min) < i){%>#yourpet<%} else {%>orderCalendar?room=${listRoom.getRoomName()}&dayBooking=${setDay.get(loopday.index).substring(4,9)}&timeBooking=Noon<%}%>"
																						style="background-color: #00c0ef52"> <span>
																								Chiều: </span> <strong
																							style="padding-left: 10px; padding-right: 4px;">
																								<a data-toggle="modal"
																								data-target="#booking-info${listRoom.getRoomName()}${loopday.index}c">
																									0/${listRoom.getOrderMax() }</a>
																						</strong>
																					</a></td>
																				</c:when>
																				<c:otherwise>

																					<c:forEach items="${listRoom.getOrderCalendar()}"
																						var="lsOrder" varStatus="orderIndex">
																						<c:set var="isDay"
																							value="${lsOrder.setDateString().substring(0, 5)}" />

																						<c:choose>

																							<c:when
																								test="${isDay eq setDay.get(loopday.index).substring(4,9)}">
																								<c:if
																									test="${lsOrder.getTimeOrder() eq 'Morning' && lsOrder.getFlg() eq '1'}">
																									<%
																										students_s.add(i, ((OrderCalendar) pageContext.findAttribute("lsOrder"))
																																					.getUser());
																																			i++;
																									%>
																									<c:if
																										test="${lsOrder.getUser().getUserId() eq UserLogin.getUserId() && lsOrder.getFlg() eq '1'}">
																										<%
																											b_cl_s = "red";
																										%>
																									</c:if>
																								</c:if>
																								<c:if
																									test="${lsOrder.getTimeOrder() eq 'Noon' && lsOrder.getFlg() eq '1'}">
																									<%
																										students_c.add(j, ((OrderCalendar) pageContext.findAttribute("lsOrder"))
																																					.getUser());
																																			j++;
																									%>
																									<c:if
																										test="${lsOrder.getUser().getUserId() eq UserLogin.getUserId() && lsOrder.getFlg() eq '1'}">
																										<%
																											b_cl_c = "red";
																										%>
																									</c:if>
																								</c:if>
																							</c:when>
																						</c:choose>
																					</c:forEach>
																					<td style="background-color: #00c0ef52"><a
																						href="${contextPath}/<%if(b_cl_s.equals("red") || Integer.parseInt(oder_min) < i){%>#yourpet<%} else {%>orderCalendar?room=${listRoom.getRoomName()}&dayBooking=${setDay.get(loopday.index).substring(4,9)}&timeBooking=Morning<%}%>"
																						style="background-color: <%=b_cl_s%>"> <span>
																								Sáng: </span> <strong
																							style="padding-left: 10px; padding-right: 5px;">
																								<a data-toggle="modal"
																								data-target="#booking-info${listRoom.getRoomName()}${loopday.index}s"><%=i%>/${listRoom.getOrderMax() }</a>
																						</strong>
																					</a><a
																						href="${contextPath}/<%if(b_cl_c.equals("red") || Integer.parseInt(oder_min) < j){%>#yourpet<%} else {%>orderCalendar?room=${listRoom.getRoomName()}&dayBooking=${setDay.get(loopday.index).substring(4,9)}&timeBooking=Noon<%}%>"
																						style="background-color: <%=b_cl_c%>"> <span>
																								Chiều: </span> <strong
																							style="padding-left: 10px; padding-right: 5px;">
																								<a data-toggle="modal"
																								data-target="#booking-info${listRoom.getRoomName()}${loopday.index}c"><%=j%>/${listRoom.getOrderMax() }</a>
																						</strong>
																					</a></td>
																				</c:otherwise>

																			</c:choose>
																		</c:if>
																		<div class="modal fade"
																			id="booking-info${listRoom.getRoomName()}${loopday.index}s"
																			tabindex="-1" role="dialog"
																			aria-labelledby="exampleModalLongTitle"
																			aria-hidden="true">
																			<div class="modal-dialog" role="document">
																				<div class="modal-content">
																					<div class="modal-header">
																						<h2 class="modal-title" id="exampleModalLongTitle">Chi
																							tiết phòng</h2>
																						<button type="button" class="close"
																							data-dismiss="modal" aria-label="Close">
																							<span aria-hidden="true">&times;</span>
																						</button>
																					</div>
																					<div class="modal-body">
																						<p>Tên: ${listRoom.getRoomName()}</p>
																						<p>Trạng thái: ${listRoom.getRoomName()}</p>
																						<p>
																							Số lượng hiện tại:
																							<%=i%>

																						</p>
																						<h2>Danh sách người đăng ký</h2>
																						<%
																							for (User u : students_s) {
																						%>
																						<%=u.getName()%>
																						-
																						<%=u.getUserId()%>
																						<br>

																						<%
																							}
																						%>

																					</div>
																					<div class="modal-footer">
																						<button type="button" class="btn btn-secondary"
																							data-dismiss="modal">Close</button>
																						<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="modal fade"
																			id="booking-info${listRoom.getRoomName()}${loopday.index}c"
																			tabindex="-1" role="dialog"
																			aria-labelledby="exampleModalLongTitle"
																			aria-hidden="true">
																			<div class="modal-dialog" role="document">
																				<div class="modal-content">
																					<div class="modal-header">
																						<h2 class="modal-title" id="exampleModalLongTitle">Chi
																							tiết phòng</h2>
																						<button type="button" class="close"
																							data-dismiss="modal" aria-label="Close">
																							<span aria-hidden="true">&times;</span>
																						</button>
																					</div>
																					<div class="modal-body">
																						<p>Tên: ${listRoom.getRoomName()}</p>
																						<p>Trạng thái: ${listRoom.getRoomName()}</p>
																						<p>
																							Số lượng hiện tại:
																							<%=j%>

																						</p>
																						<h2>Danh sách người đăng ký</h2>
																						<%
																							for (User u : students_c) {
																						%>
																						<%=u.getName()%>
																						-
																						<%=u.getUserId()%>
																						<br>
																						<%
																							}
																						%>
																					</div>
																					<div class="modal-footer">
																						<button type="button" class="btn btn-secondary"
																							data-dismiss="modal">Close</button>
																						<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
																					</div>
																				</div>
																			</div>
																		</div>
																	</c:forEach>
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
								<!-- /.tab-pane -->
								<!-- /.tab-pane -->
							</div>
							<!-- /.tab-content -->
						</div>
						<!-- /.nav-tabs-custom -->
					</div>
					>
					<!-- /.col -->
				</div>
				<!-- /.row -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<div class="control-sidebar-bg"></div>

	</div>
</body>
</html>