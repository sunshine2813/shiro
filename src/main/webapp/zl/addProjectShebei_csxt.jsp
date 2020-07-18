<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="/WEB-INF/pages/tag.jsp"%>
<%@ include file="/WEB-INF/pages/common_css.jsp"%>
<%@ include file="/WEB-INF/pages/zlgl_commonjs.jsp"%>
<html>
<head>
    <title>传输系统</title>
    <script type="text/javascript">
        var pid = "${param.pid}";
        var newProjectName = "${param.newProjectName}";
        var ptyp = "${param.ptyp}";
        var ptypPinyin = "${param.ptypPinyin}";
        console.log("addProjectShebei_csxt.pid:"+pid);

    </script>
</head>
<body>
<div id="csxt">
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
                                    <input type="text" class="layui-input" id="kgsj" placeholder="yyyy-MM-dd">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="col-sm-6 control-label"><span style="color: red; "></span>完工时间：</label>
                        <div class="col-sm-6">
                            <input type="text" class="layui-input" id="wgsj" name="wgsj"  placeholder="yyyy-MM-dd">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="col-sm-6 control-label"><span style="color: red; "></span>合同完工验收时间：</label>
                        <div class="col-sm-6">
                            <input type="text" class="layui-input"  id="htwgyssj" name="htwgyssj" placeholder="yyyy-MM-dd">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="col-sm-6 control-label"><span style="color: red; "></span>初步验收时间：</label>
                        <div class="col-sm-6">
                            <input type="text" class="layui-input" id="cbyssj" name="cbyssj" placeholder="yyyy-MM-dd">
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
    </div>
</div>
<div style="height: 1000px;border:1px solid red;">dd</div>
</body>
</html>
