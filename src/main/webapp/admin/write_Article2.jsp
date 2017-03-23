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
			style="margin-top: 20px;">
			<legend>上传文章图片</legend>
		</fieldset>

		<input type="file" name="file" class="layui-upload-file" lay-title="添加文章图片">



	</div>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use('upload', function() {
			layui.upload({
				url : '../articleImgUpdate' //上传接口
				,
				success : function(res) { 
					console.log(res)
				}
			});

			layui.upload({
				url : '/test/upload.json',
				elem : '#test' //指定原始元素，默认直接查找class="layui-upload-file"
				,
				method : 'get' //上传接口的http类型
				,
				success : function(res) {
					LAY_demo_upload.src = res.url;
				}
			});
		});
	</script>


</body>

</html>