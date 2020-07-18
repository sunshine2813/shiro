<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="${basePath}easyui-1.7/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}easyui-1.7/themes/icon.css"/>
<script type="text/javascript" src="${basePath}easyui-1.7/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}easyui-1.7/jquery.easyui.min.js"></script>

<script type="text/javascript" src="${basePath}js/bootstrap.min.js"></script>

<script type="text/javascript" src="${basePath}js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script type="text/javascript" src="${basePath}js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script type="text/javascript" src="${basePath}ajax/libs/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="${basePath}ajax/libs/layer/layer.min.js"></script>
<script type="text/javascript" src="${basePath}ruoyi/js/ry-ui.js?v=3.3.0"></script>
<script type="text/javascript" src="${basePath}ajax/libs/fullscreen/jquery.fullscreen.js"></script>
<script type="text/javascript" src="${basePath}js/laydate-v5/laydate.js"></script>

<script type="text/javascript">
    /*鍘婚櫎瀛楃涓查噷鍏ㄩ儴绌烘牸,鍘婚櫎绌烘牸鍚�,闈炵┖鍒欒繑鍥瀟rue*/
    function judgeBlank(param){
        if(param.replace(/\s*/g, "") != "")
            return true;
        return false;
    }

    function getButtonsFromStringlist(strlist,  newProjectId, newProjectName){
        var str = "";
        $.each(strlist,function(index, value){
            str += '<button type="button" class="btn btn-sm btn-primary" onclick="openAddProjectShebeiTab('+"'"+ value +"','"+newProjectId+ "','"+newProjectName+"'"+')"><i class="fa fa-check"></i>' + value+ '</button>&nbsp;&nbsp;&nbsp;';
        });
        console.log("澶氫釜鎸夐挳鐨�.str:\n"+str);
        return str;
    }

    function openAddProjectShebeiTab(ptyp, newProjectId, newProjectName){
        console.log("鎵撳紑id鏄�:"+newProjectId+"椤圭洰锛岃澶囩被鍨嬫槸"+ptyp+"鐨勮澶囧綍鍏ラ〉闈�");
        var text = "褰曞叆椤圭洰["+ newProjectName +"]-璁惧绫诲埆鏄痆"+ptyp+"]鐨勮澶囦俊鎭�";
        console.log(text);
        var tabs = $("#tabs",parent.document);
        var tab = tabs.tabs("getTab", text);
        if(tab){
            tabs.tabs("select", text);
        }else{
            var url = "${basePath}zl/addProjectShebei.jsp?pid="+newProjectId+"&newProjectName="+newProjectName+"&ptyp="+ptyp;
            console.log("openAddProjectShebeiTab"+url);
            var contentHeight = document.body.clientHeight - 190;

            var content = '<iframe id="content" frameborder="0"  src="'+url+'" style="width:101.5%;"></iframe>';
            tabs.tabs("add",{
                title: text,
                content:content,
                closable: true
            });
            $("#content").height(contentHeight);
            console.log("contentHeight:"+contentHeight);
        }

    }

    /**鑾峰彇椤跺眰绐楀彛瀵硅薄*/
     /*function getTopWindow(){
     var p = window;
     while(p != p.parent){
        p = p.parent;
     }
        return p;
     }
     var top = getTopWindow();
     if(top != window){
        top.location.href = "${basePath}gologin.action";
     }*/

</script>

