<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台系统index页</title>
<jsp:include page="jscore.jsp"/>
</head>
<style type="text/css">
    html{
        height: 100%;
    }
    body{
        padding: 0;
        margin: 0;
        background: url("<%=request.getContextPath() %>/static/images/logo_03.jpg") no-repeat;
        background-size: 100% 100%;
        position: absolute;
    }
</style>
<body >
<div onclick="tanchu()" style="border-color: #0f0f0f">
    <div id="login"></div>
</div>
<script type="text/javascript">
    $(function(){
        login();
    })
    function login(){
        BootstrapDialog.show({
            title:"登录页面",
            message: $("#login").load('login.jsp')
        });
    }

    function tanchu(){
        BootstrapDialog.show({
            title:"登录页面",
            message: $("#login").load('login.jsp')
        });
    }
</script>
</body>
</html>