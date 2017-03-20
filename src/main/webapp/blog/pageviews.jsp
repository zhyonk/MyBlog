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
<!-- jQuery -->
<script type="text/javascript" src="<%=basePath%>js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap-table.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap-table-zh-CN.js"></script>
<script src="<%=basePath%>js/echarts.min.js"></script>
<script src="<%=basePath%>js/china.js"></script>
<title></title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css"
	type="text/css">

<link href="<%=basePath%>owl-carousel/owl.carousel.css" rel="stylesheet">


<!-- Custom CSS -->
<link rel="stylesheet" href="<%=basePath%>css/style.css">

<link rel="stylesheet" href="<%=basePath%>css/bootstrap-table.css">

<!-- Custom Fonts -->
<link rel="stylesheet"
	href="<%=basePath%>font-awesome-4.4.0/css/font-awesome.min.css"
	type="text/css">
<!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
	
</script>
</head>

<body class="sub-page">
	<!-- Navigation -->
	<jsp:include page="Navigation.jsp" />
	<!-- Navigation -->

	<!-- Background Gradients-->
	<div class="site-gradients">
		<div class="site-gradients-media">
			<figure>
				<img width="1617">
			</figure>
		</div>
	</div>


	<header class="container">
		<div class="site-branding">
			<h1 class="site-title">
				<a href="<%=basePath1%>index"> <span>我的博客</span>
				</a>
			</h1>
			<h2 class="site-description">欢迎光临 !</h2>
		</div>
		<div class="social-links">
			<ul class="list-inline">
				<li><a href="#"><i class="fa fa-qq"></i></a></li>
				<li><a href="#"><i class="fa fa-weibo"></i></a></li>
				<li><a href="#"><i class="fa fa-weixin"></i></a></li>
			</ul>
		</div>
	</header>

	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div id="main-content">
					<img src="<%=basePath%>images/banner1.jpg" />
					<article style="padding: 45px;">
						<div class="art-content">
							<div id="pie" style="height: 500px;"></div>
						</div>
						<br>
						<div id="map" style="height: 600px;"></div>
						
						<table id="tb_departments">
						</table>

						<script src="./js/pageviews.js"></script>
					</article>
				</div>
			</div>
		</div>
	</div>

	<!-- 浏览量饼图 -->




	<!-- FOOTER -->
	<jsp:include page="fotter.jsp" />



	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/agency.js"></script>

	<!-- Plugin JavaScript -->
	<script src="<%=basePath%>js/jquery.easing.min.js"></script>

	<script src="<%=basePath%>js/classie.js"></script>
	<script src="<%=basePath%>js/cbpAnimatedHeader.js"></script>


</body>
</html>