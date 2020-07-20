<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
    /*获取所有用户的信息*/
    function loadContract(){
        //console.log("loadcontract");
        $.ajax({
            url:"${basePath}admin/getContract.action",
            data:{},
            type:"POST",
            dataType:"json",
            success:function(data){
                var str = "";
                if("1" == data.code){
                    var ctrtypes = data.data;
                    var ctrtypesNum = ctrtypes.length;
                    str = getCtrTbStrByList(ctrtypes);
                    $("#contractType_tbody").html(str);
                    //console.log("共"+ctrtypesNum+"条记录");
                    $("#crtTypeInfoNum").text(ctrtypesNum);
                }
            }
        });
    }

    /*根据返回值获取展示字符串*/
    function getCtrTbStrByList(list){
        var str = "";
        $.each(list,function(index, value){
            // 拼接整个表格的tbody部分内容为 str
            str+="<tr>"+
                    "<td>"+value.id+"</td>"+
                    "<td>"+value.typename+"</td>"+
                    '<td style="padding:0px;width:150px;">'+
                    '<a class="btn btn-danger btn-xs" href="javascript:void(0)" onclick="delCtrTyp('+"'"+value.id+"'"+",'"+value.typename+"'"+')">'+'<i class="fa fa-remove"></i>'+"删除"+'</a>'+
                    "</tr>";
        });
        ////console.log("表格list拼接html.str:\n"+str);
        return str;
    }

    /*删除某个合同类别*/
    function delCtrTyp(id, typename){
        var r = confirm("确定删除 "+ typename+" 吗?");
        if(r == true){
            $.ajax({
                url:"${basePath}admin/delCtrTyp.action",
                data:{
                    "id":id
                },
                dataType:"json",
                type:"post",
                success:function(data){
                    if("1" == data.code){
                        alert("成功删除 "+typename);
                        //获取所有合同
                        var ctrtypes = data.data;
                        var ctrtypesNum = ctrtypes.length;
                        str = getCtrTbStrByList(ctrtypes);
                        $("#contractType_tbody").html(str);
                        //console.log("共"+ctrtypesNum+"条记录");
                        $("#crtTypeInfoNum").text(ctrtypesNum);
                    }else{
                        alert("没有删除 "+typename+",请联系管理员");
                    }
                }
            });
        }
    }

</script>