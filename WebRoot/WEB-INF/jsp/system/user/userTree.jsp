<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <!-- jsp文件头和头部 -->
    <%@ include file="../admin/top.jsp" %>

    <link rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>

<body>


<div class="container-fluid" id="main-container">


    <table style="width:100%;" border="0">
        <tr>
            <td style="width:12%;" valign="top" bgcolor="#F9F9F9">
                <div style="width:15%;">
                    <ul id="leftTree" class="ztree"></ul>
                </div>
            </td>
            <td style="width:100%;" valign="top">
                <iframe name="treeFrame" id="treeFrame" frameborder="0" src="<%=basePath%>/user/listUsers.do?DEPT=${pd.ORG_ID }";
                        style="margin:0 auto;width:100%;height:100%;"></iframe>
            </td>
        </tr>
    </table>


</div>
<!--/.fluid-container#main-container-->


<!-- 引入 -->
<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/ace-elements.min.js"></script>
<!-- 引入 -->
<script type="text/javascript">
    $(top.hangge());
</script>
<SCRIPT type="text/javascript">
    <!--
    var setting = {
    	async: {
		    enable: true,
		    url: getUrlByNodeId
	  	},
        view: {
            showIcon: showIconForTree
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
        	onClick: zTreeOnClick
        }
    };
    
    var zn = '${zTreeNodes}';
    var zNodes = eval(zn); 
    // 		[{"name":"天恩研究院","pId":"0","id":"08fbc8ac71e94dd6a4d0f98d3adcbdfc"},{"name":"好朋友幼儿园","pId":"0","id":"2947c877dcbc47cd832f0a42a24ecf90"},{"name":"运营部","pId":"08fbc8ac71e94dd6a4d0f98d3adcbdfc","id":"a2621e1d60af4923b6fa647f9a5c091b"},{"name":"实施部","pId":"08fbc8ac71e94dd6a4d0f98d3adcbdfc","id":"a3bdb576096c4b76b236f2fb78727a31"},{"name":"技术部","pId":"08fbc8ac71e94dd6a4d0f98d3adcbdfc","id":"ce12c48fa7434777ad8325d6e2650091"},{"name":"运营一部","pId":"a2621e1d60af4923b6fa647f9a5c091b","id":"f308337449bc40699f55a1a402331bb7"}]
    
    function zTreeOnClick(event, treeId, treeNode) {
	    document.getElementById("treeFrame").src="<%=basePath%>/user/listUsers.do?DEPT="+treeNode.id;
   	}
   	
   	function getUrlByNodeId(treeId, treeNode) {
	  return "<%=basePath%>/user/listUsers.do?treeNodeId="+treeNode.id;
	}

    function showIconForTree(treeId, treeNode) {
        return !treeNode.isParent;
    }
    $(document).ready(function () {
        $.fn.zTree.init($("#leftTree"), setting, zNodes);
    });
    //-->


    function treeFrameT() {
        var hmainT = document.getElementById("treeFrame");
        var bheightT = document.documentElement.clientHeight;
        hmainT.style.width = '100%';
        hmainT.style.height = (bheightT - 7) + 'px';
    }
    treeFrameT();
    window.onresize = function () {
        treeFrameT();
    };
</SCRIPT>
</body>
</html>

