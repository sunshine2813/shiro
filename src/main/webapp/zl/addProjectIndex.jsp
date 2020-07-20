<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="/WEB-INF/pages/tag.jsp"%>
<%@ include file="/WEB-INF/pages/common_css.jsp"%>
<%@ include file="/WEB-INF/pages/zlgl_commonjs.jsp"%>


<html>
<head>

</head>
<body>

<div class="form-content">
    <form id="addDictForm" enctype="multipart/form-data" class="form-horizontal">
    <div class="row">
        <div class="col-sm-4">
            <div class="form-group">
                <label class="col-sm-6 control-label"><span style="color: red; ">*</span>项目名称：</label>
                <div class="col-sm-6">
                    <div class="input-group" style="width: 100%">
                        <input id="addProject_pnm" name="addProject_pnm" autocomplete="off" placeholder="请输入项目名称" class="form-control" type="text">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group">
                <label class="col-sm-6 control-label"><span style="color: red; "></span>项目分类：</label>
                <div class="col-sm-6">
                    <select id="addProject_ptyp" name="addProject_ptyp" class="form-control" ></select>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group">
                <label class="col-sm-6 control-label"><span style="color: red; "></span>批复文号：</label>
                <div class="col-sm-6">
                    <input id="addProject_pfwh" name="addProject_pfwh" autocomplete="off" placeholder="请输入项目批复文号" class="form-control" type="text">
                </div>
            </div>
        </div>
    </div>
    <%--第2行--%>
    <div class="row">
        <div class="col-sm-4">
            <div class="form-group">
                <label class="col-sm-6 control-label"><span style="color: red; "></span>投资金额：</label>
                <div class="col-sm-6">
                    <input id="addProject_tzje" name="addProject_tzje" autocomplete="off" placeholder="请输入项目投资金额" class="form-control" required="required" type="text">
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group">
                <label class="col-sm-6 control-label"><span style="color: red; "></span>投资类别：</label>
                <div class="col-sm-6">
                    <input id="addProject_tzlb" name="addProject_tzlb" autocomplete="off" placeholder="请输入投资类别" class="form-control" required="required" type="text" maxlength="11" >
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group">
                <label class="col-sm-6 control-label"><span style="color: red; "></span>设备安装地点：</label>
                <div class="col-sm-6">
                    <input id="addProject_sbazdd" name="addProject_sbazdd" autocomplete="off" placeholder="请输入设备安装地点" class="form-control" required="required" type="text">
                </div>
            </div>
        </div>

    </div>
    <%--第3行--%>
    <div class="row">
        <div class="col-sm-4">
            <div class="form-group">
                <label class="col-sm-6 control-label"><span style="color: red; "></span>运行维护单位：</label>
                <div class="col-sm-6">
                    <input id="addProject_yxwhdw" name="addProject_yxwhdw" autocomplete="off" placeholder="请输入运行维护单位" class="form-control" required="required" type="text" >
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group">
                <label class="col-sm-6 control-label"><span style="color: red; "></span>开工时间：</label>
                <div class="col-sm-6">
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="text" class="form-control" id="kgsj" placeholder="yyyy-MM-dd">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group">
                <label class="col-sm-6 control-label"><span style="color: red; "></span>完工时间：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="wgsj" name="wgsj"  placeholder="yyyy-MM-dd">
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4">
            <div class="form-group">
                <label class="col-sm-6 control-label"><span style="color: red; "></span>合同完工验收时间：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control"  id="htwgyssj" name="htwgyssj" placeholder="yyyy-MM-dd">
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group">
                <label class="col-sm-6 control-label"><span style="color: red; "></span>初步验收时间：</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="cbyssj" name="cbyssj" placeholder="yyyy-MM-dd">
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group">
                <label class="col-sm-6 control-label"><span style="color: red; "></span>竣工验收时间：</label>
                <div class="col-sm-6">
                    <input type="text" id="jgyssj" name="jgyssj" placeholder="yyyy-MM-dd" class="form-control">
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4">
            <div class="form-group">
                <div class="col-sm-6">
                    <button type="button" class="btn btn-sm btn-primary" onclick="addProjectSubmit()"><i class="fa fa-check"></i>保存项目基本资料</button>
                </div>
            </div>
        </div>
    </div>
    </form>
    <div id="buttonsTip" style="display:none;">-------------------------成功录入项目基本信息后,请按类别录入此项目设备------------------------------</div>
    <div class="form-content" id="buttons">    </div>



</div>
<script type="text/javascript">
    getPtyp();


    laydate.render({
        elem : '#kgsj'

    });
    laydate.render({
        elem : '#wgsj'

    });
    laydate.render({
        elem : '#htwgyssj'

    });
    laydate.render({
        elem : '#cbyssj'

    });
    laydate.render({
        elem : '#jgyssj'

    });

    var buttonsData = "";
    function getPtyp(){
        $.ajax({
            url:"${basePath}zl/getPtyp.action",
            data:{},
            type:"POST",
            dataType:"json",
            success:function(data){
                /*初始化select*/
                var str = getHTMLFromStringlist(data);
                $("#addProject_ptyp").html(str);
                buttonsData = data;

            }
        });
    }

    function getHTMLFromStringlist(strlist){
        var str = "";
        $.each(strlist,function(index, value){
            str += '<option value="'+ value +'">' + value+ '</option>';
        });
        /*console.log("select的.str:\n"+str);*/
        return str;
    }

    /* 录入项目 保存 方法 */
    /*新录入的项目的id*/
    var newProjectId = "", newProjectName="";
    var addProject_pnm="", addProject_ptyp="",addProject_pfwh="",
            addProject_tzje=0.0, addProject_tzlb="", addProject_sbazdd="",
            addProject_yxwhdw="", kgsj="", wgsj="",
            htwgyssj="", cbyssj="",jgyssj="", year="";
    function addProjectSubmit(){
        addProject_pnm = $("#addProject_pnm").val();
        addProject_ptyp = $("#addProject_ptyp option:selected").text();
        addProject_pfwh = $("#addProject_pfwh").val();
        addProject_tzje = $("#addProject_tzje").val();
        addProject_tzlb = $("#addProject_tzlb").val();
        addProject_sbazdd = $("#addProject_sbazdd").val();
        addProject_yxwhdw = $("#addProject_yxwhdw").val();
        kgsj = $("#kgsj").val();
        wgsj = $("#wgsj").val();
        htwgyssj = $("#htwgyssj").val();
        cbyssj = $("#cbyssj").val();
        jgyssj = $("#jgyssj").val();
        year = kgsj.split("-")[0];
        console.log("录入项目的year:"+year);
        if(!judgeBlank(addProject_pnm) || !judgeBlank(year))
            alert("请输入项目名称和开工年份!");
        else{
            console.log("录入项目的保存方法addProjectSubmit---addProject_pnm:"+addProject_pnm+
                    ",addProject_ptyp:"+addProject_ptyp+",addProject_pfwh:"+addProject_pfwh+",addProject_tzje:"
                    +addProject_tzje+",addProject_tzlb:"+addProject_tzlb+",addProject_sbazdd："+addProject_sbazdd+",addProject_yxwhdw:"
                    +addProject_yxwhdw+",kgsj:"+kgsj+",wgsj:"+wgsj+",htwgyssj:"
                    +htwgyssj+",cbyssj:"+cbyssj+",jgyssj:"+jgyssj);

            $.ajax({
                url:"${basePath}zl/addProject.action",
                data:{
                    "pnm":addProject_pnm,
                    "ptyp":addProject_ptyp,
                    "pfwh":addProject_pfwh,
                    "tzje":addProject_tzje,
                    "tzlb": addProject_tzlb,
                    "kgsj": kgsj,
                    "wgsj": wgsj,
                    "htwgyssj": htwgyssj,
                    "cbyssj": cbyssj,
                    "jgyssj": jgyssj,
                    "sbazdd": addProject_sbazdd,
                    "yxwhdw": addProject_yxwhdw,
                    "year":year
                },
                dataType:"json",
                type:"post",
                success:function(data){
                    var str = "";
                    if("1" == data.code){
                        $("#leftMenu", parent.document).tree({
                            url: 'getYearProjectTree.action',
                            loadFilter: function(treedata){
                                if (treedata){
                                    return treedata;
                                }
                            }
                        });
                        alert("录入成功！");
                        newProjectId = data.pid;
                        newProjectName = data.pnm;
                        /*初始化录入项目的下方按钮*/
                        var buttons = getButtonsFromStringlist(buttonsData, newProjectId, newProjectName);
                        $("#buttonsTip").show();
                        $("#buttons").html(buttons);
                        resetSubmit1();
                    }else if("0" == data.code){
                        alert("录入失败");
                    }
                }
            });
        }
    }
    function resetSubmit1(){
        newProjectId = "", newProjectName="",
                addProject_pnm="", addProject_ptyp="",addProject_pfwh="",
                addProject_tzje=0.0, addProject_tzlb="", addProject_sbazdd="",
                htwgyssj="", cbyssj="",jgyssj="",year="";
    }
</script>

</body>
</html>
