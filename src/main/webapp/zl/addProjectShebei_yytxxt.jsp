<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="/WEB-INF/pages/tag.jsp"%>
<%@ include file="/WEB-INF/pages/common_css.jsp"%>
<%@ include file="/WEB-INF/pages/zlgl_commonjs.jsp"%>
<html>
<head>
    <title>录入语音通信系统设备</title>
</head>
<body>
<div class="form-content">
    <div class="form-horizontal">
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>系统类别：</label>
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>语音通信系统</label>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>设备类别：</label>
                    <div class="col-sm-6">
                        <select id="etyp" name="ptyp" class="form-control" ></select>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>设备名称：</label>
                    <div class="col-sm-6">
                        <select id="enm" name="ptyp" class="form-control" ></select>
                    </div>
                </div>
            </div>
        </div>
        <%--第2行--%>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>设备型号：</label>
                    <div class="col-sm-6">
                        <input id="esbxh" name="esbxh" autocomplete="off" placeholder="请输入项设备型号" class="form-control" type="text">
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>安装地点：</label>
                    <div class="col-sm-6">
                        <input id="eazdd" name="pfwh" autocomplete="off" placeholder="请输入安装地点" class="form-control" type="text">
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>IP地址：</label>
                    <div class="col-sm-6">
                        <input id="eipdz" name="tzlb" autocomplete="off" placeholder="请输入IP地址" class="form-control" required="required" type="text" maxlength="11" >
                    </div>
                </div>
            </div>

        </div>
        <%--第3行--%>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>系统配置最大容量（线）：</label>
                    <div class="col-sm-6">
                        <input id="extpzzdrl" name="extpzzdrl" autocomplete="off" placeholder="请输入系统配置最大容量（线）" class="form-control" required="required" type="text" >
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>系统配置容量（线）：</label>
                    <div class="col-sm-6">
                        <input id="extpzrl" name="extpzrl" autocomplete="off" placeholder="请输入系统配置容量（线）" class="form-control" required="required" type="text" >
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>最大方向数：</label>
                    <div class="col-sm-6">
                        <input id="ezdfxs" name="ezdfxs" autocomplete="off" placeholder="请输入最大方向数" class="form-control" required="required" type="text" >
                    </div>
                </div>
            </div>
        </div>
        <%--第4行--%>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>出局号码最长位数：</label>
                    <div class="col-sm-6">
                        <input id="ecjhmzcws" name="ecjhmzcws" autocomplete="off" placeholder="请输入出局号码最长位数" class="form-control" required="required" type="text" >
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>接收号码最长位数：</label>
                    <div class="col-sm-6">
                        <input id="ejshmzcws" name="ejshmzcws" autocomplete="off" placeholder="请输入接收号码最长位数" class="form-control" required="required" type="text" >
                    </div>
                </div>
            </div>
        </div>
        <%--第5行--%>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>中继方向：</label>
                    <div class="col-sm-6">
                        <input id="ezjfx" name="ezjfx" autocomplete="off" placeholder="请输入中继方向" class="form-control" required="required" type="text" >
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>中继容量：</label>
                    <div class="col-sm-6">
                        <input id="ezjrl" name="ezjrl" autocomplete="off" placeholder="请输入中继容量" class="form-control" required="required" type="text" >
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>用户门数：</label>
                    <div class="col-sm-6">
                        <input id="eyhms" name="eyhms" autocomplete="off" placeholder="请输入用户门数" class="form-control" required="required" type="text" >
                    </div>
                </div>
            </div>
        </div>
        <%--第6行--%>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>投入运行时间：</label>
                    <div class="col-sm-6">
                        <div class="layui-inline">
                            <div class="layui-input-inline">
                                <input type="text" class="form-control" id="etryxsj" placeholder="yyyy-MM-dd">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="col-sm-6 control-label"><span style="color: red; "></span>备注：</label>
                    <div class="col-sm-6">
                        <input id="ebz" name="ebz" autocomplete="off" placeholder="请输入运行维护单位" class="form-control" required="required" type="text" >
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <div class="col-sm-6">
                        <button type="button" class="btn btn-sm btn-primary" onclick="addYytxxtSubmit()"><i class="fa fa-check"></i>保存</button>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    var eid="",ptyp="",etyp="",enm="",esbxh="",eazdd="",eipdz="",extpzzdrl="",extpzrl="",ezdfxs="",ecjhmzcws="",ejshmzcws="",ezjfx="",ezjrl="",eyhms="",etryxsj="",ebz=""
    function addYytxxtSubmit(){
        pty = "语音传输系统";
        etyp = $("#etyp option:selected").text();
        enm = $("#enm option:selected").text();
        esbxh = $("#esbxh").val();
        eazdd = $("#eazdd").val();
        eipdz = $("#eipdz").val();
        extpzzdrl = $("#extpzzdrl").val();
        extpzrl = $("#extpzrl").val();
        ezdfxs = $("#ezdfxs").val();
        ecjhmzcws = $("#ecjhmzcws").val();
        ejshmzcws = $("#ejshmzcws").val();
        ezjfx = $("#ezjfx").val();
        ezjrl = $("#ezjrl").val();
        eyhms = $("#eyhms").val();
        etryxsj = $("#etryxsj").val();
        ebz = $("#ebz").val();
        $.ajax({
            url:"${basePath}addYytxxt.action",
            data:{
                "ptyp":ptyp,
                "etyp":etyp,
                "enm":enm,
                "esbxh":esbxh,
                "eazdd":eazdd,
                "eipdz":eipdz,
                "extpzzdrl":extpzzdrl,
                "extpzrl":extpzrl,
                "ezdfxs":ezdfxs,
                "ecjhmzcws":ecjhmzcws,
                "ejshmzcws":ejshmzcws,
                "ezjfx":ezjfx,
                "ezjrl":ezjrl,
                "eyhms":eyhms,
                "etryxsj":etryxsj,
                "ebz":ebz
            },
            dataType:"json",
            type:"post",
            success:function(data){
                var str = "";
                if("1" == data.code){

                    alert("录入成功！");

                    resetSubmit1();
                }else if("0" == data.code){
                    alert("录入失败");
                }
            }
        });

    }
    function resetSubmit1() {
        eid="",ptyp="",etyp="",enm="",esbxh="",eazdd="",eipdz="",extpzzdrl="",extpzrl="",ezdfxs="",ecjhmzcws="",ejshmzcws="",ezjfx="",ezjrl="",eyhms="",etryxsj="",ebz=""
    }
</script>
</html>