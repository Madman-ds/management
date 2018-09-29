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
        background: url("/images/logo.jpg") no-repeat;
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
<div id="viewlogin"></div>
<div style="margin-left: 540px">
    <button type="button" onclick="userButton()" class="btn btn-success btn-lg">
        登陆
    </button>
    <button type="button"  class="btn btn-info btn-lg" onclick="zmlogin()">
        账号密码登陆
    </button>
    <button type="button" onclick="toManagement()" class="btn btn-primary btn-lg">
        登陆后台
    </button>
</div>
<script type="text/javascript">
    function zmlogin(){
        BootstrapDialog.show({
            title:"登录页面",
            message: $("#viewlogin").load('viewlogin.jsp')
        });
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
</script>
</body>
</html>