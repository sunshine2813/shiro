<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/tag.jsp"%>
<%@ include file="/WEB-INF/pages/common_css.jsp"%>
<%@ include file="/WEB-INF/pages/common_js.jsp"%>
<html>
<head>
    <title>录入数据字典insert</title>
    <script type="text/javascript">
        $(document).ready(function(){
            var dictInfo_tbody_h = document.body.clientHeight - 30;
            $("#right").height(dictInfo_tbody_h);
            console.log("right_h:"+dictInfo_tbody_h);

        });


    </script>
</head>
<body>
<div style="display: inline-block; float: left;width: 50%;">
    <div id="addDict">
        <div class="form-content">
            <form id="addDictForm" enctype="multipart/form-data" class="form-horizontal">
                <h4 class="form-header h4">录入数据字典</h4>
                <!-- 这是一行 -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><span style="color: red; ">*</span>系统类别</label>
                            <div class="col-sm-8">
                                <input id="addDict_pTyp" name="addDict_pTyp" autocomplete="off" placeholder="请输入系统类别" class="form-control" required="required" type="text">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><span style="color: red; ">*</span>设备类别</label>
                            <div class="col-sm-8">
                                <input id="addDict_eTyp" name="addDict_eTyp" autocomplete="off" placeholder="请输入设备类别" class="form-control" required="required" type="text">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label class="col-sm-4 control-label"><span style="color: red; ">*</span>设备名称</label>
                            <div class="col-sm-8">
                                <input id="addDict_eNm" name="addDict_eNm" autocomplete="off" placeholder="请输入设备名称" class="form-control" required="required" type="text">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="row">
            <div class="col-sm-offset-5 col-sm-10">
                <button type="button" class="btn btn-sm btn-primary" onclick="addDictSubmit()"><i class="fa fa-check"></i>保 存</button>&nbsp;
            </div>
        </div>
    </div>
</div>
<!-- 表格基本信息展示 区域  -->
<div id="right" style="display: inline-block;float: left; overflow: auto; width:40%;margin:0 20px;">
    <h4 class="form-header h4" style="margin-top: 18px;">数据字典显示</h4>
    <div class="fixed-table-container">
        <div >

            <table id="bootstrap-table" data-mobile-responsive="true" class="table table-hover">
                <thead>
                <tr>
                    <th><div class="th-inner">系统类别</div><div class="fht-cell"></div></th>
                    <th><div class="th-inner">设备类别</div><div class="fht-cell"></div></th>
                    <th><div class="th-inner">设备名称</div><div class="fht-cell"></div></th>
                    <th style="text-align:center"><div class="th-inner">操作</div><div class="fht-cell"></div></th>
                </tr>
                </thead>
                <tbody id="dictInfo_tbody"></tbody>
            </table>
        </div>
        <div class="fixed-table-footer" style="display:none;"></div>
        <!-- 记录条数  -->
        <div class="fixed-table-pagination" style="display:block;">
            <div class="pull-left pagination-detail">
                <span class="pagination-info">共<span id="infoNum"></span>条记录</span>
                <span class="page-list" style="display:none;"></span>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    /*获取所有字典*/
    getAllDict();

    function addDictSubmit(){
        var addDict_pTyp = $("#addDict_pTyp").val();
        var addDict_eTyp = $("#addDict_eTyp").val();
        var addDict_eNm = $("#addDict_eNm").val();


        if(judgeBlank(addDict_pTyp) == false || judgeBlank(addDict_eNm) == false
                || judgeBlank(addDict_eTyp) == false ){
            alert("请输入所有必填项目!");
        }else{
            $.ajax({
                url:"${basePath}addDict.action",
                data:{
                    "ptyp":addDict_pTyp,
                    "etyp":addDict_eTyp,
                    "enm":addDict_eNm
                },
                dataType:"json",
                type:"post",
                success:function(data){
                    var str = "";
                    if("1" == data.code){
                        /*alert("添加成功");*/
                        var list = data.data;
                        var infoNum = list.length;
                        str = getTbStrByList(list);
                        $("#dictInfo_tbody").html(str);
                        //console.log("共"+infoNum+"条记录");
                        $("#infoNum").text(infoNum);
                    }else if("0" == data.code){
                        alert("录入失败,请确保数据字典必输项目不完全相同!");
                    }
                }
            });
        }
    }

    /*根据返回值获取展示字符串*/
    function getTbStrByList(list){
        var str = "";
        $.each(list,function(index, value){
            // 拼接整个表格的tbody部分内容为 str
            str+="<tr>"+
                    "<td>"+value.ptyp+"</td>"+
                    "<td>"+value.etyp+"</td>"+
                    "<td>"+value.enm+"</td>"+
                    '<td style="padding:0px;width:150px;">'+
                    '<a class="btn btn-danger btn-xs" href="javascript:void(0)" onclick="delDict('+"'"+value.id+"'"+')">'+'<i class="fa fa-remove"></i>'+"删除"+'</a>'+
                    "</tr>";
        });
        console.log("表格list拼接html.str:\n"+str);
        return str;
    }

    /*删除某个合同类别*/
    function delDict(id){
        var r = confirm("确定删除?");
        if(r == true){
            $.ajax({
                url:"${basePath}delDict.action",
                data:{
                    "id":id
                },
                dataType:"json",
                type:"post",
                success:function(data){
                    if("1" == data.code){
                        alert("成功删除");
                        var list = data.data;
                        var infoNum = list.length;
                        str = getTbStrByList(list);
                        $("#dictInfo_tbody").html(str);
                        //console.log("共"+infoNum+"条记录");
                        $("#infoNum").text(infoNum);
                    }else{
                        alert("没有删除, 请联系管理员!");
                    }
                }
            });
        }
    }
    function getAllDict(){
        $.ajax({
            url:"${basePath}getAllDict.action",
            data:{},
            type:"POST",
            dataType:"json",
            success:function(data){
                var str = "";
                if("1" == data.code){
                    var list = data.data;
                    var infoNum = list.length;
                    str = getTbStrByList(list);
                    $("#dictInfo_tbody").html(str);
                    $("#infoNum").text(infoNum);
                }
            }
        });
    }



</script>
</html>
