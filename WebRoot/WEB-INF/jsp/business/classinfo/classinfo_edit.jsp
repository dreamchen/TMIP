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

    <script type="text/javascript">


        //保存
        function save() {
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
                if ($("#CLASS_NAME").val() == "") {
                    $("#CLASS_NAME").tips({
                        side: 3,
                        msg: '请输入班级名称',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#CLASS_NAME").focus();
                    return false;
                }
                if ($("#QUANTITY").val() == "") {
                    $("#QUANTITY").tips({
                        side: 3,
                        msg: '请输入班级人数',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#QUANTITY").focus();
                    return false;
                }
                if ($("#MAIN_TEACHER_ID").val() == "") {
                    $("#MAIN_TEACHER_ID").tips({
                        side: 3,
                        msg: '请输入班主任老师',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#MAIN_TEACHER_ID").focus();
                    return false;
                }
                if ($("#DIETITIAN_ID").val() == "") {
                    $("#DIETITIAN_ID").tips({
                        side: 3,
                        msg: '请输入营养师',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#DIETITIAN_ID").focus();
                    return false;
                }
                if ($("#CLASS_TYPE").val() == "") {
                    $("#CLASS_TYPE").tips({
                        side: 3,
                        msg: '请输入班级类型',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#CLASS_TYPE").focus();
                    return false;
                }
                if ($("#STATUS").val() == "") {
                    $("#STATUS").tips({
                        side: 3,
                        msg: '请输入班级状态',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#STATUS").focus();
                    return false;
                }
                if ($("#CLASS_BEGIN_TIME").val() == "") {
                    $("#CLASS_BEGIN_TIME").tips({
                        side: 3,
                        msg: '请输入开班时间',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#CLASS_BEGIN_TIME").focus();
                    return false;
                }
                if ($("#GROWTH_STAGE_BEGIN").val() == "") {
                    $("#GROWTH_STAGE_BEGIN").tips({
                        side: 3,
                        msg: '请输入成长阶段开始时间',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#GROWTH_STAGE_BEGIN").focus();
                    return false;
                }
                if ($("#GROWTH_STAGE_END").val() == "") {
                    $("#GROWTH_STAGE_END").tips({
                        side: 3,
                        msg: '请输入成长阶段结束',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#GROWTH_STAGE_END").focus();
                    return false;
                }
                if ($("#STATUS_CHANGE_TIME").val() == "") {
                    $("#STATUS_CHANGE_TIME").tips({
                        side: 3,
                        msg: '请输入状态改变日期',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#STATUS_CHANGE_TIME").focus();
                    return false;
                }
                if ($("#DESCRIPTION").val() == "") {
                    $("#DESCRIPTION").tips({
                        side: 3,
                        msg: '请输入班级简介',
                        bg: '#AE81FF',
                        time: 2
                    });
                    $("#DESCRIPTION").focus();
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
<form action="classinfo/${msg }.do" name="Form" id="Form" method="post">
    <input type="hidden" name="CLASSINFO_ID" id="CLASSINFO_ID"
           value="${pd.CLASSINFO_ID}"/>

    <div id="zhongxin">
        <table id="table_report" class="table table-striped table-bordered table-hover">
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">园区名称:</td>
                        <td><input type="text" name="KINDERGARTEN_ID" id="KINDERGARTEN_ID" value="${pd.KINDERGARTEN_ID}"
                                   maxlength="32" placeholder="这里输入园区名称" title="园区名称"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">班级名称:</td>
                        <td><input type="text" name="CLASS_NAME" id="CLASS_NAME" value="${pd.CLASS_NAME}"
                                   maxlength="32" placeholder="这里输入班级名称" title="班级名称"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">班级人数:</td>
                        <td><input type="number" name="QUANTITY" id="QUANTITY" value="${pd.QUANTITY}"
                                   maxlength="32" placeholder="这里输入班级人数" title="班级人数"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">班主任老师:</td>
                        <td><input type="text" name="MAIN_TEACHER_ID" id="MAIN_TEACHER_ID" value="${pd.MAIN_TEACHER_ID}"
                                   maxlength="32" placeholder="这里输入班主任老师" title="班主任老师"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">营养师:</td>
                        <td><input type="text" name="DIETITIAN_ID" id="DIETITIAN_ID" value="${pd.DIETITIAN_ID}"
                                   maxlength="32" placeholder="这里输入营养师" title="营养师"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">班级类型:</td>
                        <td><input type="text" name="CLASS_TYPE" id="CLASS_TYPE" value="${pd.CLASS_TYPE}"
                                   maxlength="32" placeholder="这里输入班级类型" title="班级类型"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">班级状态:</td>
                        <td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}"
                                   maxlength="32" placeholder="这里输入班级状态" title="班级状态"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">开班时间:</td>
                        <td><input class="span10 date-picker" name="CLASS_BEGIN_TIME" id="CLASS_BEGIN_TIME"
                                   value="${pd.CLASS_BEGIN_TIME}" type="text" data-date-format="yyyy-mm-dd"
                                   readonly="readonly" placeholder="开班时间" title="开班时间"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">成长阶段开始时间:</td>
                        <td><input class="span10 date-picker" name="GROWTH_STAGE_BEGIN" id="GROWTH_STAGE_BEGIN"
                                   value="${pd.GROWTH_STAGE_BEGIN}" type="text" data-date-format="yyyy-mm-dd"
                                   readonly="readonly" placeholder="成长阶段开始时间" title="成长阶段开始时间"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">成长阶段结束:</td>
                        <td><input class="span10 date-picker" name="GROWTH_STAGE_END" id="GROWTH_STAGE_END"
                                   value="${pd.GROWTH_STAGE_END}" type="text" data-date-format="yyyy-mm-dd"
                                   readonly="readonly" placeholder="成长阶段结束" title="成长阶段结束"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">状态改变日期:</td>
                        <td><input class="span10 date-picker" name="STATUS_CHANGE_TIME" id="STATUS_CHANGE_TIME"
                                   value="${pd.STATUS_CHANGE_TIME}" type="text" data-date-format="yyyy-mm-dd"
                                   readonly="readonly" placeholder="状态改变日期" title="状态改变日期"/></td>
                    </tr>
                    <tr>
                        <td style="width:70px;text-align: right;padding-top: 13px;">班级简介:</td>
                        <td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}"
                                   maxlength="32" placeholder="这里输入班级简介" title="班级简介"/></td>
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