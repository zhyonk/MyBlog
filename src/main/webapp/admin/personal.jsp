<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/admin/";
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>

<head>
<meta charset="utf-8">
<title>Layout</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">

<link rel="stylesheet" href="<%=basePath%>plugins/layui/css/layui.css"
	media="all" />
<link rel="stylesheet" href="<%=basePath%>css/main.css" />
<script src="<%=basePath%>plugins/layui/layui.js" charset="utf-8"></script>
</head>

<body>
	<div style="margin: 15px;">
	<div style="margin:0 auto;width: 600px">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 50px;">
			<legend>个人资料</legend>
		</fieldset>
		<form class="layui-form layui-form-pane" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-block">
					<input type="text" name="username" lay-verify="required"
						placeholder="小明" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">电子邮箱</label>
				<div class="layui-input-block">
					<input type="text" name="email" lay-verify="required"
						placeholder="xiaoming@xx.com" autocomplete="off"
						class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">昵称</label>
				<div class="layui-input-block">
					<input type="text" name="nickname" lay-verify="required"
						placeholder="飞翔的企鹅" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-block">
					<input type="text" name="password" lay-verify="required"
						placeholder="xxx520" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-inline">
					<input type="password" name="password" placeholder="请输入密码"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">角色</label>
				<div class="layui-input-block">
					<select name="interest" lay-filter="aihao">
						<option value=""></option>
						<option value="0">管理员</option>
						<option value="1">订阅者</option>
						<option value="2">作者</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">通知</label>
				<div class="layui-input-block">
					<input type="checkbox" checked="" name="open" lay-skin="switch"
						lay-filter="switchTest" title="开关">
				</div>
			</div>

			<div class="layui-form-item">
				<button class="layui-btn" lay-submit="<%=basePath%>addUser" lay-filter="demo2" style="float: right;">保存</button>
			</div>
		</form>
		</div>
	</div>



	<script>
		layui.use('layedit', function() {
			var layedit = layui.layedit, $ = layui.jquery;

			//构建一个默认的编辑器
			var index = layedit.build('LAY_demo1');

		});
	</script>

</body>

</html>