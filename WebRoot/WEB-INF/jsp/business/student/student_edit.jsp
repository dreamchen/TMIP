<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8"/>
    <title></title>
    <meta name="description" content="overview & stats"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="static/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="static/css/bootstrap-responsive.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="static/css/font-awesome.min.css"/>
    <!-- 下拉框 -->
    <link rel="stylesheet" href="static/css/chosen.css"/>

    <link rel="stylesheet" href="static/css/ace.min.css"/>
    <link rel="stylesheet" href="static/css/ace-responsive.min.css"/>
    <link rel="stylesheet" href="static/css/ace-skins.min.css"/>

    <link rel="stylesheet" href="static/css/datepicker.css"/>
    <!-- 日期框 -->
    <script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="static/js/jquery.tips.js"></script>
    
    <!-- easyui -->
    <link rel="stylesheet" type="text/css" href="static/js/jquery-easyui-1.4.2/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="static/js/jquery-easyui-1.4.2/themes/icon.css">
	<script type="text/javascript" src="static/js/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>

    <script type="text/javascript">


        //保存
        function save() {
                        if ($("#STUDENT_NO").val() == "") {
                    $("#STUDENT_NO").tips({
                        side: 3,
                        msg: '请输入学生学号',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#STUDENT_NO").focus();
                    return false;
                }
                if ($("#NAME").val() == "") {
                    $("#NAME").tips({
                        side: 3,
                        msg: '请输入学生名称',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#NAME").focus();
                    return false;
                }
                if ($("#BIRTHDAY").val() == "") {
                    $("#BIRTHDAY").tips({
                        side: 3,
                        msg: '请输入出生日期',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#BIRTHDAY").focus();
                    return false;
                }
                if ($("#GENDER").val() == "") {
                    $("#GENDER").tips({
                        side: 3,
                        msg: '请输入性别',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#GENDER").focus();
                    return false;
                }
                if ($("#BLOOD_TYPE").val() == "") {
                    $("#BLOOD_TYPE").tips({
                        side: 3,
                        msg: '请输入血型',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#BLOOD_TYPE").focus();
                    return false;
                }
                if ($("#ID_CARD_NUMBER").val() == "") {
                    $("#ID_CARD_NUMBER").tips({
                        side: 3,
                        msg: '请输入身份证',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#ID_CARD_NUMBER").focus();
                    return false;
                }
                if ($("#ADDRESS").val() == "") {
                    $("#ADDRESS").tips({
                        side: 3,
                        msg: '请输入家庭住址',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#ADDRESS").focus();
                    return false;
                }
                if ($("#KINDERGARTEN_ID").val() == "") {
                    $("#KINDERGARTEN_ID").tips({
                        side: 3,
                        msg: '请输入园区名称',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#KINDERGARTEN_ID").focus();
                    return false;
                }
                if ($("#CLASS_ID").val() == "") {
                    $("#CLASS_ID").tips({
                        side: 3,
                        msg: '请输入班级名称',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#CLASS_ID").focus();
                    return false;
                }
                if ($("#REMARK").val() == "") {
                    $("#REMARK").tips({
                        side: 3,
                        msg: '请输入备注',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#REMARK").focus();
                    return false;
                }
            $("#Form").submit();
            $("#zhongxin").hide();
            $("#zhongxin2").show();
        }

    </script>
    
   
</head>
<body>
<form action="student/${msg }.do" name="Form" id="Form" method="post">
    <input type="hidden" name="STUDENT_ID" id="STUDENT_ID"
           value="${pd.STUDENT_ID}"/>

    <div id="zhongxin">
        <table id="table_report" class="table table-striped table-bordered table-hover">
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">学生学号:</td>
                        <td><input type="text" name="STUDENT_NO" id="STUDENT_NO" value="${pd.STUDENT_NO}"
                                   maxlength="32" placeholder="这里输入学生学号" title="学生学号"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">学生名称:</td>
                        <td><input type="text" name="NAME" id="NAME" value="${pd.NAME}"
                                   maxlength="32" placeholder="这里输入学生名称" title="学生名称"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">出生日期:</td>
                        <td><input class="span10 date-picker" name="BIRTHDAY" id="BIRTHDAY"
                                   value="${pd.BIRTHDAY}" type="text" data-date-format="yyyy-mm-dd"
                                   readonly="readonly" placeholder="出生日期" title="出生日期"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">性别:</td>
                        <!--<td>
                        	<input type="text" name="GENDER" id="GENDER" value="${pd.GENDER}"  maxlength="32" placeholder="这里输入性别" title="性别"/>
                         </td>  -->
                         <td>
	                         <select class="chzn-select"  name="GENDER" id="GENDER">
	                         	<option value="">请选择性别</option>
	                         	<c:forEach items="${xb }"  var="var">
	                         		<option value="${var.zd_id }" <c:if test="${var.zd_id eq pd.GENDER }">selected</c:if>>${var.name }</option>
	                         	</c:forEach>
	                         </select>
	                         
                         </td>
                         
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">血型:</td>
                        <!-- <td>
                        	<input class="easyui-combobox" type="text" name="BLOOD_TYPE" id="BLOOD_TYPE" value="${pd.BLOOD_TYPE}"  maxlength="32" placeholder="这里输入血型" title="血型"/>
                         </td> -->
                         <td>
	                         <select class="chzn-select"  name="BLOOD_TYPE" id="BLOOD_TYPE">
	                         	<option value="">请选择血型</option>
	                         	<c:forEach items="${xx }"  var="var">
	                         		<option value="${var.zd_id }" <c:if test="${var.zd_id eq pd.BLOOD_TYPE }">selected</c:if>>${var.name }</option>
	                         	</c:forEach>
	                         </select>
	                         
                         </td>
                    </tr>
                    
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">身份证:</td>
                        <td><input type="text" name="ID_CARD_NUMBER" id="ID_CARD_NUMBER" value="${pd.ID_CARD_NUMBER}"
                                   maxlength="32" placeholder="这里输入身份证" title="身份证"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">家庭住址:</td>
                        <td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}"
                                   maxlength="32" placeholder="这里输入家庭住址" title="家庭住址"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">园区名称:</td>
                        <td><input type="text" name="KINDERGARTEN_ID" id="KINDERGARTEN_ID" value="${pd.KINDERGARTEN_ID}"
                                   maxlength="32" placeholder="这里输入园区名称" title="园区名称"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">班级名称:</td>
                        <td><input type="text" name="CLASS_ID" id="CLASS_ID" value="${pd.CLASS_ID}"
                                   maxlength="32" placeholder="这里输入班级名称" title="班级名称"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">备注:</td>
                        <td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}"
                                   maxlength="32" placeholder="这里输入备注" title="备注"/></td>
                    </tr>
            <tr>
                <td style="text-align: center;" colspan="10">
                    <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
                    <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
                </td>
            </tr>
        </table>
    </div>

    <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img
            src="static/images/jiazai.gif"/><br/><h4 class="lighter block green">提交中...</h4></div>

</form>


<!-- 引入 -->
<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>
<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
<!-- 下拉框 -->
<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script>
<!-- 日期框 -->
<script type="text/javascript">
    $(top.hangge());
    $(function () {

        //单选框
        $(".chzn-select").chosen();
        $(".chzn-select-deselect").chosen({allow_single_deselect: true});

        //日期框
        $('.date-picker').datepicker();

    });

</script>
</body>
</html>