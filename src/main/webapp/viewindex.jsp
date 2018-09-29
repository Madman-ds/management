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
    <div class="form-group" style="margin-right: -15px;margin-left: 100px;margin-top: 15px;">
        <div class="input-group">
            <div class="input-group-addon">
                <i class="glyphicon glyphicon-user"></i>
            </div>
            <input type="text" class="form-control"  name="user_kh" placeholder="请刷卡">
        </div>
    </div>
    <div class="form-group" style="margin-right: -15px;margin-left: 100px;">
        <button type="button" onclick="userButton()" class="btn btn-success btn-lg btn-block">
            登陆
        </button>
        <button type="button" onclick="zmlogin()" class="btn btn-success btn-lg btn-block">
            账号密码登陆
        </button>
    </div>
</form>
<div id="viewlogin"></div>
<script type="text/javascript">
    function zmlogin(){
        BootstrapDialog.show({
            title:"登录页面",
            message: $("#viewlogin").load('viewlogin.jsp')
        });
    }
    function userButton(){
        $.ajax({
            url:'<%=request.getContextPath() %>/queryUserKh',
            type:'get',
            data:$("#skuserForm").serialize(),
            dataType:'json',
            success:function(data){

            },error:function(){
                alert("哇哦！程序走丢了");
            }
        })
    }
</script>
</body>
</html>