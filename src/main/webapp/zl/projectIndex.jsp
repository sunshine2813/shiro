<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="/WEB-INF/pages/tag.jsp"%>
<%@ include file="/WEB-INF/pages/common_css.jsp"%>
<%@ include file="/WEB-INF/pages/zlgl_commonjs.jsp"%>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        var pid = "${param.id}";
        console.log("pid:"+pid);
        initButtons(pid);

        function initButtons(pid){
            $.ajax({
                url:"${basePath}getPtypByProject.action",
                data:{
                    "pid":pid
                },
                type:"POST",
                dataType:"json",
                success:function(data){
                    var buttons = getButtonsFromStringlist(data);
                    $("#buttons").html(buttons);
                }
            });
        }
    </script>
</head>
<body style="width:100%;height: 100%;">
这里是 项目id是 ${param.id} 的基本资料
<div >
    显示所有这个项目的设备类别按钮
    <div id="buttons"></div>
    <div style="height:1000px;">ddd</div>
</div>
</body>
</html>
