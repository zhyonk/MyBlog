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
    <link rel="stylesheet" href="../blog/css/bootstrap.min.css"  type="text/css">
	
	<!-- Owl Carousel Assets -->
    <link href="../blog/owl-carousel/owl.carousel.css" rel="stylesheet">
    <!-- <link href="owl-carousel/owl.theme.css" rel="stylesheet"> -->
	
	<!-- Custom CSS -->
    <link rel="stylesheet" href="../blog/css/style.css">
	
	<!-- Custom Fonts -->
    <link rel="stylesheet" href="../blog/font-awesome-4.4.0/css/font-awesome.min.css"  type="text/css">
	<!---<link href='http://fonts.googleapis.com/css?family=Asap:400,700' rel='stylesheet' type='text/css'>--->
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
	
</head>

<body class="sub-page">	
	<!-- /////////////////////////////////////////Navigation -->
  <jsp:include page="Navigation.jsp" />
	<!-- Navigation -->

	<!-- Background Gradients-->
	<div  class="site-gradients">
		<div class="site-gradients-media">
			<figure>
				<img src="Another%20Yosemite%20short%20movie%20project%20%E2%80%93%20Modern_files/PcLGXNjMTdiFVKTrElCl__DSC2245.jpg" alt="PcLGXNjMTdiFVKTrElCl__DSC2245" srcset="https://themedemos.webmandesign.eu/modern/wp-content/uploads/sites/8/2014/11/PcLGXNjMTdiFVKTrElCl__DSC2245.jpg 1920w, https://themedemos.webmandesign.eu/modern/wp-content/uploads/sites/8/2014/11/PcLGXNjMTdiFVKTrElCl__DSC2245-420x280.jpg 420w, https://themedemos.webmandesign.eu/modern/wp-content/uploads/sites/8/2014/11/PcLGXNjMTdiFVKTrElCl__DSC2245-744x497.jpg 744w, https://themedemos.webmandesign.eu/modern/wp-content/uploads/sites/8/2014/11/PcLGXNjMTdiFVKTrElCl__DSC2245-1200x801.jpg 1200w" sizes="(max-width: 1617px) 100vw, 1617px" height="1080" width="1617">
			</figure>
		</div>
	</div>
	
	<header class="container">
		<div class="site-branding">
			<h1 class="site-title">
				<a href="<%=basePath1%>index">
					<span>我的博客</span>
				</a>
			</h1>
			<h2 class="site-description">欢迎光临</h2>
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

	
	<!-- /////////////////////////////////////////Content -->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div id="main-content">
					<article>
						<div class='embed-container maps'>
							<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.289259162295!2d-120.7989351!3d37.5246781!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8091042b3386acd7%3A0x3b4a4cedc60363dd!2sMain+St%2C+Denair%2C+CA+95316%2C+Hoa+K%E1%BB%B3!5e0!3m2!1svi!2s!4v1434016649434" width="100%" height="450px" frameborder="0" style="border: 0"></iframe>
						</div>
						<div class="art-content">
							<div class="row">
								<div class="col-md-4 box-item">
									<h3>联系信息</h3>
									<span>有什么意见发邮件吧</span><br> <br>
									<p>上海某某某地区<br>
										zhyonk</p>
									   <p>13145265129</p>
									<p>zhyonk@163.com</p>
								</div>
								<div class="col-md-8">
									<h3>联系表</h3>
									<form name="form1" method="post" action="contact.php">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
												<input type="text" class="form-control input-lg" name="name" id="name" placeholder="名字" required="required" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<input type="email" class="form-control input-lg" name="email" id="email" placeholder="邮箱" required="required" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<input type="text" class="form-control input-lg" name="subject" id="subject" placeholder="类型" required="required" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="form-group">
													<textarea name="message" id="message" class="form-control" rows="4" cols="25" required="required"
													placeholder="意见" style="height: 190px;"></textarea>
												</div>						
												<button type="submit" class="btn btn-skin btn-block" name="submitcontact" id="submitcontact">提交</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</article>
				</div>
			</div>
		</div>
		
	</div>

	<!-- FOOTER -->
<jsp:include page="fotter.jsp" />
  
	<!-- jQuery -->
	<script type="text/javascript" src="../blog/js/jquery-2.1.1.js"></script>
	<script type="text/javascript" src="../blog/js/bootstrap.min.js"></script>
	
	<!-- Custom Theme JavaScript -->
	<script src="../blog/js/agency.js"></script>

	<!-- Plugin JavaScript -->
	<script src="../blog/js/jquery.easing.min.js"></script>
	<script src="../blog/js/classie.js"></script>
	<script src="../blog/js/cbpAnimatedHeader.js"></script>
	
	<!-- Google Map -->
	<script>
		$('.maps').click(function () {
		$('.maps iframe').css("pointer-events", "auto");
	});

	$( ".maps" ).mouseleave(function() {
	  $('.maps iframe').css("pointer-events", "none"); 
	});
	</script>
</body>
</html>