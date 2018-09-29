<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>前端index页</title>
<jsp:include page="jscore.jsp"/>
</head>
<style type="text/css">
    html{
        height: 100%;
    }
    body{
        padding: 0;
        margin: 0;
        background: url("/static/images/logo.jpg") no-repeat;
        background-size: 100% 100%;
        position: absolute;
    }
</style>
<body >
<form class="form-horizontal" id="skuserForm">
        <div class="form-group" style="margin-right:500px;margin-left: 500px;margin-top: 180px;">
        <div class="input-group">
            <div class="input-group-addon">
                <i class="glyphicon glyphicon-user"></i>
            </div>
            <input type="text" class="form-control input-lg"  name="user_kh" placeholder="请刷卡">
        </div>
    </div>
</form>
<form  id="viewuserForm" class="form-horizontal">
<div class="modal inmodal fade" id="myModal2" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <div class="ibox-content">
                    <div class="alert alert-info" class="col-sm-2" style="align-content: center">
                        登陆系统
                    </div>
                    <form id="equipmentAdd" role="form" class="form-horizontal m-t">
                        <div class="form-group" style="margin-left: 180px">
                            <label for="user_name" class="col-sm-2 control-label" >账号：</label>
                            <div class="col-sm-6">
                                <input type="text"  class="form-control" id="user_name" name="user_name" placeholder="请输入账号">
                            </div>
                        </div>
                        <div class="form-group" style="margin-left: 180px">
                            <label for="password" class="col-sm-2 control-label">密码：</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="password" name="password" placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group draggable">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-6 col-sm-offset-2" >
                                <button class="btn btn-primary btn-lg" type="submit" onclick="tologin()">登陆</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</form>
<div style="margin-left: 540px">
    <button type="button" onclick="userButton()" class="btn btn-success btn-lg">
        登陆
    </button>
    <button type="button"  class="btn btn-info btn-lg" onclick="addEquipment()">
        账号密码登陆
    </button>
    <button type="button" onclick="toManagement()" class="btn btn-primary btn-lg">
        登陆后台
    </button>
</div>
<script type="text/javascript">
    function addEquipment(){
        $('#myModal2').modal('toggle');
    }
    function userButton(){
        $.ajax({
            url:'<%=request.getContextPath() %>/server/queryUserKh',
            type:'get',
            data:$("#skuserForm").serialize(),
            dataType:'json',
            success:function(data){
                if(data.useFlag == 100 || data.useFlag == "100"){
                     location.href = "toViewList";
                }else if (data.useFlag == 101 || data.useFlag == "101"){
                    alert("该卡号不存在");
                }else if(data.useFlag == 102 || data.useFlag == "102"){
                    alert("卡号重复");
                }
            },error:function(){
                alert("哇哦！程序走丢了");
            }
        })
    }
    function toManagement() {
        location.href = "/toIndex";
    }
    function tologin(){
        $.ajax({
            url:'<%=request.getContextPath() %>/server/queryUser',
            type:'post',
            data:$("#viewuserForm").serialize(),
            dataType:'json',
            success:function(data){
                if(data.useFlag == 100 || data.useFlag == "100"){
                    location.href="toViewList";
                }else if(data.useFlag == 101 || data.useFlag == "101"){
                    alert("用户名错误");
                }else if(data.useFlag == 102 || data.useFlag == "102"){
                    alert("此用户不存在");
                }else if(data.useFlag == 103 || data.useFlag == "103"){
                    alert("此用户存在重复");
                }else if(data.useFlag == 104 || data.useFlag == "104"){
                    alert("密码错误");
                }
            },error:function(useFlag){
                alert("请求走丢了，请检查是否已连接网络！");
            }
        })
    }
</script>
</body>
</html>