<%@page import="PracticeCalendar.Model.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false"%>
<jsp:useBean id="now" class="java.util.Date" />
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:formatDate var="date" value="${now}" pattern="yyyy-MM-dd" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Practice Calendar</title>
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
												<%-- 												<jsp:include page="testHead.jsp"></jsp:include> --%>
												<!-- 												<section class="content-header"> -->
												<!-- 													<div id="header-info-center"> -->
												<!-- 														<div id="header-time" -->
												<!-- 															style="padding-top: 10px; text-align: center; color: red; font-size: 40px;"></div> -->
												<!-- 													</div> -->
												<!-- 													<input type="hidden" id="serverTime" /> -->
												<!-- 												</section> -->
												<hr>
											</div>
											<!-- /.box-header -->
											<div class="box-body">
											<div style="text-align: right;padding: 20px" >
												* <a style="background-color: red; padding-right: 5px;"> <span>
														Sáng </span> </a> <i style="padding-left: 2px;">You have set</i></div>
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
																			id="class-info${listRoom.getRoomName()}"
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
																						<p>Tên : ${listRoom.getRoomName()}</p>
																						<p>Trạng thái :
																							${listRoom.getRoomStatus().getRoomStatusValue()}
																						</p>
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
																								<c:forEach items="${listRoom.getDevices()}"
																									var="ldv" varStatus="loopdv">

																									<tr>
																										<th scope="row">${loopdv.index + 1}</th>
																										<td>${ldv.getDeviceName()}</td>
																										<td>Máy Tính</td>
																										<td>Activity</td>
																									</tr>
																									
																								</c:forEach>
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
																			<!-- 																		is sun -->
																			<c:if
																				test="${setDay.get(loopday.index).substring(0,3) eq 'Sun'}">
																				<td style="background-color: #00c0ef52"><c:choose>
																						<c:when
																							test="${UserLogin.getRole().getRoleName() eq 'ROLE_STUDENT' }">
																							<a data-toggle="modal"
																								data-target="#booking-info"> Day Off </a>
																						</c:when>
																						<c:otherwise>
																							<c:if
																								test="${empty listRoom.getRequestCalendar()}">
																								<a style="background-color: #00c0ef52"> <span>
																										Sáng: </span> <strong
																									style="padding-left: 2px; padding-right: 2px;">
																										<a
																										href="/request?room=${listRoom.getRoomName()}&dayBooking=${setDay.get(loopday.index).substring(4,9)}&timeBooking=Morning">
																											Request </a>
																								</strong>
																								</a>
																								<a style="background-color: #00c0ef52"> <span>
																										Chiều: </span> <strong
																									style="padding-left: 00px; padding-right: 0px;">
																										<a
																										href="/request?room=${listRoom.getRoomName()}&dayBooking=${setDay.get(loopday.index).substring(4,9)}&timeBooking=Noon">
																											Request </a>
																								</strong>
																								</a>
																							</c:if>
																							<c:if
																								test="${not empty listRoom.getRequestCalendar()}">
																								<%
																									int ri = 0;
																															int rj = 0;
																															String status_s = "";
																															String status_c = "";
																								%>
																								<c:forEach
																									items="${listRoom.getRequestCalendar()}"
																									var="lRq">
																									<c:if
																										test="${lRq.getTimeOrder() eq 'Morning' and  lRq.getDateReq() ge date}">
																										<%
																											ri++;
																																			status_s = ((Request) pageContext.findAttribute("lRq")).getStatus();
																										%>
																									</c:if>
																									<c:if
																										test="${lRq.getTimeOrder() eq 'Noon' and  lRq.getDateReq() ge date}">
																										<%
																											rj++;
																																			status_c = ((Request) pageContext.findAttribute("lRq")).getStatus();
																										%>
																									</c:if>

																								</c:forEach>
																								<a style="background-color: #00c0ef52"> <span>
																										Sáng: </span> <strong
																									style="padding-left: 2px; padding-right: 2px;">
																										<%
																											if (ri > 0) {
																										%> <a data-toggle="modal"
																										style="color: red"
																										data-target="#request-info${listRoom.getRoomName()}${loopday.index}s">
																											<%=status_s%>
																									</a> <%
 	} else {
 %> <a
																										href="/request?room=${listRoom.getRoomName()}&dayBooking=${setDay.get(loopday.index).substring(4,9)}&timeBooking=Morning">
																											Request </a> <%
 	}
 %>
																								</strong>
																								</a>
																								<a style="background-color: #00c0ef52"> <span>
																										Chiều: </span> <strong
																									style="padding-left: 0px; padding-right: 0px;">
																										<%
																											if (rj > 0) {
																										%> <a data-toggle="modal"
																										style="color: red"
																										data-target="#request-info${listRoom.getRoomName()}${loopday.index}c">
																											<%=status_c%>
																									</a> <%
 	} else {
 %> <a
																										href="/request?room=${listRoom.getRoomName()}&dayBooking=${setDay.get(loopday.index).substring(4,9)}&timeBooking=Noon">
																											Request </a> <%
 	}
 %>
																								</strong>
																								</a>
																							</c:if>

																						</c:otherwise>
																					</c:choose></td>
																			</c:if>
																			<!-- 																		is not sun -->
																			<c:if
																				test="${setDay.get(loopday.index).substring(0,3) ne 'Sun'}">
																				<!-- 																			is student -->
																				<c:if
																					test="${UserLogin.getRole().getRoleName() eq 'ROLE_STUDENT' }">
																					<c:choose>
																						<c:when
																							test="${empty listRoom.getOrderCalendar()}">
																							<!-- 																			dd -->
																							<td style="background-color: #00c0ef52"><a
																								href="${contextPath}/<%if(b_cl_s.equals("red") || Integer.parseInt(oder_min) < i){%>#yourpet<%} else {%>orderCalendar?room=${listRoom.getRoomName()}&dayBooking=${setDay.get(loopday.index).substring(4,9)}&timeBooking=Morning<%}%>"
																								style="background-color: #00c0ef52"> <span>
																										Sáng: </span> <strong
																									style="padding-left: 2px; padding-right: 2px;">
																										<a data-toggle="modal"
																										data-target="#booking-info${listRoom.getRoomName()}${loopday.index}s">
																											0/${listRoom.getOrderMax() } </a>
																								</strong>
																							</a><a
																								href="${contextPath}/<%if(b_cl_s.equals("red") || Integer.parseInt(oder_min) < i){%>#yourpet<%} else {%>orderCalendar?room=${listRoom.getRoomName()}&dayBooking=${setDay.get(loopday.index).substring(4,9)}&timeBooking=Noon<%}%>"
																								style="background-color: #00c0ef52"> <span>
																										Chiều: </span> <strong
																									style="padding-left: 0px; padding-right: 0px;">
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
																												students_s.add(i,
																																								((OrderCalendar) pageContext.findAttribute("lsOrder"))
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
																												students_c.add(j,
																																								((OrderCalendar) pageContext.findAttribute("lsOrder"))
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
																				<!-- 																			is teacher -->
																				<c:if
																					test="${UserLogin.getRole().getRoleName() ne 'ROLE_STUDENT' }">
																					<c:choose>
																						<c:when
																							test="${empty listRoom.getOrderCalendar()}">
																							<!-- 																			dd -->
																							<td style="background-color: #00c0ef52"><a
																								href="${contextPath}/<%if(b_cl_s.equals("red") || Integer.parseInt(oder_min) < i){%>#yourpet<%} else {%>orderCalendar?room=${listRoom.getRoomName()}&dayBooking=${setDay.get(loopday.index).substring(4,9)}&timeBooking=Morning<%}%>"
																								style="background-color: #00c0ef52"> <span>
																										Sáng: </span> <strong
																									style="padding-left: 2px; padding-right: 2px;">
																										<a data-toggle="modal"
																										data-target="#booking-info${listRoom.getRoomName()}${loopday.index}s">
																											Free</a>
																								</strong>
																							</a><a
																								href="${contextPath}/<%if(b_cl_s.equals("red") || Integer.parseInt(oder_min) < i){%>#yourpet<%} else {%>orderCalendar?room=${listRoom.getRoomName()}&dayBooking=${setDay.get(loopday.index).substring(4,9)}&timeBooking=Noon<%}%>"
																								style="background-color: #00c0ef52"> <span>
																										Chiều: </span> <strong
																									style="padding-left: 0px; padding-right: 0px;">
																										<a data-toggle="modal"
																										data-target="#booking-info${listRoom.getRoomName()}${loopday.index}c">
																											Free</a>
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
																												students_s.add(i,
																																								((OrderCalendar) pageContext.findAttribute("lsOrder"))
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
																												students_c.add(j,
																																								((OrderCalendar) pageContext.findAttribute("lsOrder"))
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
																									style="padding-left: 2px; padding-right: 2px;">
																										<a data-toggle="modal"
																										data-target="#booking-info${listRoom.getRoomName()}${loopday.index}s">
																											<%
																												if (i > 0) {
																											%> Booked <%
																												} else {
																											%> Free <%
																												}
																											%>
																									</a>
																								</strong>
																							</a><a
																								href="${contextPath}/<%if(b_cl_c.equals("red") || Integer.parseInt(oder_min) < j){%>#yourpet<%} else {%>orderCalendar?room=${listRoom.getRoomName()}&dayBooking=${setDay.get(loopday.index).substring(4,9)}&timeBooking=Noon<%}%>"
																								style="background-color: <%=b_cl_c%>"> <span>
																										Chiều: </span> <strong
																									style="padding-left: 0px; padding-right: 0px;">
																										<a data-toggle="modal"
																										data-target="#booking-info${listRoom.getRoomName()}${loopday.index}c">
																											<%
																												if (j > 0) {
																											%> Booked <%
																												} else {
																											%> Free <%
																												}
																											%>
																									</a>
																								</strong>
																							</a></td>
																						</c:otherwise>

																					</c:choose>
																				</c:if>
																			</c:if>
																			<!-- 																		request-info-s  -->
																			<div class="modal fade"
																				id="request-info${listRoom.getRoomName()}${loopday.index}s"
																				tabindex="-1" role="dialog"
																				aria-labelledby="exampleModalLongTitle"
																				aria-hidden="true">
																				<div class="modal-dialog" role="document">
																					<div class="modal-content">
																						<div class="modal-header">
																							<h2 class="modal-title"
																								id="exampleModalLongTitle">Chi tiết phòng</h2>
																							<button type="button" class="close"
																								data-dismiss="modal" aria-label="Close">
																								<span aria-hidden="true">&times;</span>
																							</button>
																						</div>
																						<div class="modal-body">
																							<p>Phòng: ${listRoom.getRoomName()}</p>
																							<c:forEach
																								items="${listRoom.getRequestCalendar()}"
																								var="lRd">
																								<c:if
																									test="${lRd.getTimeOrder() eq 'Morning' and lRd.getDateReq() ge date}">
																									<p>Giáo viên: ${lRd.getUser().getName()}</p>
																									<p>Trạng thái: ${lRd.getStatus()}</p>
																								</c:if>
																							</c:forEach>

																						</div>
																						<div class="modal-footer">
																							<button type="button" class="btn btn-secondary"
																								data-dismiss="modal">Close</button>
																							<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
																						</div>
																					</div>
																				</div>
																			</div>
																			<!-- 																		request-info-c -->
																			<div class="modal fade"
																				id="request-info${listRoom.getRoomName()}${loopday.index}c"
																				tabindex="-1" role="dialog"
																				aria-labelledby="exampleModalLongTitle"
																				aria-hidden="true">
																				<div class="modal-dialog" role="document">
																					<div class="modal-content">
																						<div class="modal-header">
																							<h2 class="modal-title"
																								id="exampleModalLongTitle">Chi tiết phòng -
																								${listRoom.getRoomName() }</h2>
																							<button type="button" class="close"
																								data-dismiss="modal" aria-label="Close">
																								<span aria-hidden="true">&times;</span>
																							</button>
																						</div>
																						<div class="modal-body">
																							<p>Phòng : ${listRoom.getRoomName()}</p>
																							<c:forEach
																								items="${listRoom.getRequestCalendar()}"
																								var="lRd">
																								<c:if
																									test="${lRd.getTimeOrder() eq 'Noon' and lRd.getDateReq() ge date}">
																									<p>Giáo viên: ${lRd.getUser().getName()}</p>
																									<p>Trạng thái: ${lRd.getStatus()}</p>
																								</c:if>
																							</c:forEach>

																						</div>
																						<div class="modal-footer">
																							<button type="button" class="btn btn-secondary"
																								data-dismiss="modal">Close</button>
																							<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
																						</div>
																					</div>
																				</div>
																			</div>
																			<!-- 																		booking info s -->
																			<div class="modal fade"
																				id="booking-info${listRoom.getRoomName()}${loopday.index}s"
																				tabindex="-1" role="dialog"
																				aria-labelledby="exampleModalLongTitle"
																				aria-hidden="true">
																				<div class="modal-dialog" role="document">
																					<div class="modal-content">
																						<div class="modal-header">
																							<h2 class="modal-title"
																								id="exampleModalLongTitle">Chi tiết phòng -
																								${listRoom.getRoomName()}</h2>
																							<button type="button" class="close"
																								data-dismiss="modal" aria-label="Close">
																								<span aria-hidden="true">&times;</span>
																							</button>
																						</div>
																						<div class="modal-body">
																							<c:if
																								test="${UserLogin.getRole().getRoleName() eq 'ROLE_STUDENT' }">
																								<p>Tên: ${listRoom.getRoomName()}</p>
																								<p>Trạng thái:
																									${listRoom.getRoomStatus().getRoomStatusValue()}</p>
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
																							</c:if>
																							<c:if
																								test="${UserLogin.getRole().getRoleName() ne 'ROLE_STUDENT' }">
																								<p>Tên: ${listRoom.getRoomName()}</p>
																								<p>
																									Trạng thái:
																									<%
																									if (i > 0) {
																								%>
																									Booked
																									<%
																									} else {
																								%>
																									Free
																									<%
																									}
																								%>
																								</p>
																								<h2>Giáo viên đăng kí</h2>
																								<%
																									for (User u : students_s) {
																								%>
																								<%=u.getName()%>

																								<br>

																								<%
																									}
																								%>
																							</c:if>
																						</div>
																						<div class="modal-footer">
																							<button type="button" class="btn btn-secondary"
																								data-dismiss="modal">Close</button>
																							<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
																						</div>
																					</div>
																				</div>
																			</div>
																			<!-- 																		booking - info -c -->
																			<div class="modal fade"
																				id="booking-info${listRoom.getRoomName()}${loopday.index}c"
																				tabindex="-1" role="dialog"
																				aria-labelledby="exampleModalLongTitle"
																				aria-hidden="true">
																				<div class="modal-dialog" role="document">
																					<div class="modal-content">
																						<div class="modal-header">
																							<h2 class="modal-title"
																								id="exampleModalLongTitle">Chi tiết phòng</h2>
																							<button type="button" class="close"
																								data-dismiss="modal" aria-label="Close">
																								<span aria-hidden="true">&times;</span>
																							</button>
																						</div>
																						<div class="modal-body">
																							<c:if
																								test="${UserLogin.getRole().getRoleName() eq 'ROLE_STUDENT' }">
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
																							</c:if>
																							<c:if
																								test="${UserLogin.getRole().getRoleName() ne 'ROLE_STUDENT' }">
																								<p>Tên: ${listRoom.getRoomName()}</p>
																								<p>
																									Trạng thái:
																									<%
																									if (j > 0) {
																								%>
																									Booked
																									<%
																									} else {
																								%>
																									Free
																									<%
																									}
																								%>
																								</p>
																								<h2>Giáo viên đăng kí</h2>
																								<%
																									for (User u : students_c) {
																								%>
																								<%=u.getName()%>

																								<br>

																								<%
																									}
																								%>
																							</c:if>
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