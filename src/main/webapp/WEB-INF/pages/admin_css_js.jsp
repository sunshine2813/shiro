<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%--管理员的所有页面格式--%>
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
    var userid, username, usercode;
    var voucherQ = "voucher_query",voucherC="voucher_create",voucherD="voucher_delete",
            contractQ = "contract_query",contractC = "contract_create",contractD = "contract_delete",
            financeQ = "finance_query", financeQAll = "finance_queryAll", financeC = "finance_create", financeD = "finance_delete";
    var catChar = "_";
    var chkVoucherQId,chkVoucherCId,chkVoucherDId;
    var chkContractQId,chkContractCId,chkContractDId;
    var chkFinanceQId, chkFinanceQAllId, chkFinanceCId,chkFinanceDId;
    /*chkIds 和 VCFpermissions 的值是一一对应的*/
    var chkIds;
    var VCFpermissions = [voucherQ, voucherC, voucherD,
        contractQ, contractC, contractD,
        financeQ, financeQAll, financeC, financeD];
    var chkVoucherName = "voucherChk", chkContractName="contractChk",chkFinanceName="financeChk";


    /*后端返回的用户基本list转为表格的html字符串*/
    function getUserTbStrByList(list){
        var str = "";
        $.each(list,function(index, value){
            // 拼接整个表格的tbody部分内容为 str
            str+="<tr>"+
                    "<td>"+value.id+"</td>"+
                    "<td>"+value.usercode+"</td>"+
                    "<td>"+value.username+"</td>"+
                    "<td>"+value.password+"</td>"+
                    '<td style="padding:0px;width:150px;"><a class="btn btn-primary btn-xs" href="javascript:void(0)" onclick="editUser('+"'"+value.id+"'"+','+"'"+value.username+"'"+','+"'"+value.password+"'"+')">'+'<i class="fa fa-edit"></i>'+"修改密码"+'</a>&nbsp;'+
                    '<a class="btn btn-danger btn-xs" href="javascript:void(0)" onclick="delUser('+"'"+value.id+"'"+",'"+value.username+"'"+')">'+'<i class="fa fa-remove"></i>'+"删除"+'</a>'+
                    "</tr>";
        });
        ////console.log("表格list拼接html.str:\n"+str);
        return str;
    }

    /*后端返回的用户权限list转为表格的html字符串*/
    function getUserPermsTbStrByList(list){
        var str = "";
        $.each(list,function(index, value){
            // 拼接整个表格的tbody部分内容为 str
            //每个checkbox的id组合规则是[id_功能_增/删/查],例如id_voucher_create
            str+="<tr>"+
                    "<td>"+value.id+"</td>"+
                    "<td>"+value.usercode+"</td>"+
                    "<td>"+value.username+"</td>"+
                    "<td>"+value.password+"</td>"+
                    '<td>' +
                        '<input type="checkbox" name="'+value.id+'_voucherChk" id="'+value.id+'_voucher_query"'+' value="' +"凭单查询"+'"/>'+"凭单查询"+"<br>"+
                        '<input type="checkbox" name="'+value.id+'_voucherChk" id="'+value.id+'_voucher_create"'+' value="'+"凭单录入"+'"/>'+"凭单录入"+"<br>"+
                        '<input type="checkbox" name="'+value.id+'_voucherChk" id="'+value.id+'_voucher_delete"'+' value="'+"凭单删除"+'"/>'+"凭单删除"+"<br>"+
                    "</td>"+
                    '<td>' +
                        '<input type="checkbox" name="'+value.id+'_contractChk" id="'+value.id+'_contract_query"'+' value="'+"合同查询"+'"/>'+"合同查询"+"<br>"+
                        '<input type="checkbox" name="'+value.id+'_contractChk" id="'+value.id+'_contract_create"'+' value="'+"合同录入"+'"/>'+"合同录入"+"<br>"+
                        '<input type="checkbox" name="'+value.id+'_contractChk" id="'+value.id+'_contract_delete"'+' value="'+"合同删除"+'"/>'+"合同删除"+"<br>"+
                    "</td>"+
                    '<td>' +
                        '<input type="checkbox" name="'+value.id+'_financeChk" id="'+value.id+'_finance_query"'+' value="'+"财务资料查询"+'"/>'+"财务资料查询"+"<br>"+
                        '<input type="checkbox" name="'+value.id+'_financeChk" id="'+value.id+'_finance_queryAll"'+' value="'+"财务资料全部查询"+'"/>'+"资料全部查询"+"<br>"+
                        '<input type="checkbox" name="'+value.id+'_financeChk" id="'+value.id+'_finance_create"'+' value="'+"财务资料录入"+'"/>'+"财务资料录入"+"<br>"+
                        '<input type="checkbox" name="'+value.id+'_financeChk" id="'+value.id+'_finance_delete"'+' value="'+"财务资料删除"+'"/>'+"财务资料删除"+"<br>"+
                    "</td>"+
                    '<td style="padding:0px;width:150px;">'+
                    /*'<a class="btn btn-success btn-xs" href="javascript:void(0)" onclick="resetPerms('+"'"+value.id+"'"+')">'+'<i class="fa fa-edit"></i>'+"重置权限"+'</a>&nbsp;'+*/
                    '<a class="btn btn-primary btn-xs" href="javascript:void(0)" onclick="savePerms('+"'"+value.id+"','"+ value.username +"'"+')">'+'<i class="fa fa-check-square-o"></i>'+"保存修改"+'</a>'+
                    "</td>"+
                    "</tr>";
        });
        ////console.log("权限list拼接html.str:\n"+str);
        return str;
    }

    /*渲染权限checkbox的打钩*/
    function setPermsChkByList(list){
        $.each(list,function(index, value){
            setPermsChk(value.id, value.permissions);
        });
    }

    /*根据userid和permissions字符串渲染checkbox*/
    function setPermsChk(id, permissions){
        permissions = permissions.replace(/:/g,"_");
        //console.log("setPermsChk().id:"+id+",permissions:"+permissions);
        var arr = permissions.split(",");
        for(var i=0; i<arr.length; i++){
            var chkId = getCheckboxIdByUseridPerms(id, arr[i]);
            var obj = $("#"+chkId);
            obj.prop("checked", true);
        }
    }

    /*获取所有用户的信息*/
    function loadUsers(){
        $.ajax({
            url:"${basePath}admin/getUsers.action",
            data:{},
            type:"POST",
            dataType:"json",
            success:function(data){
                var str = "";
                if("1" == data.code){
                    var users = data.data;
                    var userInfoNum = users.length;
                    str = getUserTbStrByList(users);
                    $("#userInfo_tbody").html(str);
                    //console.log("共"+userInfoNum+"条记录");
                    $("#userInfoNum").text(userInfoNum);
                }
            }
        });
    }

    /*判断录入用户时 勾选的权限是否符合要求*/
    function judgePem(pems){
        var flag = true;
        if(pems == ""){
            alert("请选择对应的权限");
            flag = false;
        }
        if(pems.indexOf("voucher_query") == -1 && pems.indexOf("voucher") != -1){
            flag = false;
            alert('请勾选"凭单查看"权限');
        }else if(pems.indexOf("contract_query") == -1 && pems.indexOf("contract") != -1){
            flag = false;
            alert('请勾选"合同查看"权限');
        }else if(pems.indexOf("finance_query") == -1 && pems.indexOf("finance") != -1){
            flag = false;
            alert('请勾选"财务资料查看"权限');
        }
        return flag;
    }

    /*userInfo.jsp 录入新用户的提交方法*/
    function addUserSubmit(){
        var add_username = $("#add_username").val();
        var add_usercode = $("#add_usercode").val();
        var add_password = $("#add_password").val();
        var add_permissions = getAdduserPermissions();
        /*判断勾选的权限是否符合规则*/
        judgePem(add_permissions);
        if(judgeBlank(add_username) == false)
            alert("请输入用户名称!");
        else if(judgeBlank(add_usercode) == false){
            alert("请输入用户代码!");
        }else if(judgeBlank(add_password) == false){
            alert("请输入用户初始明文密码!");
        }else if( judgePem(add_permissions)){
            //所有输入非空继续执行 && 勾选的权限符合权限规则
            //console.log("录入用户的保存方法addUserSubmit---add_username:"+add_username+",add_usercode:"+add_usercode+",add_password:"+add_password+",add_permissions:"+add_permissions);
            $.ajax({
                url:"${basePath}admin/addUser.action",
                data:{
                    "username":add_username,
                    "usercode":add_usercode,
                    "password":add_password,
                    "add_permissions":add_permissions
                },
                dataType:"json",
                type:"post",
                success:function(data){
                    $('#addUserModal').modal('hide');
                    var str = "";
                    if("1" == data.code){
                        //获取所有用户
                        var allUsers = data.data;
                        var userInfoNum = allUsers.length;
                        str = getUserTbStrByList(allUsers);
                        $("#userInfo_tbody").html(str);
                        //console.log("共"+userInfoNum+"条记录");
                        $("#userInfoNum").text(userInfoNum);
                    }else if("0" == data.code){
                        alert("用户名username重复,请重新录入");
                    }
                }
            });
        }
    }

    /*获取string类型的新增用户的权限*/
    function getAdduserPermissions(){
        var permissionArr = [];
        if($("#VQ").prop("checked"))
            permissionArr.push("voucher_query");
        if($("#VC").prop("checked"))
            permissionArr.push("voucher_create");
        if($("#VD").prop("checked"))
            permissionArr.push("voucher_delete");

        if($("#CQ").prop("checked"))
            permissionArr.push("contract_query");
        if($("#CC").prop("checked"))
            permissionArr.push("contract_create");
        if($("#CD").prop("checked"))
            permissionArr.push("contract_delete");

        if($("#FQ").prop("checked"))
            permissionArr.push("finance_query");
        if($("#FQAll").prop("checked"))
            permissionArr.push("finance_queryAll");
        if($("#FC").prop("checked"))
            permissionArr.push("finance_create");
        if($("#FD").prop("checked"))
            permissionArr.push("finance_delete");

        //console.log("录入用户选择的权限信息permissionArr:\n")
        //console.log(permissionArr.toString());
        return permissionArr.toString();
    }

    /*修改用户密码*/
    function editUser(editUser_id, editUser_username, oldPassword) {
        userid = editUser_id;
        username = editUser_username;
        /*设置修改用户密码模态框里的数据*/
        $("#edit_id").text(userid);
        $("#edit_username").text(username);
        $("#editUserModal").modal('show');
    }

    /*检查密码强度 密码必须包含大写+小写+数字,长度不少于8位*/
    function regPwdChk(pwd){
        var reg = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[^\da-zA-Z]).{8,}$/;
        var regExp1 = new RegExp(reg);
        return regExp1.test(pwd);
    }

    /*userInfo.jsp 修改用户密码的模态框保存按钮*/
    function editUserSubmit(){
        var newPwd = $("#edit_new_password").val();
        //console.log("editUser.userid:" + userid + ",username:" + username + ",新用户密码:" + newPwd)
        if(!regPwdChk(newPwd)){
            alert("密码必须包含字母+数字+特殊字符,长度不少于8位")
        }else{
            $("#editUserModal").modal('hide');
            $.ajax({
               url:"${basePath}admin/uptPwd.action",
                data:{
                    "id":userid,
                    "newPwd":newPwd
                },
                dataType:"json",
                type:"POST",
                success:function(data){
                    if("1" == data.code){
                        //获取所有用户
                        var allUsers = data.data;
                        var userInfoNum = allUsers.length;
                        str = getUserTbStrByList(allUsers);
                        $("#userInfo_tbody").html(str);
                        //console.log("共"+userInfoNum+"条记录");
                        $("#userInfoNum").text(userInfoNum);
                    }
                }
            });
        }
    }

    /*userInfo.jsp 删除用户*/
    function delUser(id, delUsername){
        userid = id;
        username = delUsername;
        if(delUsername == "admin")
            alert("不能删除管理员!")
        else{
            var r = confirm("确定删除 "+ username+" 吗?");
            if(r == true){
                $.ajax({
                    url:"${basePath}admin/delUser.action",
                    data:{
                        "id":userid
                    },
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if("1" == data.code){
                            alert("成功删除 "+username);
                            //获取所有用户
                            var allUsers = data.data;
                            var userInfoNum = allUsers.length;
                            str = getUserTbStrByList(allUsers);
                            $("#userInfo_tbody").html(str);
                            //console.log("删除后共"+userInfoNum+"条记录");
                            $("#userInfoNum").text(userInfoNum);
                        }else{
                            alert("没有删除 "+username+",请联系管理员");
                        }
                    }
                });
            }
        }
    }

    /*去除字符串里全部空格,去除空格后,非空则返回true*/
    function judgeBlank(param){
        if(param.replace(/\s*/g, "") != "")
            return true;
        return false;
    }

    /*根据userid初始化 9个对应的checkbox的id标识*/
    function iniCheckboxIdByUserid(userid){
        chkVoucherQId = userid + catChar+voucherQ;
        chkVoucherCId = userid + catChar+voucherC;
        chkVoucherDId = userid + catChar+voucherD;

        chkContractQId = userid + catChar+contractQ;
        chkContractCId = userid + catChar+contractC;
        chkContractDId = userid + catChar+contractD;

        chkFinanceQId = userid + catChar+ financeQ;
        chkFinanceQAllId = userid + catChar + financeQAll;
        chkFinanceCId = userid + catChar+ financeC;
        chkFinanceDId = userid + catChar+ financeD;

        chkIds = [chkVoucherQId, chkVoucherCId, chkVoucherDId,
            chkContractQId, chkContractCId, chkContractDId,
            chkFinanceQId, chkFinanceQAllId, chkFinanceCId, chkFinanceDId];
    }

    function getCheckboxIdByUseridPerms(userid, perm){
//        要把数据库查出来的permissions里面的:替换成_ 这样前端才能识别id
        //console.log("新生成的checkbox的id:"+userid+catChar+perm);
        return userid+catChar+perm;
    }

    /*重置用户的权限  没有做*/
//    function resetPerms(id){
//        //根据用户id初始化对应的9个权限checkbox的id
//        iniCheckboxIdByUserid(id);
//        for(var i=0; i <chkIds.length; i++){
//            var obj = $("#"+chkIds[i]);
//            obj.prop("checked");
//        }
        //根据checkbox的name设置取消勾选
//        var vname = id+"_voucherChk", cname=id+"_contractChk",fname=id+"_financeChk";
//        //console.log("vname:"+vname+",cname:"+cname+",fname:"+fname);
//        $("input[name=vname]").attr("checked","false");
//        $("input[name=cname]").attr("checked","false");
//        $("input[name=fname]").attr("checked","false");
//    }

    /*userPerms.jsp 展示用户权限信息*/
    function loadUserPerms(){
        $.ajax({
            url:"${basePath}admin/getUserPerms.action",
            data:{},
            type:"POST",
            dataType:"json",
            success:function(data){
                var str = "";
                if("1" == data.code){
                    var users = data.data;
                    var user_perms_tbody_recordNum = users.length;
                    str = getUserPermsTbStrByList(users);
                    $("#user_perms_tbody").html(str);
                    //console.log("共"+user_perms_tbody_recordNum+"条记录");
                    // 根据value.permissions设置对应checkbox为选中状态
                    setPermsChkByList(users);
                    $("#user_perms_tbody_recordNum").text(user_perms_tbody_recordNum);
                }
            }
        });
    }

    /*用户权限管理的搜索用户*/
    function userPmsSearchUser(){
        var search_username = $("#search_username").val();
        //console.log(search_username);
        $.ajax({
           "url":"${basePath}admin/userPmsSearchUser.action",
            "dataType":"json",
            "type":"post",
            "data":{
                "username":search_username
            },
            success:function(data){
                var str = "";
                if("1" == data.code){
                    var users = data.data;
                    var user_perms_tbody_recordNum = users.length;
                    str = getUserPermsTbStrByList(users);
                    $("#user_perms_tbody").html(str);
                    //console.log("共"+user_perms_tbody_recordNum+"条记录");
                    // 根据value.permissions设置对应checkbox为选中状态
                    setPermsChkByList(users);
                    $("#user_perms_tbody_recordNum").text(user_perms_tbody_recordNum);
                }else{
                    alert("连接数据库失败,请联系管理员");
                }
            }
        });
    }


    /*获取修改后的用户权限string*/
    function getSavePerms(){
        var permissionArr = [];
        /*根据*/
        for(var i=0;i<chkIds.length;i++){
            var obj = $("#"+chkIds[i]);
            if(obj.prop("checked"))
                permissionArr.push(VCFpermissions[i]);
        }
        //console.log("录入用户选择的权限信息permissionArr:\n")
        //console.log(permissionArr.toString());
        return permissionArr.toString();
    }

    /*保存用户权限*/
    function savePerms(userid, username){
        iniCheckboxIdByUserid(userid);
        var perms = getSavePerms();
        $.ajax({
           "url":"${basePath}admin/savePermsByUserid.action",
            "data":{
                "id":userid,
                "perms":perms
            },
            "dataType":"json",
            "type":"post",
            success:function(data){
                if("1" == data.code){
                    alert("成功修改"+username+"的权限");
                    var str = "";
                    if("1" == data.code) {
                        var users = data.data;
                        var userInfoNum = users.length;
                        str = getUserTbStrByList(users);
                        $("#userInfo_tbody").html(str);
                        //console.log("共" + userInfoNum + "条记录");
                        $("#userInfoNum").text(userInfoNum);
                    }
                }
            }
        });
    }


</script>