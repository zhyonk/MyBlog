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
<title>è¡¨å</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">

<link rel="stylesheet" href="plugins/layui/css/layui.css" media="all" />
<script type="text/javascript" src="../js/jquery-2.1.1.js"></script>
<link rel="stylesheet"
	href="plugins/font-awesome/css/font-awesome.min.css">
<%-- <script type="text/javascript" src="<%=basePath1%>js/sweet-alert.min.js"></script>
<link rel="stylesheet" href="<%=basePath1%>css/sweet-alert.css"> --%>
<script type="text/javascript" src="<%=basePath%>datas/area_data.js"></script>
</head>

<body>
	<div style="margin: 15px;">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 20px;">
			<legend>系统设置</legend>
		</fieldset>

		<form class="layui-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">站点标题</label>
				<div class="layui-input-block">
					<input type="text" name="title" lay-verify="title"
						autocomplete="off" placeholder="请输入站点标题" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">副标题</label>
				<div class="layui-input-block">
					<input type="text" name="username" lay-verify="required"
						placeholder="副标题" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">电子邮件</label>
				<div class="layui-input-inline">
					<input type="text" name="email" lay-verify="email"
						autocomplete="off" class="layui-input">
				</div>
			</div>

			<!-- 			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">日期</label>
					<div class="layui-input-block">
						<input type="text" name="date" id="date" lay-verify="date"
							placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input"
							onclick="layui.laydate({elem: this})">
					</div>
				</div>
			</div> -->

			<div class="layui-form-item">
				<label class="layui-form-label">单行选择框</label>
				<div class="layui-input-block">
					<select name="interest" lay-filter="aihao">
						<option value=""></option>
						<option value="0">写作</option>
						<option value="1" selected="">阅读</option>
						<option value="2">游戏</option>
						<option value="3">音乐</option>
						<option value="4">旅行</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">分组选择框</label>
				<div class="layui-input-inline">
					<select id="quiz">
						<option value="">请选择问题</option>
						<optgroup label="城市记忆">
							<option value="你工作的第一个城市">你工作的第一个城市</option>
						</optgroup>
						<optgroup label="学生时代">
							<option value="你的工号">你的工号</option>
							<option value="你最喜欢的老师">你最喜欢的老师</option>
						</optgroup>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">行内选择框</label>
				<div class="layui-input-inline">
					<select id="provice">
						<option value="">请选择省</option>
					</select>
				</div>
				<div class="layui-input-inline">
					<select id="city">
						<option value="">请选择市</option>
						<option value="杭州">杭州</option>
						<option value="宁波" disabled="">宁波</option>
						<option value="温州">温州</option>
						<option value="温州">台州</option>
						<option value="温州">绍兴</option>
					</select>
				</div>
				<div class="layui-input-inline">
					<select id="village">
						<option value="">请选择县/区</option>
						<option value="西湖区">西湖区</option>
						<option value="余杭区">余杭区</option>
						<option value="拱墅区">临安市</option>
					</select>
				</div>
			</div>
			<script type="text/javascript">
				var text = "";
				for (var i = 0; i < Area.length; i++) {
					text += '<option value="'+Area[i].provinceName+'">'
							+ Area[i].provinceName + '</option>'
				}
				$("#provice").append(text);
				
				$("#provice").change('click',function(data){
					alert("点了一下")
				});
				
			</script>
			<div class="layui-form-item">
				<label class="layui-form-label">复选框</label>
				<div class="layui-input-block">
					<input type="checkbox" name="like[write]" title="写作"> <input
						type="checkbox" name="like[read]" title="阅读" checked=""> <input
						type="checkbox" name="like[game]" title="游戏">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">开关-关</label>
				<div class="layui-input-block">
					<input type="checkbox" name="close" lay-skin="switch" title="开关">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">开关-开</label>
				<div class="layui-input-block">
					<input type="checkbox" checked="" name="open" lay-skin="switch"
						lay-filter="switchTest" title="开关">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">单选框</label>
				<div class="layui-input-block">
					<input type="radio" name="sex" value="男" title="男" checked="">
					<input type="radio" name="sex" value="女" title="女"> <input
						type="radio" name="sex" value="禁" title="禁用" disabled="">
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">普通文本域</label>
				<div class="layui-input-block">
					<textarea placeholder="请输入内容" class="layui-textarea"></textarea>
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">编辑器</label>
				<div class="layui-input-block">
					<textarea class="layui-textarea layui-hide" name="content"
						lay-verify="content" id="LAY_demo_editor"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="plugins/layui/layui.js"></script>
	<script>
		layui
				.use(
						[ 'form', 'layedit', 'laydate' ],
						function() {
							var form = layui.form(), layer = layui.layer, layedit = layui.layedit, $ = layui.jquery, laydate = layui.laydate;

							//创建一个编辑器
							var editIndex = layedit.build('LAY_demo_editor');
							//自定义验证规则
							form.verify({
								title : function(value) {
									if (value.length < 5) {
										return '标题至少得5个字符啊';
									}
								},
								pass : [ /(.+){6,12}$/, '密码必须6到12位' ],
								content : function(value) {
									layedit.sync(editIndex);
								}
							});

							//监听提交
							form.on('submit(demo1)', function(data) {
								layer.alert(JSON.stringify(data.field), {
									title : '最终的提交信息'
								})
								return false;
							});

						});
	</script>
</body>

</html>