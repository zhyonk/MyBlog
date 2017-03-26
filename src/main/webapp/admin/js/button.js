layui.config({
			base : 'js/',
			debug : true
		}).use(
				[ 'tab', 'navbar', 'layer', 'element' ],
				function() {

					var element = layui.element(), $ = layui.jquery, layer = layui.layer;
					// 获取index中的tab对象
					var parentTab = parent.getTab();
					
					var TableInit = function() {
						var oTableInit = new Object();

						// 初始化Table

						var table_option = {
							url : '../getAllArticle', // 请求后台的URL（*）
							method : 'get', // 请求方式（*）
							striped : false, // 是否显示行间隔色
							cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
							pagination : true, // 是否显示分页（*）
							sortable : true, // 是否启用排序
							sortOrder : "desc", // 排序方式
							queryParams : oTableInit.queryParams,// 传递参数（*）
							sidePagination : "client", // 分页方式：client客户端分页，server服务端分页（*）
							pageNumber : 1, // 初始化加载第一页，默认第一页
							pageSize : 10, // 每页的记录行数（*）
							pageList : [ 10, 25, 50, 100 ], // 可供选择的每页的行数（*）
							search : false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
							strictSearch : true,
							showColumns : true, // 是否显示所有的列
							showRefresh : true, // 是否显示刷新按钮
							minimumCountColumns : 2, // 最少允许的列数
							clickToSelect : true, // 是否启用点击选中行
							height : 500, // 行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
							uniqueId : "ID", // 每一行的唯一标识，一般为主键列
							showToggle : false, // 是否显示详细视图和列表视图的切换按钮
							cardView : false, // 是否显示详细视图
							detailView : false, // 是否显示父子表
							columns : [ {
								field : 'article_id',
								title : '编号'
							}, {
								field : 'author',
								title : '作者'
							}, {
								field : 'title',
								title : '标题'
							}, {
								field : 'img_src',
								title : '图片地址'
							}, {
								field : 'strDate',
								title : '最后操作时间'
							}, {
								title : '操作',
								field : 'operate',
								align : 'center',
								events : actionEvents,
								formatter : actionFormatter
							} ]
						};
						oTableInit.Init = function() {
							$('#all_table').bootstrapTable(table_option);
						};
						// 得到查询的参数
						oTableInit.queryParams = function(params) {
							var temp = { // 这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
								limit : params.limit, // 页面大小
								offset : params.offset, // 页码
								departmentname : $("#txt_search_departmentname")
										.val(),
								statu : $("#txt_search_statu").val()
							};
							return temp;
						};
						return oTableInit;
					};

					// value: 所在collumn的当前显示值，
					// row:整个行的数据 ，对象化，可通过.获取
					// 表格-操作 - 格式化
					function actionFormatter(value, row, index) {
						return [
								'<a class="mod" href="javascript:void(0)" title="Like">',
								'<i class="glyphicon glyphicon-edit">修改&nbsp;</i>',
								'</a>  ',
								'<a class="delete" href="javascript:void(0)" title="Remove">',
								'<i class="glyphicon glyphicon-trash">删除</i>',
								'</a>' ].join('');
					}

					// 表格 - 操作 - 事件
					window.actionEvents = {
						'click .mod' : function(e, value, row, index) {
							// 修改操作
							var article_id = row.article_id;
							var obj = {
									href : "admin/edit_Article.jsp",
									icon : "fa-cogs",
									title : "编辑文章"
								}
							parent.setArticeId(article_id);
							parentTab.tabAdd(obj);
							
//							swal("呃呃", parent.getArticleId(), "success");

						},
						'click .delete' : function(e, value, row, index) {
							var article_id = row.article_id;
							$.ajax({
								url:'../delArticleById',
								data:{
									article_id:article_id
								},
								type:'POST',
								dataType:'json',
								success:function(){
									swal("干的漂亮！", row.title+"\n删除成功", "success");
									$('#all_table').bootstrapTable('refresh');
								},
								error:function(){
									swal("啊？抱歉", row.title+"\n删除失败", "error");
								}
							})
							// 删除操作
						}
					}

					// 1.初始化Table
					var oTable = new TableInit();
					var ini = oTable.Init();

				})