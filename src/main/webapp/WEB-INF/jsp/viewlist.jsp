<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/9/29
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<div id="dataBackupShow" style="margin-left: 13%;font-size: x-large">

</div>
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
    }
    $(function () {
        $.ajax({
            url:'<%=request.getContextPath() %>/findDataBackup',
            type:'get',
            success:function(data){
                var arr = data.rows;
                for (var i=0;i<arr.length;i++){
                    console.log(arr[i]);
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
