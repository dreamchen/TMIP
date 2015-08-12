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
	
	
	//保存
	function save(){
			if($("#NAME").val()==""){
			$("#NAME").tips({
				side:3,
	            msg:'请输入学生姓名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NAME").focus();
			return false;
		}
		if($("#PICK_DATETIME").val()==""){
			$("#PICK_DATETIME").tips({
				side:3,
	            msg:'请输入接送时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PICK_DATETIME").focus();
			return false;
		}
		if($("#PICK_PEOPLE_ID").val()==""){
			$("#PICK_PEOPLE_ID").tips({
				side:3,
	            msg:'请输入接送人ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PICK_PEOPLE_ID").focus();
			return false;
		}
		if($("#PICK_PEOPLE_NAME").val()==""){
			$("#PICK_PEOPLE_NAME").tips({
				side:3,
	            msg:'请输入接送人名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PICK_PEOPLE_NAME").focus();
			return false;
		}
		if($("#IS_ENTRUST").val()==""){
			$("#IS_ENTRUST").tips({
				side:3,
	            msg:'请输入是否代接',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IS_ENTRUST").focus();
			return false;
		}
		if($("#IS_ENTRUST").prop("checked") && $("#ENTRUST_NAME").val()==""){
			$("#ENTRUST_NAME").tips({
				side:3,
				msg:'请输入代理人姓名',
				bg:'#AE81FF',
				time:2
			});
			$("#ENTRUST_NAME").focus();
			return false;
		}
		if($("#IS_ENTRUST").prop("checked") && $("#ENTRUST_CARD").val()==""){
			$("#ENTRUST_CARD").tips({
				side:3,
	            msg:'请输入代理人身份证号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ENTRUST_CARD").focus();
			return false;
		}
		if($("#IS_ENTRUST").prop("checked") && $("#ENTRUST_PHOTO").val()==""){
			$("#ENTRUST_PHOTO").tips({
				side:3,
	            msg:'请输入代理人照片',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ENTRUST_PHOTO").focus();
			return false;
		}
		if($("#IS_ENTRUST").prop("checked") && $("#ENTRUST_CARD_PHOTO").val()==""){
			$("#ENTRUST_CARD_PHOTO").tips({
				side:3,
	            msg:'请输入代理人身份证照片',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ENTRUST_CARD_PHOTO").focus();
			return false;
		}
		if($("#IS_ENTRUST").prop("checked") && $("#ENTRUST_INFO").val()==""){
			$("#ENTRUST_INFO").tips({
				side:3,
	            msg:'请输入委托详情',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ENTRUST_INFO").focus();
			return false;
		}
		if($("#TYPE").val()==""){
			$("#TYPE").tips({
				side:3,
	            msg:'请输入0:送 1:接',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TYPE").focus();
			return false;
		}
//		if($("#STATUS").val()==""){
//			$("#STATUS").tips({
//				side:3,
//	            msg:'请输入数据状态',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#STATUS").focus();
//			return false;
//		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="pickrecord/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="PICKRECORD_ID" id="PICKRECORD_ID" value="${pd.PICKRECORD_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">学生姓名:</td>
				<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="32" placeholder="这里输入学生姓名" title="学生姓名"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">接送时间:</td>
				<td><input type="text" name="PICK_DATETIME" id="PICK_DATETIME" value="${pd.PICK_DATETIME}" readonly="readonly" placeholder="接送时间" title="接送时间"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">接送人ID:</td>
				<td><input type="text" name="PICK_PEOPLE_ID" id="PICK_PEOPLE_ID" value="${pd.PICK_PEOPLE_ID}" maxlength="32" placeholder="这里输入接送人ID" title="接送人ID"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">接送人名称:</td>
				<td><input type="text" name="PICK_PEOPLE_NAME" id="PICK_PEOPLE_NAME" value="${pd.PICK_PEOPLE_NAME}" maxlength="32" placeholder="这里输入接送人名称" title="接送人名称"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">是否代接:</td>
				<td>
					<label>
						<input type="checkbox" ${pd.IS_ENTRUST==1?"checked":""} value="1" id="IS_ENTRUST" name="IS_ENTRUST" class="ace ace-switch ace-switch-6" />
						<span class="lbl"></span>
					</label>
					<%--<input type="hidden" name="IS_ENTRUST" id="IS_ENTRUST" value="${pd.IS_ENTRUST}" maxlength="32" placeholder="这里输入是否代接" title="是否代接"/></td>--%>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">代理人姓名:</td>
				<td><input type="text" name="ENTRUST_NAME" id="ENTRUST_NAME" value="${pd.ENTRUST_NAME}" maxlength="32" placeholder="这里输入代理人姓名" title="代理人姓名"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">代理人身份证号:</td>
				<td><input type="text" name="ENTRUST_CARD" id="ENTRUST_CARD" value="${pd.ENTRUST_CARD}" maxlength="32" placeholder="这里输入代理人身份证号" title="代理人身份证号"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">代理人照片:</td>
				<td>
					<input type="file" name="ENTRUST_PHOTO" id="ENTRUST_PHOTO" />
					<%--<input type="text" name="ENTRUST_PHOTO" id="ENTRUST_PHOTO" value="${pd.ENTRUST_PHOTO}" maxlength="32" placeholder="这里输入代理人照片" title="代理人照片"/></td>--%>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">代理人身份证照片:</td>
				<td>
					<input type="file" name="ENTRUST_CARD_PHOTO" id="ENTRUST_CARD_PHOTO" />
					<%--<input type="text" name="ENTRUST_CARD_PHOTO" id="ENTRUST_CARD_PHOTO" value="${pd.ENTRUST_CARD_PHOTO}" maxlength="32" placeholder="这里输入代理人身份证照片" title="代理人身份证照片"/></td>--%>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">委托详情:</td>
				<td>
					<textarea class="form-control" rows="3" name="ENTRUST_INFO" id="ENTRUST_INFO" value="${pd.ENTRUST_INFO}" maxlength="500" placeholder="这里输入委托详情" title="委托详情"></textarea>
					<%--<input type="textarea" name="ENTRUST_INFO" id="ENTRUST_INFO" value="${pd.ENTRUST_INFO}" maxlength="32" placeholder="这里输入委托详情" title="委托详情"/>--%>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">接/送状态:</td>
				<td><input type="text" name="TYPE" id="TYPE" value="${pd.TYPE}" maxlength="32" placeholder="这里输入0:送 1:接" title="0:送 1:接"/></td>
			</tr>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">数据状态:</td>--%>
				<%--<td>--%>
					<input type="hidden" name="STATUS" id="STATUS" value="1" maxlength="32" placeholder="这里输入数据状态" title="数据状态"/>
				<%--</td>--%>
			<%--</tr>--%>
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

			//文件上传
			$('#ENTRUST_PHOTO').ace_file_input();
			$('#ENTRUST_CARD_PHOTO').ace_file_input();
		});
		
		</script>
</body>
</html>