
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><spring:message code="page.title.updateuser" /></title>
<link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="${contextPath}/resources/js/jquery-1.12.1.min.js"></script>
<script src="${contextPath}/resources/js/jquery-1.10.2.js"></script>
<script src="${contextPath}/resources/js/bootstrap.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
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
    $('[data-toggle=confirmation-popout]').confirmation({
      rootSelector : '[data-toggle=confirmation-popout]',
      container : 'body'
    });
  });
</script>
<jsp:include page="header.jsp"></jsp:include>
<body onload="startTime();formatDateChange();">
  <div class="content_area">
    <div class="pagetitle">
      <spring:message code="lbl.update.title" />
    </div>
    <div>
    <a href="${contextPath}/resetPassword?userid=${userForm.userId}" style="text-decoration: none">
      <button class="btn" data-toggle="confirmation-popout" data-btn-ok-label="Ok" id="btnreset" data-btn-ok-class="" data-btn-cancel-label="No" 
        data-btn-cancel-class="" data-title="<spring:message code='cfm.resetpwd.title' />">
        <spring:message code="btn.resetpwd" />
      </button>
    </a>
  </div>
  <form:form action="${contextPath}/updateUser" modelAttribute="userForm">
    <div class="form-group_upd" style="height: 30px;">
      <span style="color: green; margin-left: 115px"> <c:choose>
          <c:when test="${message=='2'}">
            <spring:message code="msg.upduser.success" />
          </c:when>

          <c:when test="${message=='3'}">
            <spring:message code="msg.updpwd.success" />
          </c:when>

        </c:choose>
      </span><br />
      <div style="margin-left: 115px">
        <span style="color: red">*</span>
        <spring:message code="msg.validate.notempty" />
      </div>
    </div>
    <div class="form-group_upd">
      <label class="lbl_addnew"><spring:message code="lbl.adduser.userid" /><span style="color: red"> *</span></label>
      <form:input type="text" class="form-control_add" path="userId" cssStyle="background-color: rgba(221, 221, 221, 1); width: 125px" readonly="true" />
      <br />
    </div>
    <div class="form-group_upd">
      <label class="lbl_addnew"><spring:message code="lbl.adduser.username" /><span style="color: red"> *</span></label>
      <form:input type="text" class="form-control_add " path="userName" maxlength="50"/>
      <br />
      <div style="padding-left: 114px">
        <label><form:errors path="userName" style="color:red;"></form:errors></label>
      </div>
    </div>
    <div class="form-group_upd">
      <label class="lbl_addnew"><spring:message code="lbl.adduser.name" /><span style="color: red"> *</span></label>
      <form:input type="text" class="form-control_add " path="name" maxlength="100"/>
      <br />
      <div style="padding-left: 114px">
        <label><form:errors path="name" style="color:red;"></form:errors></label>
      </div>
    </div>
    <div class="form-group_upd">
      <label class="lbl_addnew"><spring:message code="lbl.adduser.email" /><span style="color: red"> *</span></label>
      <form:input type="text" class="form-control_add " path="email" maxlength="100" />
      <br />
      <div style="padding-left: 114px">
        <label><form:errors path="email" style="color:red;"></form:errors></label>
      </div>
    </div>
    <div class="form-group_upd">
      <label class="lbl_addnew"><spring:message code="lbl.adduser.phone" /></label>
      <form:input type="text" class="form-control_add " path="phone" />
      <div style="padding-left: 114px">
        <label><form:errors path="phone" style="color:red;"></form:errors></label>
      </div>
    </div>
    <div class="form-group_upd">
      <label class="lbl_addnew"><spring:message code="lbl.adduser.role" /></label>
      <form:select class="form-control_add" style="height: 35px" path="role">
        <form:options items="${lstRole}" itemLabel="roleName" itemValue="roleId" />
      </form:select>
    </div>
    <div class="form-group_add">
        <label class="lbl_addnew"><spring:message code="lbl.adduser.timezone" /></label>
        <form:select class="form-control_add" style="height: 35px" path="timezone">
        	<form:options items="${lstTimezone}" itemLabel="name" itemValue="value" />
        </form:select>
      </div>
    <div class="form-group_upd">
      <label class="lbl_addnew"><spring:message code="lbl.adduser.flg" /></label>
      <form:select class="form-control_upd" path="delFlg">
        <c:forEach var="types" items="${listStaus}">
          <option value="${types.key}" ${userForm.delFlg==types.key? 'selected' :''}>${types.value}</option>
        </c:forEach>
      </form:select>
    </div>
    <br>
    <div class="form-group_upd_button">
      <button class="btn btn-primary" id="btn_addupd">
        <spring:message code="btn.update" />
      </button>
      <a href="${contextPath}/userList">
        <button type="button" class="btn btn-danger" id="btncancel">
          <spring:message code="btn.cancel" />
        </button>
      </a>
    </div>
  </form:form>
  </div>
 
</body>
