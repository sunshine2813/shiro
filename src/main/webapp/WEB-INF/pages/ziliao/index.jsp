<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="/WEB-INF/pages/tag.jsp"%>
<%@ include file="/WEB-INF/pages/common_css.jsp"%>
<%@ include file="/WEB-INF/pages/zlgl_commonjs.jsp"%>


<!DOCTYPE>
<html  lang="zh">
<head>
<title>${sysName}</title>
<style type="text/css">
    .nav > li:hover .dropdown-menu
    {
        display: block;
    }

</style>
<script>

</script>
</head>
<body class="easyui-layout">
<div data-options="region:'north'" style="height: 30px;">
    <nav style="background-color: #95B8E7;width: 100%;height:100%;">
        <ul style="float: right">
            <li>
                当前用户:<shiro:principal/>&nbsp;&nbsp;<a href="${basePath}logout.action"><i class="fa fa-sign-out"></i> 退出登录</a>
            </li>
        </ul>
        <a class="btn btn-success" style="float:left;height: 28px;margin-left:213px;" onclick="addProjectJSP()">
            <i class="fa fa-plus"></i> 录入项目
        </a>
        &nbsp;&nbsp;<a type="application/pdf" target="_blank" class="btn btn-success" style="height: 28px;" href="${basePath}zlDownload.action?abspath=word.pdf">下载pdf..</a>
        &nbsp;&nbsp;<a type="application/msword" target="_blank" class="btn btn-success" style="height: 28px;" href="${basePath}zlDownload.action?abspath=word.docx">下载word..</a>
    </nav>
</div>
<%--左侧树形菜单栏--%>
<div data-options="region:'west'" title="设备列表" style="width: 15%;">
    <%--<ul class="easyui-tree" id="leftMenu" >--%>
    <ul class="easyui-tree" id="leftMenu" data-options="url:'zl/getYearProjectTree.action'">
        <%-- 循环读取每个年份 和 下面的项目 填充菜单--%>
        <%--<li>
            <span>用户管理</span>
            <ul>
                <li data-options="url:'${basePath}admin/userInfo.action'">
                    <span>用户基本信息管理</span>
                </li>
            </ul>
        </li>
        <li data-options="url:'${basePath}admin/contractType.action'">
            <span>合同类别管理</span>
        </li>--%>
    </ul>
</div>
<%--中间部分--%>
<div data-options="region:'center'" title="首页" style="">
    <div id="tabs" class="easyui-tabs"></div>
</div>

<div data-options="region:'south'" style="height: 50px;">
    <div class="pull-right"> 主办：<a href="http://10.104.66.13" target="_blank" rel="nofollow">山东黄河信息中心</a> 版权所有© 设计制作/维护管理：<a href="http://10.104.66.13" target="_blank" rel="nofollow">山东黄河信息中心</a><br>
        联系电话：0531-86987089 地址：济南市历下区东关大街111号 邮编：250013<br>
    </div>
</div>




<script type="text/javascript">
    /*录入项目显示tab页面*/
    function addProjectJSP(){
        var text = "录入项目基本资料";
        console.log(text);
        var tabs = $("#tabs");
        var tab = tabs.tabs("getTab", text);
        if(tab){
            tabs.tabs("select", text);
        }else{
            var url2 = "${basePath}zl/addProjectIndex.jsp";
            console.log(url2);
            var content_addProject = '<iframe scrolling="auto" frameborder="0"  src="'+url2+'" style="width:100%;height:80%"></iframe>';
            tabs.tabs("add",{
                title: text,
                /*不能用href的方式,存在跳转到登录页面的情况*/
                content: content_addProject,
                closable: true
            })
        }
    }


    function getTreeHTML(list){
        var str = "";
        $.each(list,function(index, value){
            // 拼接整个表格的tbody部分内容为 str
            str +=
                '<li>'+
                     '<span>'+ value.year + '</span>'+
                    '<ul>'+
                    '<li  onclick="addProjectJSP('+ "'"+ value.id +"'" + ')">' +
                    '<span>'+value.pnm +'</span>' +
                    '</li>'+
                    '</ul>'+
                 '</li>'
        });
        ////console.log("list左侧树html.str:\n"+str);
        return str;
    }

    $(document).ready(function(){
        $("#leftMenu").tree({
            onClick:function(node){
                if($("#leftMenu").tree("isLeaf", node.target)){
                    var tabs = $("#tabs");
                    var tab = tabs.tabs("getTab", node.text);
                    if(tab){
                        tabs.tabs("select", node.text);
                    }else{
                        var url = "${basePath}zl/projectIndex.jsp?id="+node.id;
                        console.log(url);
                        var content_projectIndex = '<iframe id="content_projectIndex" scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:80%"></iframe>';
                        /*查询项目下的系统类别有哪些,除了项目基本信息,都用tab形式打开*/
                        tabs.tabs("add",{
                            title: node.text,
                            content:content_projectIndex,
                            closable: true
                        });


                    }

                }
            }
        })
    });

</script>
</body>

</html>
