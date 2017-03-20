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

<title></title>

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

<body class="sub-page">
	<!--Navigation -->
	<jsp:include page="Navigation.jsp" />
	<!-- Navigation -->

	<!-- Background Gradients-->
	<div class="site-gradients">
		<div class="site-gradients-media">
			<figure>
				<img height="1080" width="1617">
			</figure>
		</div>
	</div>

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
				<li><a href="#"><i class="fa fa-facebook"></i></a></li>
				<li><a href="#"><i class="fa fa-twitter"></i></a></li>
				<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
				<li><a href="#"><i class="fa fa-vimeo"></i></a></li>
				<li><a href="#"><i class="fa fa-rss"></i></a></li>
			</ul>
		</div>
	</header>

	<!-- 文章内容 -->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div id="main-content">


					<article id="article"></article>



					<div class="widget wid-related">
						<div class="heading">
							<h4>相关文章</h4>
						</div>
						<div class="content">
							<div class="row">
								<div class="col-md-4">
									<div class="wrap-col">
										<a href="#"><img src="<%=basePath%>images/7.jpg" /></a>
										<h4>
											<a href="#">Vero eros et accumsan et iusto odio </a>
										</h4>
									</div>
								</div>


								<div class="col-md-4">
									<div class="wrap-col">
										<a href="#"><img src="<%=basePath%>images/8.jpg" /></a>
										<h4>
											<a href="#">Vero eros et accumsan et iusto odio </a>
										</h4>
									</div>
								</div>


								<div class="col-md-4">
									<div class="wrap-col">
										<a href="#"><img src="<%=basePath%>images/6.jpg" /></a>
										<h4>
											<a href="#">Vero eros et accumsan et iusto odio </a>
										</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

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
	<script src="<%=basePath%>js/single.js"></script>

</body>
</html>