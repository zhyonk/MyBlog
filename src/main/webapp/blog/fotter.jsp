<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/blog/";
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<footer>
		<div class="wrap-footer">
			<div class="container">
				<div class="row">
					<div class="col-footer col-md-4">
						<h2 class="footer-title">关于网站</h2>
						<div class="textwidget">
							我们立足于美利坚共和国 <br> <br>
						</div>
					</div>
					<div class="col-footer col-md-4 widget_recent_entries">
						<h2 class="footer-title">近期</h2>
						<ul>
							<li><a href="#">最受欢迎的文章</a></li>
							<li><a href="<%=basePath%>pageviews.jsp">浏览量</a></li>
							<li><a href="#">啦啦啦</a></li>
							<li><a href="#">呜呜呜</a></li>
						</ul>
					</div>
					<div class="col-footer col-md-4">
						<h2 class="footer-title">新文章推送</h2>
						来把留下你的邮箱
						<form action="#" method="post">
							<input type="text" name="your-name" value="" size="40"
								placeholder="Your Email" /> <input type="submit"
								value="提交" class="btn btn-skin" />
						</form>
					</div>
				</div>
			</div>
			<div class="bottom-footer">
				<div class="container">
					<div class="row">
						<div class="col-md-4">
							<p>Copyright &copy; 2017.zhyonk All rights reserved.</p>
						</div>
						<div class="col-md-4">
							<ul class="list-inline social-buttons">
								<li><a href="https://user.qzone.qq.com/1034360798"><i class="fa fa-QQ"></i></a></li>
								<li><a href="#"><i class="fa fa-weixin"></i></a></li>
								<li><a href="http://weibo.com/u/5225286106?refer_flag=1005050010_"><i class="fa fa-weibo"></i></a></li>
								<li><a href="https://github.com/zhyonk"><i class="fa fa-github"></i></a></li>
							</ul>
						</div>
						<div class="col-md-4">
							<ul class="list-inline quicklinks">
								<li><a href="#">隐私政策</a></li>
								<li><a href="#">加入我们</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>