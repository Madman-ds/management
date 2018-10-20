<%@ page import="com.ds.serverlogin.pojo.LoginUser" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/9/29
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    LoginUser user = (LoginUser)request.getSession().getAttribute("loginUser");
    String user_name = user.getUser_name();
%>

<html>
<head>
    <title>前端展示页面</title>
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
    </style>
    <jsp:include page="../../jscore.jsp"></jsp:include>
</head>
<body>
<img src="./static/images/logo.png" alt=""     style="width: 60%;margin: 30px 20%;" >
<div class="rows">
    <!-- 搜索 -->
    <div class="panel-body">
        <form class="form-horizontal" id="dataBackUpForm">
            <div class="form-group">
                <label for="select_sb_name" class="col-sm-2 control-label">设备名称：</label>
                <div class="col-sm-2">
                    <div class="input-group">
                        <input type="text" class="form-control" id="select_sb_name" placeholder="请输入设备名称">
                    </div>
                </div>
                <label for="select_sb_number" class="col-sm-2 control-label">设备编号：</label>
                <div class="col-sm-2">
                    <div class="input-group">
                        <input type="text" class="form-control" id="select_sb_number" placeholder="请输入设备编号">
                    </div>
                </div>
                <label for="select_sb_xh" class="col-sm-2 control-label">设备型号：</label>
                <div class="col-sm-2">
                    <div class="input-group">
                        <input type="text" class="form-control" id="select_sb_xh" placeholder="请输入设备型号">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="select_user_name" class="col-sm-2 control-label">确认人：</label>
                <div class="col-sm-2">
                    <div class="input-group">
                        <input type="text" class="form-control" id="select_user_name" placeholder="请输入确认人">
                    </div>
                </div>
                <label  class="col-sm-2 control-label">确认时间：</label>
                <div class="col-sm-5">
                    <div class="input-group col-sm-10">
                        <input  name="startDate" id="datetimepicker" class="form-control" placeholder="开始时间">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        <input  name="endDate" id="datetimeend" class="form-control" placeholder="结束时间">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-5">
                </div>
                <div class="col-sm-5">
                    <div class="input-group col-sm-10">
                        <button onclick="queryDataBackUp()" class="btn btn-primary" type="button">
                            <i class="glyphicon glyphicon-search">
                            </i>搜索
                        </button>
                        &nbsp;
                        <button onclick="reset_table()" class="btn btn-danger" type="button">
                            <i class="glyphicon glyphicon-repeat">
                            </i>重置
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>

</div>
<div class="modal-body">
    <center>
        <%--<table border="1px">
            <tr style="height: 30px">
                <td style="width:160px;" align="center">设备名称</td>
                <td style="width:160px" align="center">设备编号</td>
                <td style="width:160px" align="center">设备型号</td>
                <td style="width:160px" align="center">检查项</td>
                <td style="width:160px" align="center">检查要求</td>
                <td style="width:160px" align="center">检查结果</td>
                <td style="width:160px" align="center">确认人</td>
                <td style="width:160px;" align="center">备注</td>
            </tr>
        </table>--%>
        <table id="mytableid" border="1px">

        </table>
        <input type="hidden" id="delTextId" />
    </center>
</div>
<div id="dataBackupShow" style="margin-left: 17%;font-size: x-large">

</div>
<input id="user_name" type="hidden" value="<%=user_name%>" />
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
        location.href = "logout";
    }


    //条件查询
    function queryDataBackUp(){
        $('#dataBackupShow').html("");
        var sb_name= $('#select_sb_name').val();
        var sb_number = $('#select_sb_number').val();
        var sb_xh = $('#select_sb_xh').val();
        var user_name = $('#select_user_name').val();
        var start_time = $('#datetimepicker').val();
        var end_time = $('#datetimeend').val();
        $.ajax({
            url:'<%=request.getContextPath() %>/findDataBackup',
            type:'get',
            data:{
                sb_name:sb_name,
                sb_number:sb_number,
                sb_xh:sb_xh,
                user_name:user_name,
                start_time:start_time,
                end_time:end_time
                // offset:(this.pageNumber-1)*this.pageSize,
                // limit:this.pageSize
            },
            dataType:"json",
            success:function(data){
                var arr = data.rows;
                for (var i=0;i<arr.length;i++){
                    var a = changeDateFormat(arr[i].qr_time);
                    var b = arr[i].user_name;
                    var c = arr[i].sb_name;
                    var d = arr[i].bz_nr;
                    var e = a+"     "+b+"     :"+c+"     "+d;
                    $("#dataBackupShow").append(e).append(" \\n");
                }
            }
        })
    }
    //刷新
    function reset_table(){
        $('#dataBackUpForm')[0].reset();
        queryDataBackUp();
        // var numArr1 = []; // 定义一个空数组
        // var numArr2 = [];
        // var numArr3 = [];
        // var numArr4 = [];
        // var numArr5 = [];
        // var numArr6 = [];
        // var numArr7 = [];
        // var numArr8 = [];
        // var txt1 = $('#mytableid').find('.td1'); // 获取所有文本框
        // var txt2 = $('#mytableid').find('.td2'); // 获取所有文本框
        // var txt3 = $('#mytableid').find('.td3'); // 获取所有文本框
        // var txt4 = $('#mytableid').find('.td4'); // 获取所有文本框
        // var txt5 = $('#mytableid').find('.td5'); // 获取所有文本框
        // var txt6 = $('#mytableid').find('.td6'); // 获取所有文本框
        // var txt7 = $('#mytableid').find('.td7'); // 获取所有文本框
        // var txt8 = $('#mytableid').find('.td8'); // 获取所有文本框
        // for (var i = 0; i < txt1.length; i++) {
        //     numArr1.push(txt1.eq(i).val()); // 将文本框的值添加到数组中
        //     numArr2.push(txt2.eq(i).val());
        //     numArr3.push(txt3.eq(i).val());
        //     numArr4.push(txt4.eq(i).val());
        //     numArr5.push(txt5.eq(i).val());
        //     numArr6.push(txt6.eq(i).val());
        //     numArr7.push(txt7.eq(i).val());
        //     numArr8.push(txt8.eq(i).val());
        // }
        // var numArr1 = JSON.stringify(numArr1);
        // var numArr2 = JSON.stringify(numArr2);
        // var numArr3 = JSON.stringify(numArr3);
        // var numArr4 = JSON.stringify(numArr4);
        // var numArr5 = JSON.stringify(numArr5);
        // var numArr6 = JSON.stringify(numArr6);
        // var numArr7 = JSON.stringify(numArr7);
        // var numArr8 = JSON.stringify(numArr8);
        // console.log(numArr1);
        // console.log(numArr2);
        // console.log(numArr3);
        // console.log(numArr4);
        // console.log(numArr5);
        // console.log(numArr6);
        // console.log(numArr7);
        // console.log(numArr8);
    }

    $(function () {
            var user_name =$("#user_name").val();
            $.ajax({
            url:'<%=request.getContextPath() %>/equipment/findEquipmentInspectionitem',
            type:'get',
            success:function(data){
                var tbs = document.getElementById("mytableid");//获取表格
                var rows = tbs.insertRow();//添加行
                rows.innerHTML += "<td style='width:160px;height: 30px' align='center'>设备名称</td>";
                rows.innerHTML += "<td style='width:160px;height: 30px' align='center'>设备编号</td>";
                rows.innerHTML += "<td style='width:160px;height: 30px' align='center'>设备型号</td>";
                rows.innerHTML += "<td style='width:160px;height: 30px' align='center'>检查项</td>";
                rows.innerHTML += "<td style='width:160px;height: 30px' align='center'>检查要求</td>";
                rows.innerHTML += "<td style='width:160px;height: 30px' align='center'>检查结果</td>";
                rows.innerHTML += "<td style='width:160px;height: 30px' align='center'>确认人</td>";
                rows.innerHTML += "<td style='width:160px;height: 30px' align='center'>备注</td>";
                var arr = data;
                for (var i=0;i<arr.length;i++){
                    console.log(arr[i]);
                    var tb = document.getElementById("mytableid");//获取表格
                    var row = tb.insertRow();//添加行
                    // row.innerHTML += "<td style='width:160px;height: 30px' class='td1' align='center'><span>"+arr[i].sb_name+"</span></td>";
                    row.innerHTML += "<td style='width:160px;height: 30px'  align='center'><input class='td1' value='"+arr[i].sb_name+"' style='width:160px;height: 30px' align='center'  type='text'></td>";
                    row.innerHTML += "<td style='width:160px;height: 30px'  align='center'><input class='td2' value='"+arr[i].sb_number+"' style='width:160px;height: 30px' align='center'  type='text'></td>";
                    row.innerHTML += "<td style='width:160px;height: 30px'  align='center'><input class='td3' value='"+arr[i].sb_xh+"' style='width:160px;height: 30px' align='center'  type='text'></td>";
                    row.innerHTML += "<td style='width:160px;height: 30px'  align='center'><input class='td4' value='"+arr[i].jcx_name+"' style='width:160px;height: 30px' align='center'  type='text'></td>";
                    row.innerHTML += "<td style='width:160px;height: 30px'  align='center'><input class='td5' value='"+arr[i].jcx_v+"' style='width:160px;height: 30px' align='center' type='text'></td>";
                    row.innerHTML += "<td style='width:160px;height: 30px' class='td6' align='center'>" +
                        "<select style='width:160px;height: 30px'>" +
                        "<option value='1'><span class='fonta'>正常</span></option>" +
                        "<option value='2'><span class='fonta'>故障</span></option>" +
                        "</select></td>";
                    row.innerHTML += "<td style='width:160px;height: 30px'  align='center'><input class='td7' value='"+user_name+"' style='width:160px;height: 30px' align='center' type='text'></td>";
                    row.innerHTML += "<td style='width:160px;height: 30px'  align='center'><input class='td8' style='width:160px;height: 30px' align='center' type='text'></td>";
                }
            }
        })

        $.ajax({
            url:'<%=request.getContextPath() %>/findDataBackup',
            type:'get',
            success:function(data){
                var arr = data.rows;
                for (var i=0;i<arr.length;i++){
                    var a = changeDateFormat(arr[i].qr_time);
                    var b = arr[i].user_name;
                    var c = arr[i].sb_name;
                    var d = arr[i].bz_nr;
                    var e = a+"     "+b+"     :"+c+"     "+d ;
                    $("#dataBackupShow").append(e);
                }
            }
        })
    })

    /*$("#dataBackupShow").bootstrapTable({
        <%--url:"<%=request.getContextPath()%>/findDataBackup",--%>
        contentType : "application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        toolbar:'#toolbar',//工具栏   显示在id为toolbar的div中
        //查询参数：条件查询时使用
        queryParams:function(params){
            var sb_name= $('#select_sb_name').val();
            var sb_number = $('#select_sb_number').val();
            var sb_xh = $('#select_sb_xh').val();
            var user_name = $('#select_user_name').val();
            var start_time = $('#datetimepicker').val();
            var end_time = $('#datetimeend').val();
            return{
                "sb_name":sb_name,
                "sb_number":sb_number,
                "sb_xh":sb_xh,
                "user_name":user_name,
                "start_time":start_time,
                "end_time":end_time,
                "offset":(this.pageNumber-1)*this.pageSize,
                "limit":this.pageSize,
// 				"offset":params.offset,
// 	       		"limit":params.limit
            }
        },
        columns:[
            {field:'sb_name',align:'center'},
            {field:'sb_number',align:'center'},
            {field:'sb_xh',align:'center'},
            {field:'jcx_name',align:'center'},
            {field:'jc_yq',align:'center'},
            {field:'jc_jg',align:'center',
                formatter:function (value,rows,index){
                    if (value == 0){
                        return "正常";
                    } else{
                        return "异常"
                    }
                }
            },
            {field:'user_name',align:'center'},
            {field:'qr_time',align:'center',
                //获取日期列的值进行转换
                formatter: function (value, row, index) {
                    return changeDateFormat(value);
                }
            },
            {field:'bz_nr',align:'center'}
        ],
        pagination:true,
        pageNumber:1,
        pageSize:5,
        pageList:[2,4,6,20],
        clickToSelect: true,
        cache搜索: false,
        sidePagination:"server"
    })*/

    //转换日期格式(时间戳转换为datetime格式)
    function changeDateFormat(cellval) {
        if (cellval != null){
            var d = new Date(cellval);;
            var times=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' ;
            return times;
        }
    }
</script>
</html>
