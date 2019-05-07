<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>前端index页</title>
<jsp:include page="../public/jscore.jsp"/>
</head>
<style type="text/css">
    html{
        height: 100%;
    }
    body{
        padding: 0;
        margin: 0;
        position: absolute;
    }
</style>
<body >
<img src="static/images/logo.png" alt=""     style="width: 60%;margin: 30px 20%;" >
<%--<form class="form-horizontal" id="skuserForm">--%>
        <div class="form-group" style="margin-right:18%;margin-left: 20%;margin-top: 180px;">
        <div class="input-group">
            <div class="input-group-addon">
                <i class="glyphicon glyphicon-user"></i>
            </div>
            <input type="password" class="form-control input-lg"  name="user_kh" placeholder="请刷卡登陆系统" id="kw" onchange="skButton()">
        </div>
    </div>
<%--</form>--%>
<div class="modal inmodal fade" id="myModal2" tabindex="-1" role="dialog"  aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <div class="ibox-content">
                    <div class="alert alert-info" class="col-sm-2" style="align-content: center">
                        登陆系统
                    </div>
                    <form id="viewuserForm" role="form" class="form-horizontal m-t">
                        <div class="form-group" style="margin-left: 180px">
                            <label for="user_name" class="col-sm-2 control-label" >账号：</label>
                            <div class="col-sm-6">
                                <input type="text"  class="form-control" id="user_name" name="user_name" placeholder="请输入账号">
                            </div>
                        </div>
                        <div class="form-group" style="margin-left: 180px">
                            <label for="password" class="col-sm-2 control-label">密码：</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group draggable">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-6 col-sm-offset-2" >
                                <button class="btn btn-primary btn-lg" type="button" onclick="tologin()">登陆</button>
                                <button class="btn btn-primary btn-lg" type="button" onclick="toreload()">返回</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="margin-left: 500px">
    <%--<button type="button" onclick="skButton()" class="btn btn-success btn-lg">
        刷卡登陆
    </button>--%>
    <button type="button"  class="btn btn-info btn-lg" onclick="toUserLogin()">
        账号登陆
    </button>
    <button type="button" onclick="toIndex()" class="btn btn-primary btn-lg">
        登陆后台
    </button>
</div>
<script type="text/javascript">
    <!-- 页面加载时光标选中刷卡文本框 -->
    $(function(){
        $("#kw").focus();
    })
    <!-- 刷卡登录方法 -->
    function skButton(){
        if ($("#kw").val() == "" || $("#kw").val() == null){
            //alert("请刷卡或填入卡号");
            $("#kw").focus();
            return;
        }

        $.ajax({
            url:'<%=request.getContextPath() %>/server/queryUserKh',
            type:'post',
            data:{"user_kh":$("#kw").val()},
            dataType:'json',
            success:function(data){
                if(data.useFlag == 100 || data.useFlag == "100"){
                     location.href = "toViewList";
                }else if (data.useFlag == 101 || data.useFlag == "101"){
                    alert("该卡号不存在");
                    location.reload();
                }else if(data.useFlag == 102 || data.useFlag == "102"){
                    alert("卡号重复");
                    location.reload();
                }
            },error:function(){
                alert("哇哦！程序走丢了");
            }
        })
    }
    <!-- 后台登录 -->
    function toIndex() {
        location.href = "<%=request.getContextPath() %>/toIndex";
    }
    <!-- 账号登录模态框 -->
    function toUserLogin(){
        $('#myModal2').modal('toggle');
    }
    <!-- 账号登录模态框点击退出 -->
    function toreload() {
        location.reload();
    }
    <!-- 账号登录方法 -->
    function tologin(){
        if ($("#user_name").val() == ""){
            alert("请输入账号");
            return false;
        }
        if ($("#password").val() == ""){
            alert("请输入密码");
            return false;
        }
        $.ajax({
            url:'<%=request.getContextPath() %>/server/queryUser',
            type:'post',
            data:$("#viewuserForm").serialize(),
            dataType:'text',
            cache:false,
            success:function(data){
                var data = eval("("+data+")");
                if(data.useFlag == 100 || data.useFlag == "100"){
                    location.href="<%=request.getContextPath() %>/toViewList";
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
                alert("服务器走丢了，我们正在找寻中...");
            }
        })
    }
</script>
</body>
</html>