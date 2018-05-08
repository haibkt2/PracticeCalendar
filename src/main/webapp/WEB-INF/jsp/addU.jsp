
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title><spring:message code="page.title.adduser" /></title>
<link rel="stylesheet" type="text/css"
  href="${contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
  href="${contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
  href="${contextPath}/resources/css/common.css">
<link
  href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"
  rel="stylesheet" type="text/css" />

<script src="${contextPath}/resources/js/scripts.js"></script>
<script src="${contextPath}/resources/js/jquery-1.12.1.min.js"></script>
<script src="${contextPath}/resources/js/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/js/jquery-ui.js"></script>
</head>
<script>
  $(function() {
    $("#date-format").datepicker({
      dateFormat : 'yy/mm/dd',
      changeMonth : true,
      changeYear : true,
      yearRange : "1950:2050"
    });
  });
</script>
<body onload="startTime();">
  <jsp:include page="header.jsp"></jsp:include>
  <div>
    <h2 style="text-align: center; font-weight: bold">
      <spring:message code="lbl.adduser.title" />
    </h2>
    <br> <br>
    <form:form action="${contextPath}/addUser"
      modelAttribute="userForm">
      <div class="form-group_add">
        <div style="padding-left: 114px">
          <span style="color: green"><c:choose>
              <c:when test="${message=='1'}">
                <spring:message code="msg.save.success" />
              </c:when>
              <c:otherwise>
              </c:otherwise>
            </c:choose> </span>
        </div>
        <br />
        <div style="margin-left: 115px">
          <span style="color: red">*</span>
          <spring:message code="msg.validate.notempty" />
        </div>
      </div>
      <div class="form-group_add">
        <label class="lbl_addnew"><spring:message
            code="lbl.adduser.userid" /><span style="color: red"> *</span></label>
        <form:input type="text" class="form-control_add" path="userId" cssStyle="background-color: rgba(221, 221, 221, 1); width: 125px"
          value="${userId}" readonly="true" />
        <br />
      </div>

      <div class="form-group_add">
        <label class="lbl_addnew"><spring:message
            code="lbl.adduser.username" /><span style="color: red"> *</span></label>
        <form:input type="text" class="form-control_add " path="userName" maxlength="50"/>
        <br />
        <div style="padding-left: 114px">
          <label><form:errors path="userName" style="color:red;"></form:errors></label>
        </div>
      </div>
      <div class="form-group_add">
        <label class="lbl_addnew"><spring:message
            code="lbl.adduser.name" /><span style="color: red"> *</span></label>
        <form:input type="text" class="form-control_add " path="name" maxlength="100" />
        <br />
        <div style="padding-left: 114px">
          <label><form:errors path="name" style="color:red;"></form:errors></label>
        </div>
      </div>
      <div class="form-group_add">
        <label class="lbl_addnew"><spring:message
            code="lbl.adduser.email" /><span style="color: red"> *</span></label>
        <form:input type="text" class="form-control_add" path="email" maxlength="100"/>
        <br />
        <div style="padding-left: 114px">
          <label><form:errors path="email" style="color:red;"></form:errors></label>
        </div>
      </div>
      <div class="form-group_add">
        <label class="lbl_addnew"><spring:message
            code="lbl.adduser.phone" /></label>
        <form:input type="text" class="form-control_add " path="phone" />
        <div style="padding-left: 114px">
          <label><form:errors path="phone" style="color:red;"></form:errors></label>
        </div>
      </div>
      <div class="form-group_add">
        <label class="lbl_addnew"><spring:message
            code="lbl.adduser.role" /></label>

        <form:select class="form-control_add" style="height: 35px"
          path="role">
          <c:forEach items="${lstRole}" var="items">
            <option value="<c:out value = "${items.roleId}"/>" ${items.roleId == 3 ? 'selected' : ''}>
            <c:out value="${items.roleName}" /></option>
          </c:forEach>
        </form:select>

      </div>
      <div class="form-group_add">
        <label class="lbl_addnew"><spring:message
            code="lbl.adduser.timezone" /></label>

        <form:select class="form-control_add" style="height: 35px"
          path="timezone">
          <c:forEach items="${lstTimezone}" var="items">
            <option value="<c:out value = "${items.value}"/>" ${items.value == 7 ? 'selected' : ''}>
            <c:out value="${items.name}" /></option>
          </c:forEach>
        </form:select>

      </div>
      <br>
      <div style="margin-left: 190px;">
        <button class="btn btn-primary" id="btn_addupd">
          <spring:message code="btn.addnew" />
        </button>
        <a
          href="${pageContext.request.contextPath}/userList"><button
            type="button" class="btn btn-danger" id="btncancel">
            <spring:message code="btn.cancel" />
          </button></a>
      </div>
    </form:form>
  </div>
</html>