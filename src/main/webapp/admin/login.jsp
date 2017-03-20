<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/admin/";
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>

<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>登录</title>
<link rel="stylesheet" href="<%=basePath%>plugins/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="<%=basePath%>css/login.css" />
</head>

<body class="beg-login-bg">
	<div class="beg-login-box">
		<header>
			<h1>后台登录</h1>
		</header>
		<div class="beg-login-main">
			<form action= "<%=basePath1%>login" class="layui-form" method="post">
				<div class="layui-form-item">
					<label class="beg-login-icon"> <i class="layui-icon">&#xe612;</i>
					</label> <input type="text" name="username" lay-verify="userName"
						autocomplete="off" placeholder="这里输入登录名" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label class="beg-login-icon"> <i class="layui-icon">&#xe642;</i>
					</label> <input type="password" name="password" lay-verify="password"
						autocomplete="off" placeholder="这里输入密码" class="layui-input">
				</div>
				<div class="layui-form-item">
					<div class="beg-pull-left beg-login-remember">
						<label>记住帐号？</label> <input type="checkbox" name="rememberMe"
							value="true" lay-skin="switch" checked title="记住帐号">
					</div>
					<div class="beg-pull-right">
						<button class="layui-btn layui-btn-primary" lay-submit
							lay-filter="login">
							<i class="layui-icon">&#xe650;</i> 登录
						</button>
					</div>
					<div class="beg-clear"></div>
				</div>
			</form>
		</div>
		<footer>
			<p>后台登录 © www.zhyonk.com</p>
		</footer>
	</div>
	<script type="text/javascript" src="<%=basePath%>plugins/layui/layui.js"></script>
	<script>
		layui.use([ 'layer', 'form' ], function() {
			var layer = layui.layer, $ = layui.jquery,form = layui.form();

			form.on('submit(login)', function(data) {
				 layer.alert(JSON.stringify(data.field), {
				      title: '最终的提交信息'
				    });
					$.get('<%=basePath1%>login' ).done(function(result) {
						var obj2 = eval('(' + result + ')');
						for (var i = 0; i < obj2.length; i++) {
							layer.alert(obj2[i])
						}
					});
				    return false;
			});
		});
	</script>
</body>

</html>