<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/9/29
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>前端登录页</title>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <style type="text/css">
        .form-group {
            width: 65%;
            height: 100px;
        }
    </style>
</head>
<body bgcolor="#ffe4c4" >
<form class="form-horizontal" id="viewuserForm">
    <div class="form-group" style="margin-right: -15px;margin-left: 100px;margin-top: 15px;">
        <div class="input-group">
            <div class="input-group-addon">
                <i class="glyphicon glyphicon-user"></i>
            </div>
            <input type="text" class="form-control" id="user_name" name="user_name" placeholder="请输入账号">
        </div>
        <div class="input-group" style="margin-top: 15px;">
            <div class="input-group-addon">
                <i class="glyphicon glyphicon-lock"></i>
            </div>
            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
        </div>
    </div>
    <div class="form-group" style="margin-right: -15px;margin-left: 100px;">
        <button type="button" onclick="userButton()" class="btn btn-success btn-lg btn-block">
            登陆
        </button>
    </div>
</form>

<script type="text/javascript">
    function userButton(){
        $.ajax({
            url:'<%=request.getContextPath() %>/server/queryUser',
            type:'get',
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
