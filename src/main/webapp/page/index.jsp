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
<title>博客后台首页</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Le styles -->



<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/loader-style.css">
<link rel="stylesheet" href="assets/css/bootstrap.css">

<link rel="stylesheet" type="text/css"
	href="assets/js/progress-bar/number-pb.css">


<style type="text/css">
canvas#canvas4 {
	position: relative;
	top: 20px;
}
</style>




<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<!-- Fav and touch icons -->
<link rel="shortcut icon" href="assets/ico/minus.png">
</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<div id="status">&nbsp;</div>
	</div>
	<!-- TOP NAVBAR -->
	<nav role="navigation" class="navbar navbar-static-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button data-target="#bs-example-navbar-collapse-1"
					data-toggle="collapse" class="navbar-toggle" type="button">
					<span class="entypo-menu"></span>
				</button>
				<button class="navbar-toggle toggle-menu-mobile toggle-left"
					type="button">
					<span class="entypo-list-add"></span>
				</button>

				<div id="logo-mobile" class="visible-xs">
					<h1>
						WEB管理<span>v1.0</span>
					</h1>
				</div>

			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div id="bs-example-navbar-collapse-1"
				class="collapse navbar-collapse">
				<ul class="nav navbar-nav">

					<li><a data-toggle="dropdown" class="dropdown-toggle" href="#"><i
							style="font-size: 19px;" class="icon-warning tooltitle"></i>
						<div class="noft-green">5</div></a>
						<ul style="margin: 12px 0 0 0;" role="menu"
							class="dropdown-menu dropdown-wrap">
							<li><a href="#"> <span style="background: #DF2135"
									class="noft-icon maki-bus"></span><i>From Station</i> <b>01B</b>
							</a></li>
							<li class="divider"></li>
							<li><a href="#"> <span style="background: #AB6DB0"
									class="noft-icon maki-ferry"></span><i>Departing at</i> <b>9:00
										AM</b>
							</a></li>
							<li class="divider"></li>
							<li><a href="#"> <span style="background: #FFA200"
									class="noft-icon maki-aboveground-rail"></span><i>Delay for</i>
									<b>09 Min</b>
							</a></li>
							<li class="divider"></li>
							<li><a href="#"> <span style="background: #86C440"
									class="noft-icon maki-airport"></span><i>Take of</i> <b>08:30
										AM</b>
							</a></li>
							<li class="divider"></li>
							<li><a href="#"> <span style="background: #0DB8DF"
									class="noft-icon maki-bicycle"></span><i>Take of</i> <b>08:30
										AM</b>
							</a></li>
							<li class="divider"></li>
							<li>
								<div>See All Notification</div>
							</li>
						</ul></li>

				</ul>
				<div id="nt-title-container"
					class="navbar-left running-text visible-lg">
					<ul class="date-top">
						<li class="entypo-calendar" style="margin-right: 5px"></li>
						<li id="Date"></li>
					</ul>

					<ul id="digital-clock" class="digital">
						<li class="entypo-clock" style="margin-right: 5px"></li>
						<li class="hour"></li>
						<li>:</li>
						<li class="min"></li>
						<li>:</li>
						<li class="sec"></li>
						<li class="meridiem"></li>
					</ul>
					<ul id="nt-title">
						<li><i class="wi-day-lightning"></i>&#160;&#160;上海&#160; <b>85</b><i
							class="wi-fahrenheit"></i>&#160;; 15km/h</li>
						<li><i class="wi-day-lightning"></i>&#160;&#160;南京&#160; <b>85</b><i
							class="wi-fahrenheit"></i>&#160;; Tonight- 72 °F (22.2 °C)</li>

						<li><i class="wi-day-lightning"></i>&#160;&#160;圣彼得堡&#160; <b>85</b><i
							class="wi-fahrenheit"></i>&#160;; 15km/h</li>

						<li><i class="wi-day-lightning"></i>&#160;&#160;第比利斯&#160; <b>85</b><i
							class="wi-fahrenheit"></i>&#160;; 15km/h</li>

						<li><i class="wi-day-lightning"></i>&#160;&#160;巴彦淖尔&#160; <b>85</b><i
							class="wi-fahrenheit"></i>&#160;; 15km/h</li>

					</ul>
				</div>

				<ul style="margin-right: 0;" class="nav navbar-nav navbar-right">
					<li><a data-toggle="dropdown" class="dropdown-toggle" href="#">
							<img alt="" class="admin-pic img-circle"
							src="http://api.randomuser.me/portraits/thumb/men/10.jpg">Admin<b
							class="caret"></b>
					</a>
						<ul style="margin-top: 14px;" role="menu"
							class="dropdown-setting dropdown-menu">
							<li><a href="#"> <span class="entypo-user"></span>&#160;&#160;账号信息
							</a></li>
							<li class="divider"></li>
							<li><a href="#"> <span class="entypo-cancel"></span>&#160;&#160;
									退出
							</a></li>
						</ul></li>
					<li><a data-toggle="dropdown" class="dropdown-toggle" href="#">
							<span class="entypo-palette"></span>&#160;&#160;主题
					</a>
						<ul role="menu" class="dropdown-setting dropdown-menu">

							<li class="theme-bg">
								<div id="button-bg"></div>
								<div id="button-bg2"></div>
								<div id="button-bg3"></div>
								<div id="button-bg5"></div>
								<div id="button-bg6"></div>
								<div id="button-bg7"></div>
								<div id="button-bg8"></div>
								<div id="button-bg9"></div>
								<div id="button-bg10"></div>
								<div id="button-bg11"></div>
								<div id="button-bg12"></div>
								<div id="button-bg13"></div>
							</li>
						</ul></li>
					<li class="hidden-xs"><a class="toggle-left" href="#"> <span
							style="font-size: 20px;" class="entypo-list-add"></span>
					</a></li>
				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- /END OF TOP NAVBAR -->

	<!-- SIDE MENU -->
	<div id="skin-select">
		<div id="logo">
			<h1>
				后台管理 <span>v1.0</span>
			</h1>
		</div>

		<a id="toggle"> <span class="entypo-menu"></span>
		</a>
		<div class="dark">
			<form action="#">
				<span> <input type="text" name="search" value=""
					class="search rounded id_search" placeholder="Search Menu..."
					autofocus="">
				</span>
			</form>
		</div>

		<div class="search-hover">
			<form id="demo-2">
				<input type="search" placeholder="Search Menu..." class="id_search">
			</form>
		</div>




		<div class="skin-part">
			<div id="tree-wrap">
				<div class="side-bar">
					<ul class="topnav menu-left-nest">
						<li><a href="#" style="border-left: 0px solid !important;"
							class="title-menu-left"> <span class="widget-menu"></span> <i
								data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

						</a></li>

						<li><a class="tooltip-tip ajax-load" href="#" title="博客管理">
								<i class="icon-document-edit"></i> <span>博客管理</span>

						</a>
							<ul>
								<li><a class="tooltip-tip2 ajax-load" href="#" title="博客列表"><i
										class="entypo-doc-text"></i><span>博客列表</span></a></li>
								<li><a class="tooltip-tip2 ajax-load" href="#" title="博客详情"><i
										class="entypo-newspaper"></i><span>博客列表</span></a></li>
							</ul></li>
						<!--                     <li>
                            <a class="tooltip-tip ajax-load" href="social.html" title="访客统计">
                                <i class="icon-feed"></i>
                                <span>Social</span>

                            </a>
                        </li>
                        <li>
                            <a class="tooltip-tip ajax-load" href="media.html" title="Media">
                                <i class="icon-camera"></i>
                                <span>Media</span>

                            </a>
                        </li> -->
					</ul>

					<ul class="topnav menu-left-nest">
						<li><a href="#" style="border-left: 0px solid !important;"
							class="title-menu-left"> <span class="design-kit"></span> <i
								data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

						</a></li>

						<!--                    <li>
                            <a class="tooltip-tip ajax-load" href="index.html" title="首页">
                                <i class="icon-window"></i>
                                <span>首页</span>

                            </a>
                        </li>
                        <li>
                            <a class="tooltip-tip ajax-load" href="mail.html" title="Mail">
                                <i class="icon-mail"></i>
                                <span>mail</span>
                                <div class="noft-blue">289</div>
                            </a>
                        </li> -->

						<li><a class="tooltip-tip ajax-load" href="icon.html"
							title="Icons"> <i class="icon-preview"></i> <span>Icons</span>
								<div class="noft-blue" style="display: inline-block; float: none;">New</div>
						</a></li>

						<li><a class="tooltip-tip" href="#" title="Extra Pages">
								<i class="icon-document-new"></i> <span>Extra Page</span>
						</a>
							<ul>
								<li><a class="tooltip-tip2 ajax-load"
									href="blank_page.html" title="Blank Page"><i
										class="icon-media-record"></i><span>Blank Page</span></a></li>
								<li><a class="tooltip-tip2 ajax-load" href="profile.html"
									title="Profile Page"><i class="icon-user"></i><span>Profile
											Page</span></a></li>
								<li><a class="tooltip-tip2 ajax-load" href="invoice.html"
									title="Invoice"><i class="entypo-newspaper"></i><span>Invoice</span></a>
								</li>
								<li><a class="tooltip-tip2 ajax-load"
									href="pricing_table.html" title="Pricing Table"><i
										class="fontawesome-money"></i><span>Pricing Table</span></a></li>
								<li><a class="tooltip-tip2 ajax-load" href="time-line.html"
									title="Time Line"><i class="entypo-clock"></i><span>Time
											Line</span></a></li>
								<li><a class="tooltip-tip2" href="404.html"
									title="404 Error Page"><i class="icon-thumbs-down"></i><span>404
											Error Page</span></a></li>
								<li><a class="tooltip-tip2" href="500.html"
									title="500 Error Page"><i class="icon-thumbs-down"></i><span>500
											Error Page</span></a></li>
								<li><a class="tooltip-tip2" href="lock-screen.html"
									title="Lock Screen"><i class="icon-lock"></i><span>Lock
											Screen</span></a></li>
							</ul></li>

						<li><a class="tooltip-tip " href="login.html" title="login">
								<i class="icon-download"></i> <span>Login</span>
						</a></li>

					</ul>

					<ul id="menu-showhide" class="topnav menu-left-nest">
						<li><a href="#" style="border-left: 0px solid !important;"
							class="title-menu-left"> <span class="component"></span> <i
								data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

						</a></li>


						<li><a class="tooltip-tip" href="#" title="UI Element"> <i
								class="icon-monitor"></i> <span>UI Element</span>
						</a>
							<ul>
								<li><a class="tooltip-tip2 ajax-load" href="element.html"
									title="Element"><i class="icon-attachment"></i><span>Element</span></a>
								</li>
								<li><a class="tooltip-tip2 ajax-load" href="button.html"
									title="Button"><i class="icon-view-list-large"></i><span>Button</span>
										<div class="noft-blue-number">10</div></a></li>
								<li><a class="tooltip-tip2 ajax-load" href="wizard.html"
									title="Tab & Accordion"><i class="icon-folder"></i><span>Wizard</span>
									<div class="noft-purple-number">3</div></a></li>
								<li><a class="tooltip-tip2 ajax-load" href="calendar.html"
									title="Calender"><i class="icon-calendar"></i><span>Calendar</span></a>
								</li>
								<li><a class="tooltip-tip2 ajax-load" href="tree.html"
									title="Tree View"><i class="icon-view-list"></i><span>Tree
											View</span></a></li>
								<li><a class="tooltip-tip2 ajax-load" href="grids.html"
									title="Grids"><i class="icon-menu"></i><span>Grids</span></a></li>
								<li><a class="tooltip-tip2 ajax-load" href="chart.html"
									title="Chart"><i class="icon-graph-pie"></i><span>Chart</span></a>
								</li>
								<li><a class="tooltip-tip ajax-load"
									href="typhography.html" title="Typhoghrapy"> <i
										class="icon-information"></i> <span>Typhoghrapy</span>
								</a></li>
							</ul></li>
						<li><a class="tooltip-tip" href="#" title="Form"> <i
								class="icon-document"></i> <span>Form</span>
						</a>
							<ul>
								<li><a class="tooltip-tip2 ajax-load"
									href="form-element.html" title="Form Elements"><i
										class="icon-document-edit"></i><span>Form Elements</span></a></li>
								<li><a class="tooltip-tip2 ajax-load"
									href="andvance-form.html" title="Andvance Form"><i
										class="icon-map"></i><span>Andvance Form</span></a></li>
								<li><a class="tooltip-tip2 ajax-load"
									href="text-editor.html" title="Text Editor"><i
										class="icon-code"></i><span>Text Editor</span></a></li>
								<li><a class="tooltip-tip2 ajax-load"
									href="file-upload.html" title="File Upload"><i
										class="icon-upload"></i><span>File Upload</span></a></li>
							</ul></li>
						<li><a class="tooltip-tip" href="#" title="Tables"> <i
								class="icon-view-thumb"></i> <span>Tables</span>
						</a>
							<ul>
								<li><a class="tooltip-tip2 ajax-load"
									href="table-static.html" title="Table Static"><i
										class="entypo-layout"></i><span>Table Static</span></a></li>
								<li><a class="tooltip-tip2 ajax-load"
									href="table-dynamic.html" title="Table Dynamic"><i
										class="entypo-menu"></i><span>Table Dynamic</span></a></li>
							</ul></li>

						<li><a class="tooltip-tip ajax-load" href="map.html"
							title="Map"> <i class="icon-location"></i> <span>Map</span>

						</a></li>
					</ul>


				</div>
			</div>
		</div>
	</div>
	<!-- END OF SIDE MENU -->



	<!--  PAPER WRAP -->
 	<div class="wrap-fluid">
		<div class="container-fluid paper-wrap bevel tlbr">





			<!-- CONTENT -->
			<!--TITLE -->
			<div class="row">
				<div id="paper-top">
					<div class="col-lg-3">
						<h2 class="tittle-content-header">
							<i class="icon-window"></i> <span>首页 </span>
						</h2>

					</div>

					<div class="col-lg-7">
						<div class="devider-vertical visible-lg"></div>
						<div class="tittle-middle-header">

							<div class="alert">
								<button type="button" class="close" data-dismiss="alert">×</button>
								<span class="tittle-alert entypo-info-circled"></span> Welcome
								back,&nbsp; <strong>Dave mattew!</strong>&nbsp;&nbsp;Your last
								sig in at Yesterday, 16:54 PM
							</div>


						</div>

					</div>
					<div class="col-lg-2">
						<div class="devider-vertical visible-lg"></div>
						<div class="btn-group btn-wigdet pull-right visible-lg">
							<div class="btn">Widget</div>
							<button data-toggle="dropdown" class="btn dropdown-toggle"
								type="button">
								<span class="caret"></span> <span class="sr-only">Toggle
									Dropdown</span>
							</button>
							<ul role="menu" class="dropdown-menu">
								<li><a href="#"> <span
										class="entypo-plus-circled margin-iconic"></span>Add New
								</a></li>
								<li><a href="#"> <span
										class="entypo-heart margin-iconic"></span>Favorite
								</a></li>
								<li><a href="#"> <span class="entypo-cog margin-iconic"></span>Setting
								</a></li>
							</ul>
						</div>


					</div>
				</div>
			</div>
			<!--/ TITLE -->



			<!-- 导航 -->
			<ul id="breadcrumb">
				<li><span class="entypo-home"></span></li>
				<li><i class="fa fa-lg fa-angle-right"></i></li>
				<li><a href="#" title="Sample page 1">Home</a></li>
				<li><i class="fa fa-lg fa-angle-right"></i></li>
				<li><a href="#" title="Sample page 1">首页</a></li>
				<li class="pull-right">
					<div class="input-group input-widget">

						<input style="border-radius: 15px" type="text"
							placeholder="Search..." class="form-control">
					</div>
				</li>
			</ul>

			<!-- END OF BREADCRUMB -->







			<!--  DEVICE MANAGER -->
			<div class="content-wrap">
				<div class="row">
			<!--  / DEVICE MANAGER -->










			<div class="content-wrap">
				<div class="row">
			</div> 





			<div class="content-wrap">
				<div class="row">
					<div class="col-lg-6">
						<div class="chart-wrap">
							<div class="chart-dash">
								<div id="placeholder" style="width: 100%; height: 200px;"></div>
							</div>
							<div class="row">
								<div class="col-lg-8">
									<div class="speed">
										<h2>Speed Avarage</h2>
										<h1>
											74 <span>Km / hours</span>
										</h1>
									</div>
								</div>
								<div class="col-lg-4">
									<div class="traffic">
										<h2>Traffic per day</h2>
										<h1>2.5874</h1>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<div class="traffic-rates">
										<h4>Traffic Rates</h4>
										<h1>
											76 % <span>-1,2 %</span>
										</h1>
									</div>
								</div>
								<div class="col-lg-4">
									<div class="traffic-rates">
										<h4>Traffic Rates</h4>
										<h1>
											25 % <span>-1,8 %</span>
										</h1>
									</div>
								</div>
								<div class="col-lg-4">
									<div class="traffic-rates">
										<h4>Traffic Rates</h4>
										<h1>
											83 % <span>-1,9 %</span>
										</h1>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="weather-wrap">
							<div class="row">
								<div class="col-lg-12">
									<div class="temperature">
										<b>Monday</b>, 07:30 AM <span>F</span> <span><b>C</b> </span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<div class="weather-icon">
										<i class="wi-day-lightning"></i>
									</div>
								</div>
								<div class="col-lg-8">
									<div class="weather-text">
										<h2>
											Berlin <br>
											<i>Day Lightning</i>
										</h2>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="weather-text">
										<h3>
											<i class="wi-thermometer"></i>18<i class="wi-celcius"></i>
										</h3>
									</div>
								</div>
							</div>
							<div class="weather-dash">
								<div class="row">
									<div class="col-lg-2">
										<div class="daily-weather">
											<h2>Mon</h2>
											<h3>
												85 <span><i class="wi-fahrenheit"></i> </span>
											</h3>
											<h4>
												<span><i class="wi-day-lightning"></i> </span>
											</h4>
											<h5>
												15 <i>km/h</i>
											</h5>
										</div>
									</div>
									<div class="col-lg-2">
										<div class="daily-weather">
											<h2>Tue</h2>
											<h3>
												81 <span><i class="wi-fahrenheit"></i> </span>
											</h3>
											<h4>
												<i class="wi-day-cloudy"></i>
											</h4>
											<h5>
												12 <i>km/h</i>
											</h5>
										</div>
									</div>
									<div class="col-lg-2">
										<div class="daily-weather">
											<h2>Wed</h2>
											<h3>
												83 <span><i class="wi-fahrenheit"></i> </span>
											</h3>
											<h4>
												<i class="wi-rain-mix"></i>
											</h4>
											<h5>
												14 <i>km/h</i>
											</h5>
										</div>
									</div>
									<div class="col-lg-2">
										<div class="daily-weather">
											<h2>Thu</h2>
											<h3>
												80 <span><i class="wi-fahrenheit"></i> </span>
											</h3>
											<h4>
												<i class="wi-day-sunny"></i>
											</h4>
											<h5>
												15 <i>km/h</i>
											</h5>
										</div>
									</div>
									<div class="col-lg-2">
										<div class="daily-weather">
											<h2>Fri</h2>
											<h3>
												79 <span><i class="wi-fahrenheit"></i> </span>
											</h3>
											<h4>
												<i class="wi-day-storm-showers"></i>
											</h4>
											<h5>
												11 <i>km/h</i>
											</h5>
										</div>
									</div>
									<div class="col-lg-2">
										<div class="daily-weather">
											<h2>Sat</h2>
											<h3>
												82 <span><i class="wi-fahrenheit"></i> </span>
											</h3>
											<h4>
												<i class="wi-cloudy"></i>
											</h4>
											<h5>
												10 <i>km/h</i>
											</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /END OF CONTENT -->



				<!-- FOOTER -->
				<div class="footer-space"></div>
				<div id="footer">
					<div class="devider-footer-left"></div>
					<div class="time">
						<p id="spanDate">
						<p id="clock">
					</div>
					<div class="copyright">
						Make with Love <span class="entypo-heart"></span>Collect from <a
							href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
						All Rights Reserved
					</div>
					<div class="devider-footer"></div>


				</div>
				<!-- / END OF FOOTER -->


			</div>
		</div>
	</div> 
	<!--  END OF PAPER WRAP -->

	<!-- RIGHT SLIDER CONTENT -->
	<div class="sb-slidebar sb-right">
		<div class="right-wrapper">
			<div class="row">
				<h3>
					<span><i class="entypo-gauge"></i>&nbsp;&nbsp;MAIN WIDGET</span>
				</h3>
				<div class="col-lg-12">

					<div class="widget-knob">
						<span class="chart" style="position: relative" data-percent="86">
							<span class="percent"></span>
						</span>
					</div>
					<div class="widget-def">
						<b>Distance traveled</b> <br> <i>86% to the check point</i>
					</div>

					<div class="widget-knob">
						<span class="speed-car" style="position: relative"
							data-percent="60"> <span class="percent2"></span>
						</span>
					</div>
					<div class="widget-def">
						<b>The average speed</b> <br> <i>30KM/h avarage speed</i>
					</div>


					<div class="widget-knob">
						<span class="overall" style="position: relative" data-percent="25">
							<span class="percent3"></span>
						</span>
					</div>
					<div class="widget-def">
						<b>Overall result</b> <br> <i>30KM/h avarage Result</i>
					</div>
				</div>
			</div>
		</div>

		<div style="margin-top: 0;" class="right-wrapper">
			<div class="row">
				<h3>
					<span><i class="entypo-chat"></i>&nbsp;&nbsp;CHAT</span>
				</h3>
				<div class="col-lg-12">
					<span class="label label-warning label-chat">Online</span>
					<ul class="chat">
						<li><a href="#"> <span> <img alt=""
									class="img-chat img-circle"
									src="http://api.randomuser.me/portraits/thumb/men/20.jpg">
							</span><b>Dave Junior</b> <br>
							<i>Last seen : 08:00 PM</i>
						</a></li>
						<li><a href="#"> <span> <img alt=""
									class="img-chat img-circle"
									src="http://api.randomuser.me/portraits/thumb/men/21.jpg">
							</span><b>Kenneth Lucas</b> <br>
							<i>Last seen : 07:21 PM</i>
						</a></li>
						<li><a href="#"> <span> <img alt=""
									class="img-chat img-circle"
									src="http://api.randomuser.me/portraits/thumb/men/22.jpg">
							</span><b>Heidi Perez</b> <br>
							<i>Last seen : 05:43 PM</i>
						</a></li>


					</ul>

					<span class="label label-chat">Offline</span>
					<ul class="chat">
						<li><a href="#"> <span> <img alt=""
									class="img-chat img-offline img-circle"
									src="http://api.randomuser.me/portraits/thumb/men/23.jpg">
							</span><b>Dave Junior</b> <br>
							<i>Last seen : 08:00 PM</i>
						</a></li>
						<li><a href="#"> <span> <img alt=""
									class="img-chat img-offline img-circle"
									src="http://api.randomuser.me/portraits/thumb/women/24.jpg">
							</span><b>Kenneth Lucas</b> <br>
							<i>Last seen : 07:21 PM</i>
						</a></li>
						<li><a href="#"> <span> <img alt=""
									class="img-chat img-offline img-circle"
									src="http://api.randomuser.me/portraits/thumb/men/25.jpg">
							</span><b>Heidi Perez</b> <br>
							<i>Last seen : 05:43 PM</i>
						</a></li>
						<li><a href="#"> <span> <img alt=""
									class="img-chat img-offline img-circle"
									src="http://api.randomuser.me/portraits/thumb/women/25.jpg">
							</span><b>Kenneth Lucas</b> <br>
							<i>Last seen : 07:21 PM</i>
						</a></li>
						<li><a href="#"> <span> <img alt=""
									class="img-chat img-offline img-circle"
									src="http://api.randomuser.me/portraits/thumb/men/26.jpg">
							</span><b>Heidi Perez</b> <br>
							<i>Last seen : 05:43 PM</i>
						</a></li>

					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- END OF RIGHT SLIDER CONTENT-->
	<script type="text/javascript" src="assets/js/jquery.js"></script>
	<script src="assets/js/progress-bar/src/jquery.velocity.min.js"></script>
	<script src="assets/js/progress-bar/number-pb.js"></script>
	<script src="assets/js/progress-bar/progress-app.js"></script>



	<!-- MAIN EFFECT -->
	<script type="text/javascript" src="assets/js/preloader.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.js"></script>
	<script type="text/javascript" src="assets/js/app.js"></script>
	<script type="text/javascript" src="assets/js/load.js"></script>
	<script type="text/javascript" src="assets/js/main.js"></script>




	<!-- GAGE -->


	<script type="text/javascript" src="assets/js/chart/jquery.flot.js"></script>
	<script type="text/javascript"
		src="assets/js/chart/jquery.flot.resize.js"></script>
	<script type="text/javascript" src="assets/js/chart/realTime.js"></script>
	<script type="text/javascript"
		src="assets/js/speed/canvasgauge-coustom.js"></script>
	<script type="text/javascript"
		src="assets/js/countdown/jquery.countdown.js"></script>



	<script src="assets/js/jhere-custom.js"></script>

	<script>
		var gauge4 = new Gauge("canvas4", {
			'mode' : 'needle',
			'range' : {
				'min' : 0,
				'max' : 90
			}
		});
		gauge4.draw(Math.floor(Math.random() * 90));
		var run = setInterval(function() {
			gauge4.draw(Math.floor(Math.random() * 90));
		}, 3500);
	</script>


	<script type="text/javascript">
		/* Javascript
		 *
		 * See http://jhere.net/docs.html for full documentation
		 */
		$(window).on('load', function() {
			$('#mapContainer').jHERE({
				center : [ 52.500556, 13.398889 ],
				type : 'smart',
				zoom : 10
			}).jHERE('marker', [ 52.500556, 13.338889 ], {
				icon : 'assets/img/marker.png',
				anchor : {
					x : 12,
					y : 32
				},
				click : function() {
					alert('Hallo from Berlin!');
				}
			}).jHERE('route', [ 52.711, 13.011 ], [ 52.514, 13.453 ], {
				color : '#FFA200',
				marker : {
					fill : '#86c440',
					text : '#'
				}
			});
		});
	</script>
	<script type="text/javascript">
		var output, started, duration, desired;

		// Constants
		duration = 5000;
		desired = '50';

		// Initial setup
		output = $('#speed');
		started = new Date().getTime();

		// Animate!
		animationTimer = setInterval(function() {
			// If the value is what we want, stop animating
			// or if the duration has been exceeded, stop animating
			if (output.text().trim() === desired
					|| new Date().getTime() - started > duration) {
				console.log('animating');
				// Generate a random string to use for the next animation step
				output.text('' + Math.floor(Math.random() * 60)

				);

			} else {
				console.log('animating');
				// Generate a random string to use for the next animation step
				output.text('' + Math.floor(Math.random() * 120)

				);
			}
		}, 5000);
	</script>
	<script type="text/javascript">
		$('#getting-started').countdown(
				'2015/01/01',
				function(event) {
					$(this).html(
							event.strftime(

							'<span>%M</span>'
									+ '<span class="start-min">:</span>'
									+ '<span class="start-min">%S</span>'));
				});
	</script>

	<div style="text-align: center;">
		<p>
			More Templates <a href="http://www.cssmoban.com/" target="_blank"
				title="模板之家">模板之家</a> - Collect from <a
				href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
		</p>
	</div>
</body>

</html>
