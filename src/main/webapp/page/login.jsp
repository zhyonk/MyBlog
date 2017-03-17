<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/page/";
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html>
<html>

<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>博客后台管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Le styles -->
<script type="text/javascript"
	src="<%=basePath%>assets/js/jquery.min.js"></script>

<!--  <link rel="stylesheet" href="assets/css/style.css"> -->
<link rel="stylesheet" href="<%=basePath%>assets/css/loader-style.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/signin.css">






<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<!-- Fav and touch icons -->
<link rel="shortcut icon" href="<%=basePath%>assets/ico/minus.png">
</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<div id="status">&nbsp;</div>
	</div>

	<div class="container">


		<div class="" id="login-wrapper">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div id="logo-login">
						<h1>
							博客后台管理系统 <span>v1.0</span>
						</h1>
					</div>
				</div>

			</div>

			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="account-box">
						<form role="form" action="<%=basePath1%>login" method="post"
							id="user_form">
							<div class="form-group">
								<!--a href="#" class="pull-right label-forgot">Forgot email?</a-->
								<label for="inputUsernameEmail">用户名</label> <input type="text"
									id="inputUsernameEmail" class="form-control" name="username">
							</div>
							<div class="form-group">
								<!--a href="#" class="pull-right label-forgot">Forgot password?</a-->
								<label for="inputPassword">密码</label> <input type="password"
									id="inputPassword" class="form-control" name="password">
							</div>
							<div class="checkbox pull-left">
								<label> <input type="checkbox">记住用户名
								</label>
							</div>
							<button class="btn btn btn-primary pull-right" type="submit"
								id="btn_login">登 录</button>
						</form>
						<a class="forgotLnk" href="index.html"></a>
						<div class="row-block">
							<div class="row"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<p>&nbsp;</p>
		<div style="text-align: center; margin: 0 auto;">
			<h6 style="color: #fff;">
				Copyright(C)2017 zhyonk All Rights Reserved<br />
			</h6>
		</div>

	</div>

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div class="modal-body">密码输入有误啊，请重新输入</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>
	<!-- /.modal -->

	<!--  END OF PAPER WRAP -->





	<!-- MAIN EFFECT -->
	<script type="text/javascript"
		src="<%=basePath%>assets/js/preloader.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>assets/js/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>assets/js/app.js"></script>
	<script type="text/javascript" src="<%=basePath%>assets/js/load.js"></script>
	<script type="text/javascript" src="<%=basePath%>assets/js/main.js"></script>

	<script src="http://maps.googleapis.com/maps/api/js?sensor=false"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="<%=basePath%>assets/js/map/gmap3.js"></script>

</body>

</html>
