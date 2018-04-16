
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<title>login</title>
</head>
<body>
  <div class="content_area login-area">
    <h2 class="form-title">
    </h2>
    <form method="POST" action="${contextPath}/login" class="form-group">
      <div class="form-group ${error != null ? 'has-error' : ''}">
        <div class="form-group_login">
          <label class="lb_login"></label> 
          <input name="userId" type="text" placeholder="text.login.enteruserid"/>
        </div>
        <div class="form-group_login">
          <label class="lb_login"></label>
          <input name="password" type="password" placeholder="text.login.enterpwd"/>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <div class="form-group_login" style="height: 30px">
          <div class="form-group_login">${message}</div>
          <div class="form-group_login" id="error">${error}</div>
        </div>
        <div class="form-group">
          <input class="btn btn-primary" id="btn_sign" type="submit" value="lbl.login.submit" />
        </div>
      </div>
    </form>
  </div>
</body>
</html>