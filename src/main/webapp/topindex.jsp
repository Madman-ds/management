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
<style>
    .hide{
        display: none;
    }
</style>
<body>
<!-- 核心样式文件 -->
<jsp:include page="jscore.jsp"></jsp:include>
<body>
<img src="<%=request.getContextPath() %>/static/images/logo.png" alt=""     style="width: 60%;margin: 30px 20%;" >
<div class="rows">
    <div class="form-group">
        <div class="col-sm-5">
        </div>
        <div class="col-sm-5">
            <div class="input-group col-sm-10">
                <button onclick="tozhou()" class="btn btn-success" type="button">
                    周生产计划
                    <i class="glyphicon glyphicon-hand-right">
                    </i>
                </button>

                <button onclick="tologin()" class="btn btn-success" type="button" style="margin-left: 20px">
                    <i class="glyphicon glyphicon-hand-left">
                    </i>日常打卡
                </button>
            </div>
        </div>
    </div>
</div>

<div id="dataShow" >
    <table id="dataBackupShows" class="table table-bordered"></table>
</div>

</body>
<script type="text/javascript">

    $("#dataBackupShows").bootstrapTable({
        url:"<%=request.getContextPath()%>/findDataBackupTop",
        contentType : "application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
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
                    } else if(value == 2){
                        return "未操作"
                    }
                    else {
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


    //转换日期格式(时间戳转换为datetime格式)
    function changeDateFormat(cellval) {
        if (cellval != null){
            var d = new Date(cellval);
            var times=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
            return times;
        }
    }
    //跳转回前端登陆页面
    function tologin() {
        location.href="<%=request.getContextPath() %>/login";
    }
    function tozhou(){
        location.href="<%=request.getContextPath() %>/topZhouJiHua";
    }

    function stateFormatter(value, row, index) {
        if (row.user_name == "admin")
            return {
                disabled : true
                //设置是否可用
                // checked : true
                //设置选中
            };
        return value;
    }
    //转换日期格式(时间戳转换为datetime格式)
    function changeDateFormat(cellval) {
        if (cellval != null){
            var d = new Date(cellval);
            var times=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ';
            return times;
        }
    }
</script>
</html>
