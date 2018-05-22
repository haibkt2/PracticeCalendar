
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
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${contextPath}/resources/AdminUI/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${contextPath}/resources/AdminUI/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${contextPath}/resources/AdminUI/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${contextPath}/resources/AdminUI/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${contextPath}/resources/AdminUI/dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
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

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="img/nhat.jpg" alt="User profile picture">

              <h3 class="profile-username text-center">${UserLogin.getName()}</h3>

              <p class="text-muted text-center">${UserLogin.getUserId()}</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>${UserLogin.getEmail()}</b> 
                </li>
                <li class="list-group-item">
                  <b>${UserLogin.getBirthday()}</b> 
                </li>
                <li class="list-group-item">
                  <b>${UserLogin.getPhone()}</b> 
                </li>
                <li class="list-group-item">
                  <b>${UserLogin.getStatus()}</b> 
                </li>

              </ul>

              <a href="${contextPath}/home?logout=log" class="btn btn-primary btn-block"><b>Logout</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <hr />
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a  href="#settings" data-toggle="tab">Settings</a></li>
              <li ><a  href="#yourpet" data-toggle="tab">Your pets</a></li>
              <li ><a href="#post" data-toggle="tab">Your Post</a></li>
              <li ><a href="#event" data-toggle="tab">Events</a></li>
              <li ><a href="#message" data-toggle="tab">Messages</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane" id="event">
                  <div class="">
                    <div class="">
                        <div class="">
                          <h3 class="box-title">List of Events</h3>
                          <hr />                          
                        </div>
                            <!-- /.box-header -->
                    <div class="box-body">
                      <table id="example1" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                          <th>Event ID</th>
                          <th>Event name</th>
                          <th>Category</th>
                          <th>Host</th>
                          <th>Time</th>
                          <th>Avatar</th>
                          <th>Location</th>
                          <th>Price</th>
                          <!-- <th>Content</th> -->
                          <th>Status</th>
                          <th>Edit</th>
                          <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                          
                          <tr>
                            <td>Google</td>
                            <td>Google</td>
                            <td>Google</td>
                            <td>Google</td>
                            <td>Google</td>
                            <td> <img src="img/nhat.jpg" alt="" height="80px" width="80px" /></td>
                            <td>Google</td>
                            <td>Google</td>
                            <td>Google</td>

                            <td>
                              <a href="#"> <button type="button" class="btn bg-green1 margin">Edit</button> </a>              
                            </td>
                            <td>
                              <a href="#"> <button type="button" class="btn bg-red margin">Del</button> </a>
                            </td>
                          </tr>
                        </tfoot>
                      </table>
                    </div>
                    <!-- /.box-body -->
                  </div>
                </div>
              </div>

              <div class="tab-pane" id="message">
                <div class="">
                  <div class="">
                      <div class="">
                        <h3 class="">List of Messages</h3>
                        <hr>
                            <p style="text-align: center;">
                              <a href=#" class="addtop"><img src="assets/img/add.png" alt="" /> 
                                <button type="button" class="btn bg-green1 margin">Creat a new item</button>
                              </a>
                            </p>

                      </div>
                          <!-- /.box-header -->
                  <div class="box-body">
                    <table id="example1" class="table table-bordered table-striped">
                      <thead>
                      <tr>
                        <th>Message Title</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Content</th>
                        <th>Time</th>
                        <!-- <th>Edit</th> -->
                        <th>Delete</th>
                      </tr>
                      </thead>
                      <tbody>
                        
                        <tr>
                          <td>Google</td>
                          <td>Google</td>
                          <td>Google</td>
                          <td>Google</td>
                          <td>Google</td>
                          <td>
                            <a href="#"> <button type="button" class="btn bg-red margin">Del</button> </a>
                          </td>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                  <!-- /.box-body -->
                </div>
              </div>
              </div>


              <div class="tab-pane" id="post">
                <div class="">
                  <div class="">
                      <div class="">
                        <h3 class="box-title">List of Your Posts</h3>
                        <hr>
                            <p style="text-align: center;">
                              <a href="#" class="addtop"><img src="assets/img/add.png" alt="" /> 
                                <button type="button" class="btn bg-green1 margin">Creat a new item</button>
                              </a>
                            </p>
                      </div>
                          <!-- /.box-header -->
                  <div class="box-body">
                    <table id="example1" class="table table-bordered table-striped">
                      <thead>
                      <tr>
                        <th>Post ID</th>
                        <th>Post Name</th>
                        <th>Category</th>
                        <th>Author</th>
                        <th>Discription</th>
                        <th>Avatar</th>
                        <th>Create at</th>
                        <th>Update at</th>
                        <th>Status</th>
                        <th>Edit</th>
                        <th>Delete</th>
                      </tr>
                      </thead>
                      <tbody>
                        
                        <tr>
							<td>Google</td>
							<td>Google</td>
							<td>Google</td>
							<td>Google</td>
							<td>Google</td>
							<td> <img src ="img/nhat.jpg" alt="" height="80px" width="80px" /></td>
							<td>Google</td>
							<td>Google</td>
							<td>Google</td>

                          <td >
                            <a href="#"> <button type="button" class="btn bg-green1 margin">Edit</button> </a>              
                          </td>
                          <td>
                            <a href="#"> <button type="button" class="btn bg-red margin">Del</button> </a>
                          </td>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                  <!-- /.box-body -->
                </div>
              </div>
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="yourpet">

                <div class="">
                  <div class="">
                      <div class="">
                        <h3 class="">List of Your Pets</h3>
                        <hr>
                            <p style="text-align: center;">
                              <a href="#" class="addtop"><img src="assets/img/add.png" alt="" /> 
                                <button type="button" class="btn bg-green11 margin">Creat a new item</button>
                              </a>
                            </p>

                      </div>
                          <!-- /.box-header -->
                  <div class="box-body">
                    <table id="example1" class="table table-bordered table-striped">
                      <thead>
                      <tr>
                        <th>Pet ID</th>
                        <th>Pet Name</th>
                        <th>Breed</th>
                        <th>Owner</th>
                        <th>Age</th>
                        <th>Avatar</th>
                        <th>Gender</th>
                        <th>City</th>
                        <th>Edit</th>
                        <th>Delete</th>
                      </tr>
                      </thead>
                      <tbody>
                        
                        <tr>
                         	<td>Google</td>
							<td>Google</td>
							<td>Google</td>
							<td>Google</td>
							<td>Google</td>
							<td> <img src ="img/nhat.jpg" alt="" height="80px" width="80px" /></td>
							<td>Google</td>
							<td>Google</td>

                          <td>
                            <a href="#"> <button type="button" class="btn bg-green11 margin">Edit</button> </a>              
                          </td>
                          <td>
                            <a href="#"> <button type="button" class="btn bg-red margin">Del</button> </a>
                          </td>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                  <!-- /.box-body -->
                </div>
              </div>
              </div>
              <!-- /.tab-pane -->

              <div class="active tab-pane" id="settings">
                <div class="">
                  <h3 class="" >Update yout information</h3>
                  <hr>
                      <p style="text-align: center;">
                        <a href="#" class="addtop"><img src="assets/img/add.png" alt="" /> 
                        </a>
                      </p>

                </div>
                <form:form action = "${contextPath}/updateInfo?update=profile" modelAttribute="userForm">
                        <div class="box-body">
                            <div class="form-group">
                              <label for="">Username</label>
                              <input type="text" class="form-control" required="true" name="name" id="name" value="${UserLogin.getName()}">
                            </div>

                            <div class="form-group">
                              <label for="">Password</label>
                              <input type="password" class="form-control"  name="password" id="password" placeholder="Enter password">
                            </div>

                            <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input type="email" class="form-control" required="true" name="email" id="email" value="${UserLogin.getEmail()}"/>
                            </div>

                            <div class="form-group">
                                <label>Phone number</label>

                                <input class="form-control" type="tel" required="true" pattern="^[0-9-+s()]*$" name="phone" id="phone"  value="${UserLogin.getPhone()}">
                                <!-- /.input group -->
                            </div>

                            <div class="form-group">
                                <label>Gender</label>
                                <select class="form-control" name="gender" id="gender" required="true" >
                                  <option selected="selected">Man</option>
                                  <option>Woman</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Birthday</label>
                                <div class="form-group">                                
                                  <input  type="date" id="birthday" name="birthday" class="form-control" value="${UserLogin.getBirthday()}">
                                </div>
                                <!-- /.input group -->
                              </div>
                                             
<!--                             <div class="form-group"> -->
<!--                                 <label>Choose a new picture</label> -->
<!--                                 <input class="form-control" type="file" name="newPicture" placeholder="Choose your picture" value="Choose your picture" /> -->
<!--                             </div> -->
<!--                             <div class="form-group"> -->
<!--                                 <label>Your current picture</label> <br /> -->
<!--                                 <img src="img/nhat.jpg" name="oldPicture" width="30%" height="30%"> -->
<!--                             </div> -->

                            </div>
                          <!-- /.box-body -->

                          <div class="box-footer" style="text-align: center;">
                            <button type="submit" class="btn btn-primary">Submit</button>
                          </div>

                          <input  type="hidden" class="form-control"  name="role" id="role" value="${UserLogin.getRole().getRoleId()}">
                          <input  type="hidden" class="form-control"  name="status" id="status" value="Actived">
                          <input  type="hidden" class="form-control"  name="check" id="check" value="member">

                        <div class="clearfix"></div>
                    </form:form>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="${contextPath}/resources/AdminUI/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${contextPath}/resources/AdminUI/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="${contextPath}/resources/AdminUI/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${contextPath}/resources/AdminUI/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${contextPath}/resources/AdminUI/dist/js/demo.js"></script>
</body>
</html>