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
    <jsp:include page="../../jscore.jsp"></jsp:include>
</head>
<body>
<img src="./static/images/logo.png" alt=""     style="width: 60%;margin: 30px 20%;" >

<div class="modal-body">
    <center>
        <jsp:include page="but_inculd.jsp"  />
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
   /* //加载登陆用户所有可编辑的设备检查项信息
    $(function () {
            var user_name =$("#user_name").val();
            var userId =$("#userId").val();
            $.ajax({
            url:'<%=request.getContextPath() %>/equipment/findEquipmentInspectionitem',
            data:{"userId":userId},
            type:'get',
            success:function(data){
                var tbs = document.getElementById("mytableid");//获取表格
                var rows = tbs.insertRow();//添加行
                rows.innerHTML += "<td style='width:160px;height: 45px' align='center'><label>名称</label></td>";
                rows.innerHTML += "<td style='width:160px;height: 45px' align='center'><label>编号</label></td>";
                rows.innerHTML += "<td style='width:160px;height: 45px' align='center'><label>属性</label></td>";
                rows.innerHTML += "<td style='width:160px;height: 45px' align='center'><label>检查项</label></td>";
                rows.innerHTML += "<td style='width:160px;height: 45px' align='center'><label>检查要求</label></td>";
                rows.innerHTML += "<td style='width:160px;height: 45px' align='center'><label>检查结果</label></td>";
                rows.innerHTML += "<td style='width:160px;height: 45px' align='center'><label>确认人</label></td>";
                rows.innerHTML += "<td style='width:160px;height: 45px' align='center'><label>备注内容</label></td>";
                var arr = data;
                for (var i=0;i<arr.length;i++){
                    var tb = document.getElementById("mytableid");//获取表格
                    var row = tb.insertRow();//添加行
                    row.innerHTML += "<td style='width:160px;height: 30px'  align='center'><input class='td1' value='"+arr[i].sb_name+"' style='width:160px;height: 45px;text-align: center' align='center'  type='text' readonly></td>";
                    row.innerHTML += "<td style='width:160px;height: 30px'  align='center'><input class='td2' value='"+arr[i].sb_number+"' style='width:160px;height: 45px;text-align: center' align='center'  type='text' readonly></td>";
                    row.innerHTML += "<td style='width:160px;height: 30px'  align='center'><input class='td3' value='"+arr[i].sb_xh+"' style='width:160px;height: 45px;text-align: center' align='center'  type='text' readonly></td>";
                    row.innerHTML += "<td style='width:160px;height: 30px'  align='center'><input class='td4' value='"+arr[i].jcx_name+"' style='width:160px;height: 45px;text-align: center' align='center'  type='text' readonly></td>";
                    row.innerHTML += "<td style='width:160px;height: 30px'  align='center'><textarea  class='td5' value='' style='width:160px;height: 45px;text-align: center'  readonly>"+arr[i].jcx_v+"</textarea></td>";
                    row.innerHTML += "<td style='width:160px;height: 30px' class='td6' align='center'>" +
                        "<select style='width:160px;height: 45px;text-align: center'>" +
                        "<option value='0'><span class='fonta'>正常</span></option>" +
                        "<option value='1'><span class='fonta'>故障</span></option>" +
                        "</select></td>";
                    row.innerHTML += "<td style='width:160px;height: 30px'  align='center'><input class='td7' value='"+user_name+"' style='width:160px;height: 45px;text-align: center'  type='text' readonly></td>";
                    row.innerHTML += "<td style='width:160px;height: 30px'  align='center'><input class='td8' style='width:160px;height: 45px;text-align: center ' type='text'></td>";
                    row.innerHTML += "<td style='width:160px;height: 30px;display: none'  align='center'><input class='td9' value='"+arr[i].jcx_id+"' style='width:160px;height: 45px;text-align: center' type='text'></td>";
                }
            }
        })*/

        /*$.ajax({
            url:'<%=request.getContextPath() %>/findDataBackup',
            type:'get',
            success:function(data){
                var arr = data.rows;
                for (var i=0;i<arr.length;i++){
                    var a = changeDateFormat(arr[i].qr_time);
                    var b = arr[i].user_name;
                    var c = arr[i].sb_name;
                    var d = arr[i].bz_nr;
                    var e = a+"     "+b+"   检查了"+c+"     "+d + "</br>";
                    $("#dataBackupShow").append(e);
                }
            }
        })*/
    // })
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
    
</script>
</html>
