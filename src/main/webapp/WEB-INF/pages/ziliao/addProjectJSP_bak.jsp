<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="/WEB-INF/pages/tag.jsp"%>
<%@ include file="/WEB-INF/pages/common_css.jsp"%>
<%@ include file="/WEB-INF/pages/admin_css_js.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>录入项目页面</title>
    <script type="text/javascript">
        function addVoucherSubmit(){
            console.log("addVoucherSubmit");
        }
        /*laydate.render({
            elem : '#dateSksw'
            ,range : true
        });*/
        /*获取项目分类*/
        /*getPtyp();*/




    </script>
</head>
<body>
<div>
    <div class="form-content">
        <form id="addVoucherImgForm"  class="form-horizontal">
            <h4 class="form-header h4">录入项目基本信息</h4>
            <div class="row">
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>所属单位：</label>
                        <div class="col-sm-8">
                            <div class="input-group" style="width: 100%">
                                <input id="addProject_pnm" name="addProject_pnm" autocomplete="off" placeholder="请输入项目名称" class="form-control" type="text">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; "></span>项目分类：</label>
                        <div class="col-sm-8">
                            <select id="addProject_ptyp" name="addProject_ptyp" class="form-control" ></select>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; "></span>批复文号：</label>
                        <div class="col-sm-8">
                            <input id="addProject_pfwh" name="addProject_pfwh" autocomplete="off" placeholder="请输入项目批复文号" class="form-control" type="text">
                        </div>
                    </div>
                </div>
            </div>
            <%--第2行--%>
            <div class="row">
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>投资金额：</label>
                        <div class="col-sm-8">
                            <input id="addProject_tzje" name="addProject_tzje" autocomplete="off" placeholder="请输入项目投资金额" class="form-control" required="required" type="text" maxlength="11" >
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>投资类别：</label>
                        <div class="col-sm-8">
                            <input id="addProject_tzlb" name="addProject_tzlb" autocomplete="off" placeholder="请输入投资类别" class="form-control" required="required" type="text" maxlength="11" >
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>设备安装地点：</label>
                        <div class="col-sm-8">
                            <input id="addProject_sbazdd" name="addProject_sbazdd" autocomplete="off" placeholder="请输入设备安装地点" class="form-control" required="required" type="text" maxlength="11" >
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>运行维护单位：</label>
                        <div class="col-sm-8">
                            <input id="addProject_yxwhdw" name="addProject_yxwhdw" autocomplete="off" placeholder="请输入项目编号" class="form-control" required="required" type="text" maxlength="11" >
                        </div>
                    </div>
                </div>
            </div>
            <%--第3行--%>
            <div class="row">
                <div class="col-sm-2">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; ">*</span>：开工时间</label>
                        <div class="col-sm-8">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input type="text" class="layui-input" id="kgsj" placeholder="yyyy-MM-dd">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; "></span>完工时间：</label>
                        <div class="col-sm-8">
                            <input type="text" class="layui-input" id="wgsj" name="wgsj"  placeholder="yyyy-MM-dd">
                        </div>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; "></span>合同完工验收时间：</label>
                        <div class="col-sm-8">
                            <input type="text" class="layui-input"  id="htwgyssj" name="htwgyssj" placeholder="yyyy-MM-dd">
                        </div>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; "></span>初步验收时间：</label>
                        <div class="col-sm-8">
                            <input type="text" class="layui-input" id="cbyssj" name="cbyssj" placeholder="yyyy-MM-dd">
                        </div>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="form-group">
                        <label class="col-sm-4 control-label"><span style="color: red; "></span>竣工验收时间：</label>
                        <div class="col-sm-8">
                            <input type="text"id="jgyssj" name="jgyssj" placeholder="yyyy-MM-dd" class="form-control">
                        </div>
                    </div>
                </div>
            </div>

        </form>
    </div>
    <div class="row">
        <div class="col-sm-offset-5 col-sm-10">
            <button type="button" class="btn btn-sm btn-primary" onclick="addVoucherSubmit()"><i class="fa fa-check"></i>保 存</button>&nbsp;

        </div>
    </div>
</div>

</body>
</html>
