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
<script type="text/javascript" src="<%=basePath1%>js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="<%=basePath1%>js/sweet-alert.min.js"></script>
<link rel="stylesheet" href="<%=basePath1%>css/sweet-alert.css">
<link rel="stylesheet" href="<%=basePath%>css/write_Article.css">
<script src="<%=basePath%>plugins/layui/layui.js" charset="utf-8"></script>
</head>

<body>
	<div style="margin: 15px;">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 50px;">
			<legend>标题</legend>
		</fieldset>
		<input type="text" name="title" required lay-verify="required"
			placeholder="请输入标题" autocomplete="off" class="layui-input"
			id="maintitle">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 50px;">
			<legend>副标题</legend>
		</fieldset>
		<input type="text" name="title2" required lay-verify="required"
			placeholder="请输入标题" autocomplete="off" class="layui-input"
			id="smalltitle">
			
				<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>上传文章图片</legend>
		</fieldset>

		<div class="site-demo-upload">
		  <img id="LAY_demo_upload">
		  <div class="site-demo-upbar">
		   <input type="file" name="file" class="layui-upload-file" lay-title="换个图片">
		  </div>
		</div>
		<p style="margin-top: 20px;">注：目前看来必须传个图片，不了首页不好看</p>

	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		var filepath = "";
		layui.use('upload', function() {
			layui.upload({
				url : '../articleImgUpdate' //上传接口
				,
				success : function(res) { 
					swal("good job", "文件上传成功", "success");
					filepath=res.status
				}
			});
		});
	</script>
			
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 50px;">
			<legend>文章内容</legend>
		</fieldset>

		<textarea class="layui-textarea" id="LAY_demo1" style="display: none" name="textArea">  
</textarea>


		<form class="layui-form layui-form-pane" action="">
			<div class="layui-form-item" pane>
				<label class="layui-form-label">选择分类</label>
				<div class="layui-input-block" id="type1">
				<!-- 分类加在这 -->
				</div>
			</div>
		</form>
	</div>
	

	
	<div class="site-demo-button" style="margin-left: 20px; margin-top: 10px;">
		<button class="layui-btn site-demo-layedit" data-type="content">发布</button>
	</div>
	<script>
		/* 可能是因为layer 的加载顺序不对 */
		$(document).ready(function(){
			$.ajax({
				url:"../getArticleType",
				dataType:'json',
				async:false,
				success:function(res){
					text='<input type="radio" name="type" value="'+res[0].id+'" title="'+res[0].type_name+'" checked>';
					if(res.length>1){
						for (var i = 1; i < res.length; i++) {
							text+='<input type="radio" name="type" value="'+res[i].id+'" title="'+res[i].type_name+'">'
						}
					}
					$("#type1").append(text);
				},
				error:function(res){
					swal("error", "获取文章类型失败", "error");
				}
			})
			
			$.ajax({
				url:"../content/id="+parent.getArticleId(),
				dataType:'json',
				success:function(res){
					$("input[name='title']").val(res.title);
					$("input[name='title2']").val(res.outline);
					$("#LAY_demo1").val(res.content);
					LAY_demo_upload.src = '<%=basePath1%>'+res.img_src
					
				},
				error:function(res){
					swal("error", "获取文章失败", "error");
				}
			})
			
			
		});
		
	
		layui.use('layedit', function() {
			var layedit = layui.layedit, $ = layui.jquery;


			//构建一个默认的编辑器
			var index = layedit.build('LAY_demo1');

			//编辑器外部操作
			var active = {
				content : function() {
					var title = $("#maintitle").val();
					var smalltitle = $("#smalltitle").val();
					if (typeof (title) == "undefined") {
						swal("抱歉", "好歹写个标题吧", "error");
						return;
					}
					if (typeof (smalltitle) == "undefined") {
						swal("抱歉", "副标题也不能拉...", "error");
						return;
					}
					if(filepath==""){
						swal("抱歉", "咳咳..必须上传个图片", "error");
						return;
					}
					//完整的内容包括标签
					var text1 = layedit.getContent(index);
					//纯文字内容
					var text2 = layedit.getText(index);
					var date = new Date().getTime();
					var a = $('input[name="type"]:checked').val();
					$.ajax({
						url : "../editArticle",
						 async: false,
						data : {
							id:parent.getArticleId(),						
							title : title,
							smalltitle : smalltitle,
							text1 : text1,
							text2 : text2,
							date : date,
							path :filepath,
							type_id:a
						},
						
						type : 'POST',
						dataType : 'json',
						success : function(res) {
							swal("good job", "保存成功", "success");
						}
					})
				},
			};

			$('.site-demo-layedit').on('click', function() {
				var type = $(this).data('type');
				active[type] ? active[type].call(this) : '';
			});

			//自定义工具栏
			layedit.build('LAY_demo2', {
				tool : [ 'face', 'link', 'unlink', '|', 'left', 'center',
						'right' ],
				height : 500,
			})
			
						

			
			
		});
		Date.prototype.format = function(format){ 
			var o = { 
			"M+" : this.getMonth()+1, //month 
			"d+" : this.getDate(), //day 
			"h+" : this.getHours(), //hour 
			"m+" : this.getMinutes(), //minute 
			"s+" : this.getSeconds(), //second 
			"q+" : Math.floor((this.getMonth()+3)/3),
			"S" : this.getMilliseconds() //millisecond 
			} 

			if(/(y+)/.test(format)) { 
			format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
			} 

			for(var k in o) { 
			if(new RegExp("("+ k +")").test(format)) { 
			format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length)); 
			} 
			} 
			return format; 
			} 
	</script>

</body>

</html>