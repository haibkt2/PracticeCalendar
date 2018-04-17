
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
  
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap-grid.min.css">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/bootstrap-theme.min.css">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/fonts/glyphicons-halflings-regular.ttf">

  <!-- <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="js/utils.js"></script> -->

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
  
</head>

<body>

  <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#login">Log In</a></li>
        <li class="tab"><a href="#signup">Sign Up</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="login">   
          <h1>Welcome Back!</h1>
          
          <form method="POST" action="${contextPath}/loginOrSigin" class="form-group">
          
            <div class="field-wrap">
            <label>
              Student Code: <i style="font-size: 16px">"Ex: 102130028"</i><span class="req">*</span>
            </label>
            <input type="text"required autocomplete="off" name="userId"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off" name="password"/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
          </div>
          
          <p class="forgot"><a href="#" data-toggle="modal" data-target="#exampleModal">Forgot Password?</a></p>
          
          <button class="button button-block" d>Log In</button>                   
          </form>

          <hr>
          <p><a href=""><button class="btn btn-outline-dark button-block btn-lg">Come back home</button></a></p>

        </div>
        <div id="signup">   
          <h1>Sign Up for Free</h1>
          
          <form action="${contextPath}/register" method="post">
          
          <div class="top-row">
            <div class="field-wrap">
              <label>
                First Name<span class="req">*</span>
              </label>
              <input type="text" required minlength="3" maxlength="60" autocomplete="off" name="f_name" />
            </div>
        
            <div class="field-wrap">
              <label>
                Last Name<span class="req">*</span>
              </label>
              <input type="text" required autocomplete="off" name="l_name"/>
            </div>
          </div>

          <div class="field-wrap">
            <label >
              Student Code: <i style="font-size: 16px">"Ex: 102130028"</i><span class="req">*</span>
            </label>
            <input type="text" required autocomplete="off" name="mssv"/>
          </div>

          <div class="field-wrap">
            <label>
              Phone number<span class="req">*</span>
            </label>
            <input type="tel" required pattern="^[0-9-+s()]*$" autocomplete="off" name="phone"/>
          </div>
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
          <button type="submit" class="button button-block">Sign Up</button>
          
          </form>
          <hr>
          <p><a href=""><button class="btn btn-outline-dark button-block btn-lg">Come back home</button></a></p>

        </div>
        

      </div><!-- tab-content -->

      <div>

      <!-- Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Nhập mã số sinh viên.</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form method="post" action="${contextPath}/register?fg_pass=t">
                <div class="form-group">
                  <p for="recipient-name" class="col-form-label">MSSV</p>
                  <input type="text" class="form-control" id="recipient-name" placeholder="Enter here!" name="mssv_fg"/>
                  <p for="recipient-name" class="col-form-label" style="color: red; text-align: right;"><i>Check you email after you finish.</i></p>
                </div>
              <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              <button type="submit" class="btn btn-primary">Send message</button>
            </div>
            </form>
            </div>
            
          </div>
        </div>
    </div>
      
</div> <!-- /form -->
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  

    <script  src="${contextPath}/resources/js/index.js"></script>       


</body>

</html>