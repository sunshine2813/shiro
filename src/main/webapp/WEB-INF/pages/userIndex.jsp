<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="/WEB-INF/pages/tag.jsp"%>
<%@ include file="/WEB-INF/pages/common_css.jsp"%>
<%@ include file="/WEB-INF/pages/common_js.jsp"%>
<!DOCTYPE>
<html  lang="zh">
<head>
    <title>${sysName}</title>
    <style type="text/css">
        .nav > li:hover .dropdown-menu 
        {
        	display: block;
        }
        .editPwdModalCSS{
           width: 800px;
            margin-top: 100px;
            margin-left: 300px;
        }
        #content-main.max { 
        	height: calc(100% - 110px); overflow: hidden; width: 100%; height: 100%; left: 0px; position: absolute; top: 0px; z-index: 9998; margin: 0; 
        }
    </style>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden">
<div id="wrapper">
	<div>
		<!--左上侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse" style="position:relative;width:auto;height:100%">
				<ul class="nav" id="side-menu">
				<!-- 左上角的logo-->
					<li class="logo">
						 <span class="logo-lg">${sysName}</span>
					</li>
				<!-- 左侧菜单 权限判断-->
					<shiro:hasPermission name="voucher:query">
                        <li id="menu_1" class="active">
                            <a href="javascript:void(0);" onclick="navLoadFrame(1)" ><i class="fa fa-home"></i> <span class="nav-label">凭单管理</span> </a>
                        </li>
					</shiro:hasPermission>

                        <shiro:hasPermission name="contract:query">
                            <li id="menu_2">
                                <a href="javascript:void(0);" onclick="navLoadFrame(2)"><i class="fa fa fa-bar-chart-o"></i> <span class="nav-label">合同管理</span> </a>
                            </li>
                        </shiro:hasPermission>

					<shiro:hasPermission name="finance:query">
                        <li id="menu_3" >
                            <a href="javascript:void(0);" onclick="navLoadFrame(3)"><i class="fa fa-home"></i> <span class="nav-label">财务资料管理</span> </a>
                        </li>
					</shiro:hasPermission>
				</ul>
			</div>
		</nav>
		<!--右上侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1">
			<!-- <div class="row border-bottom"> -->
			<div>
				<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
					<!-- 收起菜单的按钮 由于右侧固定宽度 所以删除收起菜单功能 -->
					
					<div class="navbar-header">
						<!-- <a class="navbar-minimalize minimalize-styl-2" style="color:#FFF;" href="#" title="收起菜单">
							<i class="fa fa-bars"></i>
						</a> -->
					</div>
					
					<ul class="nav navbar-top-links navbar-right welcome-message">
						<!--
						<li><a title="凭单管理" href="javascript:void(0);" onclick="navLoadFrame(1)" ><i class="fa fa-question-circle"></i> 凭单管理</a></li>
						<li><a title="合同管理" href="javascript:void(0);" onclick="navLoadFrame(2)"><i class="fa fa-question-circle" ></i> 合同管理</a></li>
						<li><a title="财务资料管理" href="javascript:void(0);" onclick="navLoadFrame(3)"><i class="fa fa-arrows-alt"></i> 财务资料管理</a></li>
						-->
						
						<!-- 用户登陆信息区域 -->
						<li class="dropdown user-menu">
							<a href="javascript:" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
								<img src="${basePath}img/user_1.jpg" class="user-image">
								<span class="hidden-xs">当前用户:&nbsp;<shiro:principal/></span>
							</a>
							
							<ul class="dropdown-menu" style="width:138px">
                                <li>
                                    <a href="#editPwdModal" data-toggle="modal"><i class="fa fa-key"></i> 修改密码</a>
                                </li>
								<li>
									<a href="${basePath}logout.action"><i class="fa fa-sign-out"></i> 退出登录</a>
								</li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
			
            <!-- 中间的iframe开始 -->
			<div class="row mainContent" id="content-main">
                <%--有凭单权限, 则显示凭单--%>
				<shiro:hasPermission name="voucher:query">
				    <iframe id="main_frame" src="${basePath}voucherIndex.action" width="100%" height="100%" ></iframe>
				</shiro:hasPermission>
                <%-- 没有凭单权限, 有合同权限, 则显示合同--%>
                <shiro:lacksPermission name="voucher:query">
                    <shiro:hasPermission name="contract:query">
                        <iframe id="main_frame" src="${basePath}contractIndex.action" width="100%" height="100%" ></iframe>
                    </shiro:hasPermission>
                </shiro:lacksPermission>
                <%--没有凭单权限, 没有合同权限, 有财务资料权限, 则显示财务资料主页面--%>
                <shiro:lacksPermission name="voucher:query">
                    <shiro:lacksPermission name="contract:query">
                        <shiro:hasPermission name="finance:query">
                            <iframe id="main_frame" src="${basePath}financeIndex.action" width="100%" height="100%" ></iframe>
                        </shiro:hasPermission>
                    </shiro:lacksPermission>
                </shiro:lacksPermission>
			</div>
			<!-- 右下方的版权信息-->
			<div class="footer">
				<div class="pull-right"> 主办：<a href="http://10.104.66.13" target="_blank" rel="nofollow">山东黄河信息中心</a> 版权所有© 设计制作/维护管理：<a href="http://10.104.66.13" target="_blank" rel="nofollow">山东黄河信息中心</a><br>
						联系电话：0531-86987089 地址：济南市历下区东关大街111号 邮编：250013<br>
		        </div>
			</div>
		</div>
	</div>	
</div>

<%--修改用户密码的模态框--%>
<div id="editPwdModal" class="modal fade editPwdModalCSS">
    <div class="form-content">
        <form id="addUserModalForm" enctype="multipart/form-data" class="form-horizontal">
            <h4 class="form-header h4">修改密码</h4>
            <!-- 这是一行 -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">用户名：</label>
                        <div class="col-sm-8">
                            <label class="form-control"><span id="editPwdModal_username"><shiro:principal/></span></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>旧密码：</label>
                        <div class="col-sm-8">
                            <input id="editPwdModal_oldPassword" autocomplete="off" placeholder="请输入旧密码" class="form-control" type="text" required>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>新密码：</label>
                        <div class="col-sm-8">
                            <input id="editPwdModal_newPassword" autocomplete="off" placeholder="请输入新密码" class="form-control" type="text" minlength="8" required>
                            <span style="color:red">*密码必须包含字母+数字+特殊字符,长度不少于8位</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>确认密码：</label>
                        <div class="col-sm-8">
                            <input id="editPwdModal_newPassword2" autocomplete="off" placeholder="请再次输入新密码" class="form-control" type="text" required>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="row">
        <div class="col-sm-offset-5 col-sm-10">
            <button type="button" class="btn btn-sm btn-primary" onclick="editPwdModalSubmit()"><i class="fa fa-check"></i>保 存</button>&nbsp;
            <button type="button" class="btn btn-sm btn-danger" data-dismiss="modal" ><i class="fa fa-reply-all"></i>关 闭 </button>
        </div>
    </div>
</div>

<script type="text/javascript">
	jQuery(document).ready(function(){
// 默认打开凭单管理标签,根据权限,判断左侧标签栏的li的样式是否为active
        var pems = "<%=session.getAttribute("shiro_permissions")%>";
        if(pems != null && pems != "null"){
            var vPem = pems.indexOf("voucher");
            var cPem = pems.indexOf("contract");
            var fPem = pems.indexOf("finance");
            //console.log(vPem+","+cPem+","+fPem);
            if( vPem != -1){
                /*有voucher的权限*/
                $("#menu_1").addClass("active");
            }else if(cPem != -1){
                /*有contract的权限*/
                $("#menu_2").addClass("active");
            }else if(fPem != -1){
                /*有finance的权限*/
                $("#menu_3").addClass("active");
            }
        }
    });

	function navLoadFrame(type){
		//console.log("type"+type);
		$("li").removeClass("active");
		if("1" == type){			
			$("#menu_1").addClass("active");
			$("#main_frame").attr("src",  "voucherIndex.action");
		}else if("2" == type){
			$("#menu_2").addClass("active");
			$("#main_frame").attr("src",  "contractIndex.action");
		}else if("3" == type){
			$("#menu_3").addClass("active");
			$("#main_frame").attr("src", "financeIndex.action") ;
		}
	}

    /*用户自己修改密码*/
    function editPwdModalSubmit(){
        var username = $("#editPwdModal_username").text();
        var oldPassword = $("#editPwdModal_oldPassword").val();
        var newPassword = $("#editPwdModal_newPassword").val();
        var newPassword2 = $("#editPwdModal_newPassword2").val();
        //console.log("username:"+username+"oldPassword:"+oldPassword);
        if(rmvBlank(newPassword)=="" || newPassword != newPassword2) {
            alert("两次密码不相同,请重新输入");
        }else if(!regPwdChk(newPassword)){
            alert("密码必须包含字母+数字+特殊字符,长度不少于8位");
        }
        else{
            $("#editPwdModal").modal("hide");
            $.ajax({
               url:"${basePath}/editPwdSelf.action",
                data:{
                    "username":username,
                    "oldPassword":oldPassword,
                    "newPassword":newPassword
                },
                type:"post",
                dataType:"json",
                success:function(data){
                    if(data.code == 0){
                        alert("修改密码失败，请检查旧密码是否输入正确");
                    }else{
                        alert("修改密码成功,请重新登陆...");
                        window.location.href = "${basePath}login.jsp";
                    }
                }
            });
        }
    }
</script>
</body>
</html>
