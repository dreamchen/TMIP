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
    <meta charset="utf-8"/>
    <title></title>
    <meta name="description" content="overview & stats"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="static/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
    <link href="static/css/bootstrap-responsive.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="static/css/font-awesome.min.css"/>
    <!-- 下拉框 -->
    <link rel="stylesheet" href="static/css/chosen.css"/>
    <link rel="stylesheet" href="static/css/ace.min.css"/>
    <link rel="stylesheet" href="static/css/ace-responsive.min.css"/>
    <link rel="stylesheet" href="static/css/ace-skins.min.css"/>
     <!-- 日期框 -->
    <script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
    <!--提示框-->
    <script type="text/javascript" src="static/js/jquery.tips.js"></script>
    
     <link rel="stylesheet" type="text/css" href="static/js/jquery-easyui-1.4.2/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="static/js/jquery-easyui-1.4.2/themes/icon.css">
<!-- 	<script type="text/javascript" src="static/js/jquery-easyui-1.4.2/jquery.min.js"></script> -->
	<script type="text/javascript" src="static/js/jquery-easyui-1.4.2/jquery.easyui.min.js"></script>
    	
	<link rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css" type="text/css">
<!--     <script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script> -->
    <script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>

    <script type="text/javascript">
        $(top.hangge());
        $(document).ready(function () {
            if ($("#user_id").val() != "") {
                $("#loginname").attr("readonly", "readonly");
                $("#loginname").css("color", "gray");
            }
        });

        //保存
        function save() {
            if ($("#loginname").val() == "" || $("#loginname").val() == "此用户名已存在!") {

                $("#loginname").tips({
                    side: 3,
                    msg: '输入用户名',
                    bg: '#AE81FF',
                    time: 2
                });

                $("#loginname").focus();
                $("#loginname").val('');
                $("#loginname").css("background-color", "white");
                return false;
            } else {
                $("#loginname").val(jQuery.trim($('#loginname').val()));
            }
            
            if ($("#NICKNAME").val() == "") {

                $("#NICKNAME").tips({
                    side: 3,
                    msg: '输入昵称',
                    bg: '#AE81FF',
                    time: 2
                });

                $("#NICKNAME").focus();
                return false;
            }
            
            if ($("#NAME").val() == "") {

                $("#NAME").tips({
                    side: 3,
                    msg: '输入姓名',
                    bg: '#AE81FF',
                    time: 2
                });

                $("#NAME").focus();
                return false;
            }
            if ($("#JOBS").val() == "") {

                $("#JOBS").tips({
                    side: 3,
                    msg: '选择岗位',
                    bg: '#AE81FF',
                    time: 2
                });

                $("#JOBS").focus();
                return false;
            }
            
            if ($("#OFFICPHONE").val() == "") {

                $("#OFFICPHONE").tips({
                    side: 3,
                    msg: '输入办公电话',
                    bg: '#AE81FF',
                    time: 2
                });

                $("#OFFICPHONE").focus();
                return false;
            }

            if ($("#NUMBER").val() == "") {

                $("#NUMBER").tips({
                    side: 3,
                    msg: '输入编号',
                    bg: '#AE81FF',
                    time: 3
                });
                $("#NUMBER").focus();
                return false;
            } else {
                $("#NUMBER").val($.trim($("#NUMBER").val()));
            }
            
            var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
            if ($("#PHONE").val() == "") {

                $("#PHONE").tips({
                    side: 3,
                    msg: '输入手机号',
                    bg: '#AE81FF',
                    time: 3
                });
                $("#PHONE").focus();
                return false;
            } else if ($("#PHONE").val().length != 11 && !myreg.test($("#PHONE").val())) {
                $("#PHONE").tips({
                    side: 3,
                    msg: '手机号格式不正确',
                    bg: '#AE81FF',
                    time: 3
                });
                $("#PHONE").focus();
                return false;
            }

            if ($("#EMAIL").val() == "") {

                $("#EMAIL").tips({
                    side: 3,
                    msg: '输入邮箱',
                    bg: '#AE81FF',
                    time: 3
                });
                $("#EMAIL").focus();
                return false;
            } else if (!ismail($("#EMAIL").val())) {
                $("#EMAIL").tips({
                    side: 3,
                    msg: '邮箱格式不正确',
                    bg: '#AE81FF',
                    time: 3
                });
                $("#EMAIL").focus();
                return false;
            }
            
            if ($("#user_id").val() == "" && $("#password").val() == "") {

                $("#password").tips({
                    side: 3,
                    msg: '输入密码',
                    bg: '#AE81FF',
                    time: 2
                });

                $("#password").focus();
                return false;
            }
            if ($("#password").val() != $("#chkpwd").val()) {

                $("#chkpwd").tips({
                    side: 3,
                    msg: '两次密码不相同',
                    bg: '#AE81FF',
                    time: 3
                });

                $("#chkpwd").focus();
                return false;
            }
            
            if ($("#role_id").val() == "") {

                $("#role_id").tips({
                    side: 3,
                    msg: '选择角色',
                    bg: '#AE81FF',
                    time: 2
                });

                $("#role_id").focus();
                return false;
            }
            
             if ($("#DEPT").val() == "") {

                $("#DEPT").tips({
                    side: 3,
                    msg: '选择部门',
                    bg: '#AE81FF',
                    time: 2
                });

                $("#DEPT").focus();
                return false;
            } 

            if ($("#user_id").val() == "") {
                hasU();
            } else {
                $("#userForm").submit();
                $("#zhongxin").hide();
                $("#zhongxin2").show();
            }
        }

        function ismail(mail) {
            return (new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
        }

        //判断用户名是否存在
        function hasU() {
            var USERNAME = $.trim($("#loginname").val());
            $.ajax({
                type: "POST",
                url: '<%=basePath%>user/hasU.do',
                data: {USERNAME: USERNAME, tm: new Date().getTime()},
                dataType: 'json',
                cache: false,
                success: function (data) {
                    if ("success" == data.result) {
                        $("#userForm").submit();
                        $("#zhongxin").hide();
                        $("#zhongxin2").show();
                    } else {
                        $("#loginname").css("background-color", "#D16E6C");
                        setTimeout("$('#loginname').val('此用户名已存在!')", 500);
                    }
                }
            });
        }

        //判断邮箱是否存在
        function hasE(USERNAME) {
            var EMAIL = $.trim($("#EMAIL").val());
            $.ajax({
                type: "POST",
                url: '<%=basePath%>user/hasE.do',
                data: {EMAIL: EMAIL, USERNAME: USERNAME, tm: new Date().getTime()},
                dataType: 'json',
                cache: false,
                success: function (data) {
                    if ("success" != data.result) {
                        $("#EMAIL").tips({
                            side: 3,
                            msg: '邮箱已存在',
                            bg: '#AE81FF',
                            time: 3
                        });
                        setTimeout("$('#EMAIL').val('')", 2000);
                    }
                }
            });
        }

        //判断编码是否存在
        function hasN(USERNAME) {
            var NUMBER = $.trim($("#NUMBER").val());
            $.ajax({
                type: "POST",
                url: '<%=basePath%>user/hasN.do',
                data: {NUMBER: NUMBER, USERNAME: USERNAME, tm: new Date().getTime()},
                dataType: 'json',
                cache: false,
                success: function (data) {
                    if ("success" != data.result) {
                        $("#NUMBER").tips({
                            side: 3,
                            msg: '编号已存在',
                            bg: '#AE81FF',
                            time: 3
                        });
                        setTimeout("$('#NUMBER').val('')", 2000);
                    }
                }
            });
        }
        
        function setNickName(){
        	$("#NICKNAME").val($("#loginname").val());
        }

    </script>
    
</head>
<body>
<form action="user/${msg }.do" name="userForm" id="userForm" method="post">
    <input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }"/>

    <div id="zhongxin">
        <table class="table table-striped table-bordered table-hover">
            <tr>
            	<td style="width:70px;text-align: right;padding-top: 13px;">用户名:</td>
                <td><input type="text" name="USERNAME" id="loginname" value="${pd.USERNAME }" maxlength="32"
                           placeholder="这里输入用户名" title="用户名" onblur="setNickName();"/></td>
				<td style="width:70px;text-align: right;padding-top: 13px;">昵称:</td>
                <td><input type="text" name="NICKNAME" id="NICKNAME" value="${pd.NICKNAME }" maxlength="32"
                           placeholder="这里输入昵称" title="昵称"/></td>
            </tr>
            <tr>
            	<td style="width:70px;text-align: right;padding-top: 13px;">姓名:</td>
                <td><input type="text" name="NAME" id="NAME" value="${pd.NAME }" maxlength="32" placeholder="这里输入姓名"
                           title="姓名"/></td>
				<td style="width:70px;text-align: right;padding-top: 13px;">性别:</td>
                <td>
					<select name="GENDER" title="性别">
                        <option value="0"
                                <c:if test="${pd.GENDER == '0' }">selected</c:if> >男
                        </option>
                        <option value="1"
                                <c:if test="${pd.GENDER == '1' }">selected</c:if> >女
                        </option>
                    </select>
                </td>
            	<%-- <td style="width:70px;text-align: right;padding-top: 13px;">编号:</td>
                <td><input type="text" name="NUMBER" id="NUMBER" value="${pd.NUMBER }" maxlength="32"
                           placeholder="这里输入编号" title="编号" onblur="hasN('${pd.USERNAME }')"/></td> --%>
            </tr>
            <tr>
	           <td style="width:70px;text-align: right;padding-top: 13px;">岗位:</td>
				<td>
					<select class="chzn-select" name="JOBS" id="JOBS" data-placeholder="请选择岗位">
						<option value=""></option>
						<c:forEach items="${dictList }" var="var">
							<option value="${var.ZD_ID }" <c:if test="${var.ZD_ID == pd.JOBS }">selected</c:if>>${var.NAME }</option>
						</c:forEach>
					</select>
				</td>
				<td style="width:70px;text-align: right;padding-top: 13px;">办公电话:</td>
	                <td><input type="text" name="OFFICPHONE" id="OFFICPHONE" value="${pd.OFFICPHONE }" maxlength="32"
                           placeholder="这里输入办公电话" title="办公电话"/></td>
            </tr>
            <tr>
	           	<td style="width:70px;text-align: right;padding-top: 13px;">手机:</td>
	           	<td><input type="number" name="PHONE" id="PHONE" value="${pd.PHONE }" maxlength="32"
                           placeholder="这里输入手机号" title="手机号"/></td>
				<td style="width:70px;text-align: right;padding-top: 13px;">邮箱:</td>
	           	<td><input type="email" name="EMAIL" id="EMAIL" value="${pd.EMAIL }" maxlength="32" placeholder="这里输入邮箱"
                           title="邮箱" onblur="hasE('${pd.EMAIL }')"/></td>
            </tr>
            <tr>
	           	<td style="width:70px;text-align: right;padding-top: 13px;">QQ:</td>
	           	<td><input type="number" name="QQ" id="QQ" value="${pd.QQ }" maxlength="32"
                           placeholder="这里输入QQ号" title="QQ"/></td>
				<td style="width:70px;text-align: right;padding-top: 13px;">微信:</td>
	           	<td><input type="text" name="WECHAT" id="WECHAT" value="${pd.WECHAT }" maxlength="32" placeholder="这里输入微信"
                           title="微信"/></td>
            </tr>
            <tr>
            	<td style="width:70px;text-align: right;padding-top: 13px;">密码:</td>
                <td><input type="password" name="PASSWORD" id="password" maxlength="32" placeholder="输入密码" title="密码"/>
                </td>
                <td style="width:70px;text-align: right;padding-top: 13px;">确认密码:</td>
                <td><input type="password" name="chkpwd" id="chkpwd" maxlength="32" placeholder="确认密码" title="确认密码"/>
                </td>
            </tr>
            <tr>
            	<td style="width:70px;text-align: right;padding-top: 13px;">工作时间:</td>
<!-- 				<td><input class="span10 date-picker" name="WORKTIME" id="WORKTIME" value="${pd.WORKTIME}"  -->
<!-- 					type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="工作时间" title="工作时间"/></td> -->
				
				 <td colspan="3">
                    <input class="span10 form_time" name="starttime" id="starttime" value="${pd.starttime}" type="text" data-date-format="hh:ii" readonly="readonly"/>
					
                    <input class="span10 form_time" name="endtime" id="endtime" value="${pd.endtime}" type="text" data-date-format="hh:ii" readonly="readonly" />
                </td>
					
            </tr>
            <tr>
	            <td style="width:70px;text-align: right;padding-top: 13px;">是否可用:</td>
				<td>
					<select name="type" title="是否可用">
                        <option value="0"
                                <c:if test="${pd.ISDELETE == '0' }">selected</c:if> >启用
                        </option>
                        <option value="1"
                                <c:if test="${pd.ISDELETE == '1' }">selected</c:if> >禁用
                        </option>
                    </select>
				</td>
				
				<td style="width:70px;text-align: right;padding-top: 13px;">是否安保人员:</td>
				<td>
					<select name="type" title="是否安保人员">
                        <option value="0"
                                <c:if test="${pd.ISSECURITY == '0' }">selected</c:if> >是
                        </option>
                        <option value="1"
                                <c:if test="${pd.ISSECURITY == '1' }">selected</c:if> >否
                        </option>
                    </select>
				</td>
            </tr>
            <tr>
<!-- 				<td style="width:70px;text-align: right;padding-top: 13px;">部门:</td>             -->
<!--         		<td > -->
<!--         			<input class="easyui-combotree" id="DEPT" name="DEPT" data-options="url:'<%=basePath%>org/getOrgTByAll.do',method:'get',required:true" style="width:220px;height: 30px;" value="${pd.DEPT}" placeholder="请选择部门" title="所属部门"> -->
<!--         		</td> -->
				<td style="width:70px;text-align: right;padding-top: 13px;">部门:</td> 
				<td >
					<div>
						<input id="cityVal" name="cityVal" type="text" readonly value="${pd.ORGNAME }" style="width:160px;background-color: #ffffff;"/>
						<a id="menuBtn" href="#" onclick="showMenu(); return false;">选择</a>
						<input id="DEPT" name="DEPT" value="${pd.DEPT }" type="hidden">
					</div>
					<div id="menuContent" class="menuContent" style="display:none; position: absolute;background-color:#f8f8ff;border-style:solid;border-width:1px;border-color:696969; ">
						<ul id="treeDemo" class="ztree" style="margin-top:0; width:160px;"></ul>
					</div>
				</td>
				<c:if test="${fx != 'head'}">
                <c:if test="${pd.ROLE_ID != '1'}">
<!--                     <tr class="info"> -->
                    	<td style="width:70px;text-align: right;padding-top: 13px;">角色:</td>     
                        <td >
                            <select class="chzn-select" name="ROLE_ID" id="role_id" data-placeholder="请选择角色"
                                    style="vertical-align:top;">
                                <option value=""></option>
                                <c:forEach items="${roleList}" var="role">
                                    <option value="${role.ROLE_ID }"
                                            <c:if test="${role.ROLE_ID == pd.ROLE_ID }">selected</c:if>>${role.ROLE_NAME }</option>
                                </c:forEach>
                            </select>
                        </td>
                </c:if>
                <c:if test="${pd.ROLE_ID == '1'}">
                    <input name="ROLE_ID" id="role_id" value="1" type="hidden"/>
                </c:if>
            </c:if>
            <c:if test="${fx == 'head'}">
                <input name="ROLE_ID" id="role_id" value="${pd.ROLE_ID }" type="hidden"/>
            </c:if>
        	</tr>
            
            <tr>
            	<td style="width:70px;text-align: right;padding-top: 13px;">备注:</td> 
                <td colspan="3">
                <textarea style="width:93%;height:100px" name="BZ" id="BZ" placeholder="这里输入备注"
                           title="备注">${pd.BZ }</textarea>
            </tr>
            <tr>
                <td style="text-align: center;" colspan="4">
                    <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
                    <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
                </td>
            </tr>
        </table>
    </div>

    <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img
            src="static/images/jiazai.gif"/><br/><h4 class="lighter block green"></h4></div>

<SCRIPT type="text/javascript">
		var setting = {
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeClick: beforeClick,
				onClick: onClick
			}
		};
// 		var zNodes=[{"name":"天恩研究院","pId":"0","id":"08fbc8ac71e94dd6a4d0f98d3adcbdfc"},{"name":"好朋友幼儿园","pId":"0","id":"2947c877dcbc47cd832f0a42a24ecf90"},{"name":"运营部","pId":"08fbc8ac71e94dd6a4d0f98d3adcbdfc","id":"a2621e1d60af4923b6fa647f9a5c091b"},{"name":"实施部","pId":"08fbc8ac71e94dd6a4d0f98d3adcbdfc","id":"a3bdb576096c4b76b236f2fb78727a31"},{"name":"技术部","pId":"08fbc8ac71e94dd6a4d0f98d3adcbdfc","id":"ce12c48fa7434777ad8325d6e2650091"},{"name":"运营一部","pId":"a2621e1d60af4923b6fa647f9a5c091b","id":"f308337449bc40699f55a1a402331bb7"}];
		var zn = '${zTreeNodes}';
	   	var zNodes = eval(zn); 
		function beforeClick(treeId, treeNode) {
			var check = (treeNode && !treeNode.isParent);
			if (!check) alert("只能选择部门...");
			return check;
		}
		
		function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getSelectedNodes(),
			v = "";
			hiddenId="";
			nodes.sort(function compare(a,b){return a.id-b.id;});
			for (var i=0, l=nodes.length; i<l; i++) {
// 				v += nodes[i].name + ",";
// 				hiddenId += nodes[i].id + ",";
				v = nodes[i].name + ",";
				hiddenId = nodes[i].id + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			if (hiddenId.length > 0 ) hiddenId = hiddenId.substring(0, hiddenId.length-1);
			var cityObj = $("#cityVal");
			cityObj.attr("value", v);
			var DEPT = $("#DEPT");
			DEPT.attr("value", hiddenId);
		}

		function showMenu() {
			var cityObj = $("#cityVal");
			var cityOffset = $("#cityVal").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
	</SCRIPT>

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
<script type="text/javascript" src="static/js/bootstrap-timepicker.min.js"></script>
<!-- 时间框 -->
<link href="static/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
<script type="text/javascript" src="static/js/bootstrap-datetimepicker.min.js"></script>
<!-- 时间框 -->
<script type="text/javascript" src="static/js/bootstrap-datetimepicker.zh-CN.js"></script>
<!-- 时间框 -->

<script type="text/javascript">

    $(function () {
    $('.form_time').datetimepicker({
			language: 'zh-CN',
	        weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 1,
			minView: 0,
			maxView: 1,
			forceParse: 0
		});

        //单选框
        $(".chzn-select").chosen();
        $(".chzn-select-deselect").chosen({allow_single_deselect: true});

        //日期框
        $('.date-picker').datepicker();
        
        //时间框
        $('.time-picker').timepicker({
        	minuteStep: 1,
            showSeconds: false,
            showMeridian: false
        });
        
    });

</script>
</body>
</html>