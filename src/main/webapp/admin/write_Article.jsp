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
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 50px;">
			<legend>标题</legend>
		</fieldset>
		<input type="text" name="title" required lay-verify="required"
			placeholder="请输入标题" autocomplete="off" class="layui-input">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 50px;">
			<legend>文章内容</legend>
		</fieldset>

		<textarea class="layui-textarea" id="LAY_demo1" style="display: none">  
  把编辑器的初始内容放在这textarea即可
</textarea>


		<form class="layui-form layui-form-pane" action="">
			<div class="layui-form-item" pane>
				<label class="layui-form-label">选择分类</label>
				<div class="layui-input-block">
					<input type="radio" name="sex" value="男" title="心情" checked>
					<input type="radio" name="sex" value="女" title="感悟"> 
					<input type="radio" name="sex" value="禁" title="禁用" disabled>
				</div>
			</div>
		</form>
	</div>
		<div class="site-demo-button" style="margin-top: 20px; float: right">
			<button class="layui-btn site-demo-layedit" data-type="content">发布</button>
		</div>
	<script>
		layui.use('layedit', function() {
			var layedit = layui.layedit, $ = layui.jquery;

			//构建一个默认的编辑器
			var index = layedit.build('LAY_demo1');

			//编辑器外部操作
			var active = {
				content : function() {
					alert(layedit.getContent(index)); //获取编辑器内容
				},
				text : function() {
					alert(layedit.getText(index)); //获取编辑器纯文本内容
				},
				selection : function() {
					alert(layedit.getSelection(index));
				}
			};

			$('.site-demo-layedit').on('click', function() {
				var type = $(this).data('type');
				active[type] ? active[type].call(this) : '';
			});

			//自定义工具栏
			layedit.build('LAY_demo2', {
				tool : [ 'face', 'link', 'unlink', '|', 'left', 'center',
						'right' ],
				height : 100
			})
		});
	</script>

</body>

</html>