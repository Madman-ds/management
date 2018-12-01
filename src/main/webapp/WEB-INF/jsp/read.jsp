<%--
  Created by IntelliJ IDEA.
  User: 段大神经
  Date: 2018/10/24
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>热等静压安全管理系统</title>
</head>
<body>
<!-- 核心样式文件 -->
<jsp:include page="../../jscore.jsp"></jsp:include>
<body>
<img src="<%=request.getContextPath() %>/static/images/logo.png" alt=""     style="width: 60%;margin: 30px 20%;" >
<div class="rows">
    <!-- 搜索 -->
    <div class="panel-body">
        <form class="form-horizontal" id="dataBackUpForm">
            <div class="form-group">
                <label for="select_sb_name" class="col-sm-2 control-label">名称：</label>
                <div class="col-sm-2">
                    <div class="input-group">
                        <input type="text" class="form-control" id="select_sb_name" placeholder="请输入名称">
                    </div>
                </div>
                <label for="select_sb_number" class="col-sm-2 control-label">编号：</label>
                <div class="col-sm-2">
                    <div class="input-group">
                        <input type="text" class="form-control" id="select_sb_number" placeholder="请输入编号">
                    </div>
                </div>
                <label for="select_sb_xh" class="col-sm-2 control-label">属性：</label>
                <div class="col-sm-2">
                    <div class="input-group">
                        <input type="text" class="form-control" id="select_sb_xh" placeholder="请输入属性">
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
        </form>
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
                &nbsp;
                <button onclick="toviewlist()" class="btn btn-success" type="button">
                    <i class="glyphicon glyphicon-hand-left">
                    </i>返回
                </button>
            </div>
        </div>
    </div>
</div>

<div><table id="dataBackupShow" class="table table-bordered"></table></div>
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
    //条件查询
    function queryDataBackUp(){
        //点击查询，只是让表格刷新到第一页，具体查询参数，按照组装表格时候拿到的查询条件来用
        $("#dataBackupShow").bootstrapTable('refresh',{pageNumber:1});
    }
    //刷新
    function reset_table(){
        $('#dataBackUpForm')[0].reset();
        queryDataBackUp();
    }
    $("#dataBackupShow").bootstrapTable({
        url:"<%=request.getContextPath()%>/findDataBackup",
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
            }
        },
        columns:[
            {field:'sb_name',title:'名称',align:'center'},
            {field:'sb_number',title:'编号',align:'center'},
            {field:'sb_xh',title:'属性',align:'center'},
            {field:'jcx_name',title:'检查项',align:'center'},
            {field:'jc_yq',title:'检查要求',align:'center',width:10},
            {field:'jc_jg',title:'确认结果',align:'center',
                formatter:function (value,rows,index){
                    if (value == 0){
                        return "正常";
                    } else{
                        return "异常"
                    }
                }
            },
            {field:'user_name',title:'确认人',align:'center'},
            {field:'qr_time',title:'确认时间',align:'center',
                //获取日期列的值进行转换
                formatter: function (value, row, index) {
                    return changeDateFormat(value);
                }
            },
            {field:'bz_nr',title:'不符合项',align:'center'}
        ],
        pagination:true,
        pageNumber:1,
        pageSize:5,
        pageList:[2,4,6,20],
        clickToSelect: true,
        cache搜索: false,
        sidePagination:"server"
    })
    <%-- 回车搜索 --%>
    function enterSearch(){
        var event = arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异
        if (event.keyCode == 13){
            queryDataBackUp();
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
    //转换日期格式(时间戳转换为datetime格式)
    function changeDateFormat(cellval) {
        if (cellval != null){
            var d = new Date(cellval);;
            var times=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
            return times;
        }
    }
    //跳转回前端首页
    function toviewlist() {
        location.href="<%=request.getContextPath() %>/toViewList";
    }
</script>
</html>
