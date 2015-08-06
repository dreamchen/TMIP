<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>"><!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%> 
	<script type="text/javascript">
	
		$(top.hangge());
		
		//新增
		function add(P_ID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>org/toAdd.do?P_ID='+P_ID+'&P_BM=JGLX';
			 diag.Width = 750;
			 diag.Height = 500;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					var num = '${page.currentPage}';
				 	if(num == '0'){
				 		top.jzts();
				 		location.href = location.href;
				 	}else{
				 		nextPage(${page.currentPage});
				 	}
				}
				 diag.close();
			 };
			 diag.show();
		}
		
		//修改
		function edit(ORG_ID){
			 top.jzts();
		   	 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>org/toEdit.do?ORG_ID='+ORG_ID+'&P_BM=JGLX';
			 diag.Width = 750;
			 diag.Height = 500;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				 diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(ORG_ID){
			var flag = false;
			if(confirm("确定要删除该数据吗?")){
				flag = true;
			}
			if(flag){
				top.jzts();
				var url = "<%=basePath%>org/del.do?ORG_ID="+ORG_ID+"&guid="+new Date().getTime();
				$.get(url,function(data){
					if("success" == data.result){
						top.jzts();
						nextPage(${page.currentPage});
					}else{
						top.hangge();
						alert("删除失败，请先删除其下级数据!"); 
					}
				});
			}
		}
		
	</script>
	</head>
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
	
			<!-- 检索  -->
			<form action="<%=basePath%>/org.do" method="post" name="orgForm" id="orgForm">
			<input name="P_ID" id="P_ID" type="hidden" value="${pd.P_ID }" />
			<table>
				<tr>
					<td><font color="#808080">检索：</font></td>
					<td><input type="text" name="NAME" value="${pd.NAME }" placeholder="这里输入名称" style="width:130px;"/></td>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"><i id="nav-search-icon" class="icon-search"></i></button></td>
					<c:if test="${pd.P_ID != '0'}">
						<c:choose>
						<c:when test="${not empty varsList}">
						<td style="vertical-align:top;"><a href="<%=basePath%>/org.do?P_ID=0" class="btn btn-mini btn-purple" title="查看">全部园区<i class="icon-arrow-right  icon-on-right"></i></a></td>
						<c:forEach items="${varsList}" var="var" varStatus="vsd">
						<td style="vertical-align:top;"><a href="<%=basePath%>/org.do?P_ID=${var.ORG_ID }" class="btn btn-mini btn-purple" title="查看">${var.NAME }<i class="icon-arrow-right  icon-on-right"></i></a></td>
						</c:forEach>
						</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
					</c:if>
				</tr>
			</table>
			<!-- 检索  -->
		
		
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<th class="center">
						<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th>
						<th class="center">序号</th>
						<th class="center">园区名称</th>
						<th class="center">组织机构代码</th>
<!-- 						<th class="center">上级机构ID</th> -->
<!-- 						<th class="center">上级机构代码</th> -->
<!-- 						<th class="center">级别</th> -->
<!-- 						<th class="center">顺序</th> -->
						<th class="center">成立时间</th>
<!-- 						<th class="center">人数规模</th> -->
<!-- 						<th class="center">园长</th> -->
						<th class="center">地址</th>
						<th class="center">联系电话</th>
<!-- 						<th class="center">邮箱</th> -->
<!-- 						<th class="center">官方网址</th> -->
<!-- 						<th class="center">简介</th> -->
<!-- 						<th class="center">其他备注</th> -->
<!-- 						<th class="center">预留字段一</th> -->
<!-- 						<th class="center">预留字段二</th> -->
<!-- 						<th class="center">预留字段三</th> -->
						<th class="center">操作</th>
					</tr>
				</thead>
										
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty varList}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td class='center' style="width: 30px;">
									<label><input type='checkbox' name='ids' value="${var.ORG_ID}" /><span class="lbl"></span></label>
								</td>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
										<td class='center'><a href="<%=basePath%>/org.do?P_ID=${var.ORG_ID }" title="查看下级"><i class="icon-arrow-right  icon-on-right"></i>&nbsp;${var.NAME }</a></td>
										<td>${var.PCODE}</td>
<!-- 										<td>${var.PID}</td> -->
<!-- 										<td>${var.PCODE}</td> -->
<!-- 										<td>${var.CLASS}</td> -->
<!-- 										<td>${var.ORDERS}</td> -->
										<td>${var.CREATEDATE}</td>
<!-- 										<td>${var.PERSONNUM}</td> -->
<!-- 										<td>${var.LEADER}</td> -->
										<td>${var.ADDRESS}</td>
										<td>${var.PHONE}</td>
<!-- 										<td>${var.EMAIL}</td> -->
<!-- 										<td>${var.URL}</td> -->
<!-- 										<td>${var.INTRO}</td> -->
<!-- 										<td>${var.REMARK}</td> -->
<!-- 										<td>${var.DEFAULTONE}</td> -->
<!-- 										<td>${var.DEFAULTTWO}</td> -->
<!-- 										<td>${var.DEFAULTTHREE}</td> -->
								<td style="width: 30px;" class="center">
									<div class='hidden-phone visible-desktop btn-group'>
									
										<c:if test="${QX.edit != 1 && QX.del != 1 }">
										<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="icon-lock" title="无权限"></i></span>
										</c:if>
										<div class="inline position-relative">
										<button class="btn btn-mini btn-info" data-toggle="dropdown"><i class="icon-cog icon-only"></i></button>
										<ul class="dropdown-menu dropdown-icon-only dropdown-light pull-right dropdown-caret dropdown-close">
											<c:if test="${QX.edit == 1 }">
											<li><a style="cursor:pointer;" title="编辑" onclick="edit('${var.ORG_ID}');" class="tooltip-success" data-rel="tooltip" title="" data-placement="left"><span class="green"><i class="icon-edit"></i></span></a></li>
											</c:if>
											<c:if test="${QX.del == 1 }">
											<li><a style="cursor:pointer;" title="删除" onclick="del('${var.ORG_ID}');" class="tooltip-error" data-rel="tooltip" title="" data-placement="left"><span class="red"><i class="icon-trash"></i></span> </a></li>
											</c:if>
										</ul>
										</div>
									</div>
								</td>
							</tr>
						
						</c:forEach>
						</c:if>
						<c:if test="${QX.cha == 0 }">
							<tr>
								<td colspan="100" class="center">您无权查看</td>
							</tr>
						</c:if>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center" >没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
					
				
				</tbody>
			</table>
			
			<div class="page-header position-relative">
			<table style="width:100%;">
				<tr>
					<c:if test="${QX.add == 1 }">
					<td style="vertical-align:top;width:50px;"><a class="btn btn-small btn-success" onclick="add('${pd.P_ID}');">新增</a></td>
					<c:if test="${pd.P_ID != '0'}">
						<td style="vertical-align:top;" class="left"><a class="btn btn-small btn-info" onclick="location.href='<%=basePath%>/org.do?P_ID=${pdp.P_ID }';">返回</a></td>
					</c:if>
					</c:if>
					<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
				</tr>
			</table>
			</div>
		</form>
	</div>
 
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		
		//检索
		function search(){
			top.jzts();
			$("#orgForm").submit();
		}
		</script>
		
		<script type="text/javascript">
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>org/excel.do';
		}
		</script>
		
	</body>
</html>

