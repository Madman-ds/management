<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
    <style type="text/css">
        .form-group {

            width: 65%;
            height: 100px;
        }
    </style>
</head>
<body bgcolor="#ffe4c4" >
<form class="form-horizontal" id="userForm">
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




<%--<div id="YWaitDialog"
    style="background-color: #e0e0e0;
	position: absolute;
	margin: auto;
	top: 150px;
	left: 300px;
	display: none;
	height: 60px;
	width: 300px;">
    <p style="text-align: center; vertical-align: central;">
        请等待，正在查询数据
    </p>
</div>--%>
<script type="text/javascript">



/*    function reButton(){
        BootstrapDialog.show({
            title:"注册页面",
            message: $('<div></div>').load('regies.jsp')
        });
    }*/

    function userButton(){
        $('#YWaitDialog').show();
        $.ajax({
            url:'<%=request.getContextPath() %>/server/queryUser',
            type:'get',
            data:$("#userForm").serialize(),
            dataType:'json',
            success:function(data){
                // alert(data.useFlag);
                if(data.useFlag == 100 || data.useFlag == "100"){
                    alert("登陆成功");
                    location.href="/Vtree.jsp";
                }else if(data.useFlag == 101 || data.useFlag == "101"){
                    alert("用户名错误");
                }else if(data.useFlag == 102 || data.useFlag == "102"){
                    alert("此用户不存在");
                }else if(data.useFlag == 103 || data.useFlag == "103"){
                    alert("此用户存在重复");
                }else if(data.useFlag == 104 || data.useFlag == "104"){
                    alert("密码错误");
                }
                $('#YWaitDialog').hide();
            },error:function(useFlag){
                alert("请求走丢了，请检查是否已连接网络！");
            }
        })
    }

</script>
</body>
</html>