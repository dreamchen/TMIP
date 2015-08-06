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
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	$(top.hangge());
	//保存
	function save(){
			if($("#NAME").val()==""){
			$("#NAME").tips({
				side:3,
	            msg:'请输入园区名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NAME").focus();
			return false;
		}
		if($("#CODE").val()==""|| $("#CODE").val()=="此编码已存在!"){
			$("#CODE").tips({
				side:3,
	            msg:'请输入组织机构代码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CODE").focus();
			return false;
		}
		if ($("#DEFAULTONE").val() == "") {

                $("#DEFAULTONE").tips({
                    side: 3,
                    msg: '选择机构类型',
                    bg: '#AE81FF',
                    time: 2
                });

                $("#DEFAULTONE").focus();
                return false;
            }
// 		if($("#PCODE").val()==""){
// 			$("#PCODE").tips({
// 				side:3,
// 	            msg:'请输入上级机构代码',
// 	            bg:'#AE81FF',
// 	            time:2
// 	        });
// 			$("#PCODE").focus();
// 			return false;
// 		}
// 		if($("#CLASS").val()==""){
// 			$("#CLASS").tips({
// 				side:3,
// 	            msg:'请输入级别',
// 	            bg:'#AE81FF',
// 	            time:2
// 	        });
// 			$("#CLASS").focus();
// 			return false;
// 		}
		if($("#ORDERS").val()==""){
			$("#ORDERS").tips({
				side:3,
	            msg:'请输入顺序',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ORDERS").focus();
			return false;
		}
		if($("#CREATEDATE").val()==""){
			$("#CREATEDATE").tips({
				side:3,
	            msg:'请输入成立时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATEDATE").focus();
			return false;
		}
		if($("#PERSONNUM").val()==""){
			$("#PERSONNUM").tips({
				side:3,
	            msg:'请输入人数规模',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PERSONNUM").focus();
			return false;
		}
		if($("#LEADER").val()==""){
			$("#LEADER").tips({
				side:3,
	            msg:'请输入园长',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#LEADER").focus();
			return false;
		}
// 		if($("#ADDRESS").val()==""){
// 			$("#ADDRESS").tips({
// 				side:3,
// 	            msg:'请输入地址',
// 	            bg:'#AE81FF',
// 	            time:2
// 	        });
// 			$("#ADDRESS").focus();
// 			return false;
// 		}
// 		if($("#PHONE").val()==""){
// 			$("#PHONE").tips({
// 				side:3,
// 	            msg:'请输入联系电话',
// 	            bg:'#AE81FF',
// 	            time:2
// 	        });
// 			$("#PHONE").focus();
// 			return false;
// 		}
// 		if($("#EMAIL").val()==""){
// 			$("#EMAIL").tips({
// 				side:3,
// 	            msg:'请输入邮箱',
// 	            bg:'#AE81FF',
// 	            time:2
// 	        });
// 			$("#EMAIL").focus();
// 			return false;
// 		}
// 		if($("#URL").val()==""){
// 			$("#URL").tips({
// 				side:3,
// 	            msg:'请输入官方网址',
// 	            bg:'#AE81FF',
// 	            time:2
// 	        });
// 			$("#URL").focus();
// 			return false;
// 		}
// 		if($("#INTRO").val()==""){
// 			$("#INTRO").tips({
// 				side:3,
// 	            msg:'请输入简介',
// 	            bg:'#AE81FF',
// 	            time:2
// 	        });
// 			$("#INTRO").focus();
// 			return false;
// 		}
// 		if($("#REMARK").val()==""){
// 			$("#REMARK").tips({
// 				side:3,
// 	            msg:'请输入其他备注',
// 	            bg:'#AE81FF',
// 	            time:2
// 	        });
// 			$("#REMARK").focus();
// 			return false;
// 		}
// 		if($("#DEFAULTONE").val()==""){
// 			$("#DEFAULTONE").tips({
// 				side:3,
// 	            msg:'请输入预留字段一',
// 	            bg:'#AE81FF',
// 	            time:2
// 	        });
// 			$("#DEFAULTONE").focus();
// 			return false;
// 		}
// 		if($("#DEFAULTTWO").val()==""){
// 			$("#DEFAULTTWO").tips({
// 				side:3,
// 	            msg:'请输入预留字段二',
// 	            bg:'#AE81FF',
// 	            time:2
// 	        });
// 			$("#DEFAULTTWO").focus();
// 			return false;
// 		}
// 		if($("#DEFAULTTHREE").val()==""){
// 			$("#DEFAULTTHREE").tips({
// 				side:3,
// 	            msg:'请输入预留字段三',
// 	            bg:'#AE81FF',
// 	            time:2
// 	        });
// 			$("#DEFAULTTHREE").focus();
// 			return false;
// 		}
// 		$("#Form").submit();
// 		$("#zhongxin").hide();
// 		$("#zhongxin2").show();

		has();
	}
	
	//判断编码是否存在
	function has(){
		var ORG_ID = $("#ORG_ID").val();
		var CODE = $("#CODE").val();
		var url = "org/has.do?CODE="+CODE+"&ORG_ID="+ORG_ID+"&tm="+new Date().getTime();
		$.get(url,function(data){
			if(data=="error"){
				$("#CODE").css("background-color","#D16E6C");
				$("#CODE").focus();
// 				setTimeout("$('#CODE').val('此编码已存在!')",500);
				
			}else{
				$("#Form").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			}
		});
	}
	
</script>
	</head>
<body>
	<form action="org/save.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ORG_ID" id="ORG_ID" value="${pd.ORG_ID}"/>
		<input type="hidden" name="P_ID" id="P_ID" value="${pd.P_ID }"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">园区名称:</td>
				<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="32" placeholder="这里输入园区名称" title="园区名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">组织机构代码:</td>
				<td><input type="text" name="CODE" id="CODE" value="${pd.CODE}" maxlength="32" placeholder="这里输入组织机构代码" title="组织机构代码"/></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td style="width:70px;text-align: right;padding-top: 13px;">上级机构代码:</td> -->
<!-- 				<td><input type="text" name="PCODE" id="PCODE" value="${pd.PCODE}" maxlength="32" placeholder="这里输入上级机构代码" title="上级机构代码"/></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td style="width:70px;text-align: right;padding-top: 13px;">级别:</td> -->
<!-- 				<td><input type="number" name="CLASS" id="CLASS" value="${pd.CLASS}" maxlength="32" placeholder="这里输入级别" title="级别"/></td> -->
<!-- 			</tr> -->
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">机构类型:</td>
				<td>
					<select class="chzn-select" name="DEFAULTONE" id="DEFAULTONE" data-placeholder="请选择机构类型">
						<option value=""></option>
						<c:forEach items="${dictList }" var="var">
							<option value="${var.ZD_ID }" <c:if test="${var.ZD_ID == pd.DEFAULTONE }">selected</c:if>>${var.NAME }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">顺序:</td>
				<td><input type="number" name="ORDERS" id="ORDERS" value="${pd.ORDERS}" maxlength="32" placeholder="这里输入顺序" title="顺序"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">成立时间:</td>
				<td><input class="span10 date-picker" name="CREATEDATE" id="CREATEDATE" value="${pd.CREATEDATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="成立时间" title="成立时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">人数规模:</td>
				<td><input type="number" name="PERSONNUM" id="PERSONNUM" value="${pd.PERSONNUM}" maxlength="32" placeholder="这里输入人数规模" title="人数规模"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">园长:</td>
				<td><input type="text" name="LEADER" id="LEADER" value="${pd.LEADER}" maxlength="32" placeholder="这里输入园长" title="园长"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">地址:</td>
				<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="32" placeholder="这里输入地址" title="地址"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">联系电话:</td>
				<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="32" placeholder="这里输入联系电话" title="联系电话"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">邮箱:</td>
				<td><input type="text" name="EMAIL" id="EMAIL" value="${pd.EMAIL}" maxlength="32" placeholder="这里输入邮箱" title="邮箱"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">官方网址:</td>
				<td><input type="text" name="URL" id="URL" value="${pd.URL}" maxlength="32" placeholder="这里输入官方网址" title="官方网址"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">简介:</td>
				<td><input type="text" name="INTRO" id="INTRO" value="${pd.INTRO}" maxlength="32" placeholder="这里输入简介" title="简介"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">其他备注:</td>
				<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="32" placeholder="这里输入其他备注" title="其他备注"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
		
		<script type="text/javascript">
			var msg = '${msg}';
			if(msg == 'no'){
				$("#CODE").attr("readonly",true);
				
			}
		
		</script>
</body>
</html>