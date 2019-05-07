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
<jsp:include page="../public/jscore.jsp"></jsp:include>
<body>
<img src="<%=request.getContextPath() %>/static/images/logo.png" alt=""     style="width: 60%;margin: 30px 20%;" >
<div class="rows">
    <div class="form-group">
        <div class="col-sm-5">
        </div>
        <div class="col-sm-5">
            <div class="input-group col-sm-10">
                <button onclick="fanhui()" class="btn btn-success" type="button" style="margin-left: 20px">
                    <i class="glyphicon glyphicon-hand-left">
                    </i>返回
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
        url:"<%=request.getContextPath()%>/findWeekPlan2",
        contentType : "application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        toolbar:'#toolbar',//工具栏   显示在id为toolbar的div中
        //查询参数：条件查询时使用
        queryParams:function(params){
            return{
                "offset":(this.pageNumber-1)*this.pageSize,
                "limit":this.pageSize,
            }
        },
        columns:[{
            title: '序号',
            field: '',
            formatter: function (value, row, index) {
                return index+1;
            }
        }
        ,{
            field:"z_id",
            title:"用户编号",
            visible: false,
            align:'center',
        },{
            field:"z_name",
            title:"设备名称/编号",
            align:'center',
            formatter:function(value,row,index){
                return row.z_name + "(" +row.z_bh + ")" ;
            }
        }, {
            field:"z_one",
            title:"周一",
            align:'center',
            width:200
        },{
            field:"z_two",
            title:"周二",
            align:'center',
            width:200
        },{
            field:"z_three",
            title:"周三",
            align:'center',
            width:200
        },{
            field:"z_four",
            title:"周四",
            align:'center',
            width:200
        },{
            field:"z_five",
            title:"周五",
            align:'center',
            width:200
        },{
            field:"z_six",
            title:"周六",
            align:'center',
            width:200
        },{
            field:"z_sunday",
            title:"周日",
            align:'center',
            width:200
        },{
            field:"z_remarks",
            title:"备注",
            align:'center',
            width:300
        },{
            field:"z_startdate",
            title:"开始时间",
            align:'center',
            width:200,
            //获取日期列的值进行转换
            formatter: function (value, row, index) {
                return changeDateFormat(value);
            }
        },{
            field:"z_enddate",
            title:"结束时间",
            align:'center',
            width:200,
            //获取日期列的值进行转换
            formatter: function (value, row, index) {
                return changeDateFormat(value);
            }
        }
        ],
        pagination:true,
        pageNumber:1,
        pageSize:2,
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
            var d = new Date(cellval);;
            var times=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ';
            return times;
        }
    }
    
    
    function fanhui() {
        location.href="topIndex";
    }
</script>
</html>
