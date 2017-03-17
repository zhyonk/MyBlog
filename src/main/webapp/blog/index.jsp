<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/blog/";
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<!-- META DATA -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="">
<meta name="author" content="">

<title>Home</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css"
	type="text/css">

<!-- Owl Carousel Assets -->
<link href="<%=basePath%>owl-carousel/owl.carousel.css" rel="stylesheet">
<!-- <link href="owl-carousel/owl.theme.css" rel="stylesheet"> -->

<!-- Custom CSS -->
<link rel="stylesheet" href="<%=basePath%>css/style.css">

<!-- Custom Fonts -->
<link rel="stylesheet"
	href="<%=basePath%>font-awesome-4.4.0/css/font-awesome.min.css"
	type="text/css">
<!---<link href='http://fonts.googleapis.com/css?family=Asap:400,700' rel='stylesheet' type='text/css'>--->

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->

</head>

<body class="index-page">

	<!--Navigation -->
	<jsp:include page="Navigation.jsp" />
	<!-- Navigation -->
	<!-- CAROUSEL -->
	<div id="carousel-example-generic" class="carousel slide hidden-xs"
		data-ride="carousel" data-interval="4000">
		<!-- Wrapper for slides -->
		<div class="carousel-inner" id="carousel"></div>
		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left"></span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>
	<!-- Carousel -->

	<header class="container">
		<div class="site-branding">
			<h1 class="site-title">
				<a href="<%=basePath1%>index"> <span>我的博客</span>
				</a>
			</h1>
			<h2 class="site-description">欢迎来访</h2>
		</div>
		<div class="social-links">
			<ul class="list-inline">
				<li><a href="https://user.qzone.qq.com/1034360798"><i
						class="fa fa-QQ"></i></a></li>
				<li><a href="#"><i class="fa fa-weixin"></i></a></li>
				<li><a
					href="http://weibo.com/u/5225286106?refer_flag=1005050010_"><i
						class="fa fa-weibo"></i></a></li>
				<li><a href="https://github.com/zhyonk"><i
						class="fa fa-github"></i></a></li>
			</ul>
		</div>
	</header>

	<!-- /////////////////////////////////////////Content -->
	<div id="page-content">

		<!-- ////////////Content Box 01 -->
		<section class="box-content box-1">
			<div class="container">
				<div class="row" id="article1">
					<!-- 只要把这段写出来就行了 -->

				</div>
			</div>
		</section>
	</div>

	<!-- FOOTER -->

	<jsp:include page="fotter.jsp"></jsp:include>

	<!-- jQuery -->
	<script type="text/javascript" src="<%=basePath%>js/jquery-2.1.1.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/agency.js"></script>

	<!-- Plugin JavaScript -->
	<script src="<%=basePath%>js/jquery.easing.min.js"></script>
	<script src="<%=basePath%>js/classie.js"></script>
	<script src="<%=basePath%>js/cbpAnimatedHeader.js"></script>
	<script src="<%=basePath%>js/index.js"></script>

</body>
</html>