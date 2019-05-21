<%@ page import="com.ds.serverlogin.pojo.LoginUser" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/9/29
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    LoginUser user = (LoginUser)request.getSession().getAttribute("loginUser");
    String user_name = user.getUser_name();
    Long userId= user.getUser_id();
%>

<html>
<head>
    <title>热等静压安全管理系统</title>
    <style>
        html{
            height: 100%;
        }
        body{
            padding: 0;
            margin: 0;
            background-size: 100% 100%;
            position: absolute;
        }

        select{
            width: auto;
            padding: 0 2%;
            margin: 0;

        }
        option{
            text-align:center;
        }
        .row {
            margin-bottom: 100px;
        }
    </style>
    <jsp:include page="../../../public/jscore.jsp"></jsp:include>
</head>
<body>
<img src="./static/images/logo.png" alt=""     style="width: 60%;margin: 30px 20%;" >

<div class="modal-body">
    <center>
        <%--<jsp:include page="../../../public/but_inculd.jsp"  />--%>
            <button type="button" onclick="weixian()" class="btn btn-primary">危险点点检</button>
            &nbsp;
            <button type="button" onclick="glzxjClick()" class="btn btn-danger">管理者巡检</button>
            &nbsp;
            <button type="button" onclick="tpm1200Click()" class="btn btn-primary">1200-TPM点检</button>
            &nbsp;
            <button type="button" onclick="tpm650Click()" class="btn btn-primary">650-TPM点检</button>
            &nbsp;
            <button type="button" class="btn btn-primary" onclick="showfives()">5S点检</button>
        <div style="margin-top: 20px">
            <label>问题数:</label>
            <textarea class="form-control" id="glz_count" name="glz_count" rows="1" style="width: 180px"></textarea>
        </div>
        <input type="hidden" name="glz_name" value="${loginUser.user_name}" class="form-control" id="glz_name">
        <input type="hidden" name="user_id" value="${loginUser.user_id}" class="form-control" id="user_id">
        <input type="hidden" id="delTextId" />
    </center>
</div>


<div class="form-group">
    <%--<div class="col-sm-4">
    </div>--%>
    <div class="col-sm-12" align="center">
        <div class="input-group col-sm-10">
            <button onclick="formsubmit()" class="btn btn-success" type="button">
                <i class="glyphicon glyphicon-ok">
                </i>提交
            </button>
            &nbsp;
            <%--<button onclick="zjRead()" class="btn btn-primary" type="button">
                <i class="glyphicon glyphicon-share-alt">
                </i>个人查看
            </button>
            &nbsp;--%>
            <button onclick="zjReadNew()" class="btn btn-primary" type="button">
                <i class="glyphicon glyphicon-share-alt">
                </i>个人查看
            </button>
            &nbsp;
            <button onclick="out()" class="btn btn-danger" type="button">
                <i class="glyphicon glyphicon-off">
                </i>退出
            </button>

        </div>
    </div>
</div>
<input id="user_name" type="hidden" value="<%=user_name%>" />
<input id="userId" type="hidden" value="<%=userId%>" />
</body>
<script type="text/javascript">
    //1分钟内不执行操作倒计时300秒执行退出方法
    var maxTime = 300; // seconds
    var time = maxTime;
    $('body').on('keydown mousemove mousedown', function(e) {
        time = maxTime; // reset
    });
    var intervalId = setInterval(function() {
        time--;
        if (time <= 0) {
            ShowInvalidLoginMessage();
            clearInterval(intervalId);
        }
    }, 1000)
    function ShowInvalidLoginMessage() {
        alert("您已经长时间没操作了，即将退出系统");
        location.href = "<%=request.getContextPath() %>/logout";
    }

    /*function zjRead(){
        location.href = "<%=request.getContextPath() %>/GlzxjzjRead";
    }*/
    function zjReadNew(){
        location.href = "<%=request.getContextPath() %>/GlzxjzjReadnew";
    }

    //提交
    function formsubmit() {
        $.ajax({
            url:'<%=request.getContextPath() %>/insertGlzxj',
            type:'post',
            data:{
                "glz_name":$("#glz_name").val(),
                "user_id":$("#user_id").val(),
                "glz_count":$("#glz_count").val()
            },
            dataType:"text",
            success:function(data){
                if (data == 2){
                    alert("您今天已经完成任务，无需重复提交！");
                    location.reload();
                }else if(data == 0){
                    alert("你还未获取写权限，请联系管理员！");
                }else{
                    alert("恭喜提交完成！")
                }
                    location.reload();
            }
        })
    }
    //退出
    function out() {
        location.href = "<%=request.getContextPath() %>/logout"
    }
    //刷新
    function reset_table(){
        $('#dataBackUpForm')[0].reset();
        queryDataBackUp();
    }

    //转换日期格式(时间戳转换为datetime格式)
    function changeDateFormat(cellval) {
        if (cellval != null){
            var d = new Date(cellval);
            var times=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
            return times;
        }
    }
    $('#datetimepicker').datetimepicker({
        format: 'yyyy-mm-dd hh:mm:ss',     /*此属性是显示顺序，还有显示顺序是mm-dd-yyyy*/
        language:"zh-CN",
        autoclose:true
    });
    $('#datetimeend').datetimepicker({
        format: 'yyyy-mm-dd hh:mm:ss',     /*此属性是显示顺序，还有显示顺序是mm-dd-yyyy*/
        language:"zh-CN",
        autoclose:true
    });
    //去读权限页面
    function toread() {
        var userId = $("#userId").val();
        location.href = "<%=request.getContextPath() %>/toread"
    }

    //-----按钮----------S--------------------------------------------------
    function glzxjClick() {
        location.href = "<%=request.getContextPath() %>/toGlzxjAdd"
    }

    function weixian() {
        location.href = "<%=request.getContextPath() %>/toViewList"
    }
    function showfives(){
        location.href = "<%=request.getContextPath() %>/toshowfiveslog"
    }
    function tpm1200Click() {
        location.href = "<%=request.getContextPath() %>/toTpm1200List"
    }
    function tpm650Click() {
        location.href = "<%=request.getContextPath() %>/toTpm650List"
    }
    //-----按钮----------E--------------------------------------------------
</script>
</html>
