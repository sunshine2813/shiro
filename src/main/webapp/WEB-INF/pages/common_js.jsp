<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 全局js -->
<script type="text/javascript" src="${basePath}js/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}js/bootstrap.min.js"></script>

<script type="text/javascript" src="${basePath}js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script type="text/javascript" src="${basePath}js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script type="text/javascript" src="${basePath}ajax/libs/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="${basePath}ajax/libs/layer/layer.min.js"></script>
<script type="text/javascript" src="${basePath}ruoyi/js/ry-ui.js?v=3.3.0"></script>
<script type="text/javascript" src="${basePath}ajax/libs/fullscreen/jquery.fullscreen.js"></script>
<script type="text/javascript" src="${basePath}js/laydate-v5/laydate.js" charset="utf-8"></script>

<!--  ztree -->
<!--  <script type="text/javascript" src="${basePath}ztree/js/jquery.ztree.all.min.js"></script>    -->


<script type="text/javascript">
    var shiro_username = "<%=session.getAttribute("shiro_username")%>";
    //console.log(shiro_username);
    /*string 类型*/
    var shiro_permissions = "<%=session.getAttribute("shiro_permissions")%>";
    //console.log(shiro_permissions);

    // 去除字符串里全部空格,去除空格后,非空则返回true
    function judgeBlank(param){
        if(param.replace(/\s*/g, "") != "")
            return true;
        return false;
    }
    //删除参数中的空格 返回删除空格后的字符串
    function rmvBlank(param){
        return param.replace(/^\s|\s*$/g,"");
    }

    /*
     1. 判断文件类型
     filetype:pdf 或 word 或 excel 类型的文件,开头是 application/xxx
     文本文档的类型是 text/plain
     图片类型是 image/jpeg 或 	image/png 或 	image/jpeg
     */
    function judgeFileType(filetype){
        if(filetype.split("/")[0] == "image")
            return "image";
        else
            return "attach";
    }

    // attachurl是编码后的,把attachurl中的\ 和 / 都替换为 _ ,就不用考虑操作系统的影响了.windows的分隔符是\,linux的分隔符是/
    function getFormattedAttachurl(attachurl){
        return decodeURIComponent(attachurl).replace(/\\/g,"_").replace(/\//g,"_");
    }

    /*检查密码强度 密码必须包含大写+小写+数字,长度不少于8位*/
    function regPwdChk(pwd){
        var reg = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[^\da-zA-Z]).{8,}$/;
        var regExp1 = new RegExp(reg);
        return regExp1.test(pwd);
    }

</script>