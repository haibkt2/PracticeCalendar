
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Sign-Up/Login Form</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
      <link rel="stylesheet" href="${contextPath}/resources/css/style.css">

  
</head>

<body>

  <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Sign Up for Free</h1>
          
          <form:form action="${contextPath}/register" modelAttribute="userForm">
          
          <div class="top-row">
            <div class="field-wrap">
              <label>
                First Name<span class="req" >*</span>
              </label>
              <input type="text" required minlength="3" maxlength="60" autocomplete="off"/>
            </div>
        
            <div class="field-wrap">
              <label>
                Last Name<span class="req">*</span>
              </label>
              <input type="text" required autocomplete="off"/>
            </div>
          </div>

          <div class="field-wrap">
            <label >
              MSSV: <i style="font-size: 16px">"Ex: 102130028"</i><span class="req">*</span>
            </label>
            <form:input type="text" required autocomplete="off" path="userId"/>
          </div>

          <div class="field-wrap">
            <label>
              Phone number<span class="req">*</span>
            </label>
            <form:input type="tel" required pattern="^[0-9-+s()]*$" autocomplete="off" path="phone"/>
          </div>
          
          <button type="submit" class="button button-block">Sign Up</button>
          <br>
          <a href="http://daotao.dut.udn.vn/download2/Email_Guide.pdf" target="_blank"><i>Hướng dẫn kích hoạt và sử dụng mail sinh viên</i></a>
          </form:form>

        </div>
        
        <div id="login">   
          <h1>Welcome Back!</h1>
          
          <form method="POST" action="${contextPath}/loginOrSigin" class="form-group">
          
            <div class="field-wrap">
            <label>
              Student Code: <i style="font-size: 16px">"Ex: 102130028"</i><span class="req">*</span>
            </label>
            <input type="text"required autocomplete="off" name="userId" />
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off" name="password"/>
          </div>
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
          <button class="button button-block"/>Log In</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script  src="${contextPath}/resources/js/index.js"></script>




</body>

</html>
