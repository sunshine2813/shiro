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
        var pid = "${param.pid}";
        var newProjectName = "${param.newProjectName}";
        var ptyp = "${param.ptyp}";
        var ptypPinyin = "";
        console.log("pid-newProjectName-ptyp:"+pid+","+newProjectName+","+ptyp);
        /*对比ptyp和已知9大系统类别,属于哪一种,则显示哪个div*/
        var csxt = "传输系统", xxcjxt="信息采集系统", jfhj="机房环境", dyxt="电源系统",
                wlaqxt="网络安全系统",sphsxt="视频会商系统",jsjwlxt="计算机网络系统",yytxxt="语音通信系统",rjxt="软件系统";
        switch(ptyp){
            case csxt:
                ptypPinyin = "csxt";
                break;
            case xxcjxt:
                ptypPinyin = "xxcjxt";
                break;
            case jfhj:
                ptypPinyin = "jfhj";
                break;
            case dyxt:
                ptypPinyin = "dyxt";
                break;
            case wlaqxt:
                ptypPinyin = "wlaqxt";
                break;
            case sphsxt:
                ptypPinyin = "sphsxt";
                break;
            case jsjwlxt:
                ptypPinyin = "jsjwlxt";
                break;
            case yytxxt:
                ptypPinyin = "yytxxt";
                break;
            case rjxt:
                ptypPinyin = "rjxt";
                break;
        }
        console.log("ptypPinyin:"+ptypPinyin);

    </script>
</head>
<body>
<span id="tip">录入项目[${param.newProjectName}]-设备类别是[${param.ptyp}]的设备信息</span>
<iframe id="ptypShebei" scrolling="auto" frameborder="0" src="" style="width: 100%;height: 100%"></iframe>

</body>
<script type="text/javascript">
    var url = "${basePath}zl/addProjectShebei_"+ptypPinyin+".jsp?pid="+pid+"&newProjectName="+newProjectName+"&ptyp="+ptyp+"&ptypPinyin="+ptypPinyin;
    /*console.log("录入设备的iframe.url"+url);*/
    $("#ptypShebei").attr("src", url);
    var ptypShebeiHeight = document.body.clientHeight  - $("#tip").height() -10;
    /*$("#ptypShebei").height(ptypShebeiHeight);
    console.log("ptypShebeiHeight:"+ptypShebeiHeight);*/
</script>
</html>
