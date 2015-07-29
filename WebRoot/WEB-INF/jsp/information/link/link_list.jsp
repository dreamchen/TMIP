﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">

    <!-- jsp文件头和头部 -->
    <%@ include file="../../system/admin/top.jsp" %>

</head>

<body>


<div class="container-fluid" id="main-container">


    <div id="page-content" class="clearfix">

        <div class="row-fluid">


            <div class="row-fluid">

                <!-- 检索  -->
                <form action="link/list.do?isM1=${pdm.isM1 }&isM2=${pdm.isM2 }" method="post" name="userForm"
                      id="userForm">
                    <table border='0'>
                        <tr>

                            <td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="stiename"
                                   value="${pd.stiename }" placeholder="这里输入标题"/>
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
                            </td>
                            <td style="vertical-align:top;">
                                <select class="chzn-select" name="status" data-placeholder="状态"
                                        style="vertical-align:top;width: 79px;">
                                    <option value=""></option>
                                    <option value="1"
                                            <c:if test="${pd.status == '1' }">selected</c:if> >已启用
                                    </option>
                                    <option value="0"
                                            <c:if test="${pd.status == '0' }">selected</c:if> >未启用
                                    </option>
                                </select>
                            </td>
                            <td style="vertical-align:top;">
                                <button class="btn btn-mini btn-light" onclick="search();"><i id="nav-search-icon"
                                                                                              class="icon-search"></i>
                                </button>
                            </td>
                        </tr>
                    </table>
                    <!-- 检索  -->


                    <table id="table_report" class="table table-striped table-bordered table-hover">

                        <thead>
                        <tr>
                            <th>权重</th>
                            <th>网站名</th>
                            <th><i class="icon-time hidden-phone"></i>加入时间</th>
                            <th>类型</th>
                            <th>状态</th>
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
                                            <td class='center' style="width: 30px;">${var.sequence}</td>
                                            <td>${fn:substring(var.stiename ,0,10)} ...</td>
                                            <td>${var.addtime }</td>
                                            <td>
                                                <c:if test="${var.type == '0' }"><span
                                                        class="label label-success arrowed-in">文字</span></c:if>
                                                <c:if test="${var.type == '1' }"><span
                                                        class="label label-success arrowed">图片</span></c:if>
                                            </td>
                                            <td>
                                                <c:if test="${var.status == '0' }"><span
                                                        class="label label-important arrowed-in">未启用</span></c:if>
                                                <c:if test="${var.status == '1' }"><span
                                                        class="label label-success arrowed">已启用</span></c:if>
                                            </td>
                                            <td style="width: 60px;" class="center">
                                                <div class='hidden-phone visible-desktop btn-group'>

                                                    <c:if test="${QX.edit != 1 && QX.del != 1 }">
                                                        <span class="label label-large label-grey arrowed-in-right arrowed-in"><i
                                                                class="icon-lock" title="无权限"></i></span>
                                                    </c:if>

                                                    <c:if test="${QX.edit == 1 }">
                                                        <a class='btn btn-mini btn-info' title="编辑"
                                                           onclick="edit('${var.id }');"><i class='icon-edit'></i></a>
                                                    </c:if>
                                                    <c:if test="${QX.del == 1 }">
                                                        <a class='btn btn-mini btn-danger' title="删除"
                                                           onclick="del('${var.id }');"><i class='icon-trash'></i></a>
                                                    </c:if>
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
                                    <td colspan="100" class="center">没有相关数据</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>


                        </tbody>
                    </table>

                    <div class="page-header position-relative">
                        <table style="width:100%;">
                            <tr>
                                <c:if test="${QX.add == 1 }">
                                    <td style="vertical-align:top;"><a class="btn btn-small btn-success"
                                                                       onclick="add();">新增</a></td>
                                </c:if>
                                <td style="vertical-align:top;">
                                    <div class="pagination"
                                         style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>


            <!-- PAGE CONTENT ENDS HERE -->
        </div>
        <!--/row-->

    </div>
    <!--/#page-content-->
</div>
<!--/.fluid-container#main-container-->

<!-- 返回顶部  -->
<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
    <i class="icon-double-angle-up icon-only"></i>
</a>

<!-- 引入 -->
<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>

<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
<!-- 单选框 -->
<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script>
<!-- 日期框 -->
<script type="text/javascript" src="static/js/bootbox.min.js"></script>
<!-- 确认窗口 -->
<!-- 引入 -->

<script type="text/javascript">

    $(top.hangge());

    //检索
    function search() {
        $("#Form").submit();
    }

    //新增
    function add() {
        top.jzts();
        var diag = new top.Dialog();
        diag.Drag = true;
        diag.Title = "新增";
        diag.URL = '<%=basePath%>link/goAdd.do';
        diag.Width = 800;
        diag.Height = 650;
        diag.CancelEvent = function () { //关闭事件
            if (diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none') {
                if ('${page.currentPage}' == '0') {
                    top.jzts();
                    setTimeout("self.location.reload()", 100);
                } else {
                    nextPage(${page.currentPage});
                }
            }
            diag.close();
        };
        diag.show();
    }

    //修改
    function edit(id) {
        top.jzts();
        var diag = new top.Dialog();
        diag.Drag = true;
        diag.Title = "编辑";
        diag.URL = '<%=basePath%>link/goEdit.do?id=' + id;
        diag.Width = 800;
        diag.Height = 650;
        diag.CancelEvent = function () { //关闭事件
            if (diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none') {
                nextPage(${page.currentPage});
            }
            diag.close();
        };
        diag.show();
    }

    //删除
    function del(id) {
        bootbox.confirm("确定要删除该记录?", function (result) {
            if (result) {
                var url = "<%=basePath%>link/delete.do?id=" + id + "&tm=" + new Date().getTime();
                $.get(url, function (data) {
                    if (data == "success") {
                        nextPage(${page.currentPage});
                    }
                });
            }
        });
    }

</script>

<script type="text/javascript">

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

