<%--
  Created by IntelliJ IDEA.
  User: qinmengchao
  Date: 2019/4/28
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>5S点检</title>
</head>
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
    <%--<div class="modal-body">
        <center>
            <jsp:include page="but_inculd_m.jsp"  />
            <button type="button" onclick="tozhou()" class="btn btn-primary">周生产计划</button>
            &nbsp;
            <button type="button" onclick="tologin()" class="btn btn-primary">日常打卡</button>
            &nbsp;
        </center>
    </div>--%>

    <div style="margin-top: 20px">
        <table id="dataBackupShows" class="table table-bordered"></table>
    </div>
</body>
<script type="text/javascript">
    //查询 表格展示
    $('#dataBackupShows').bootstrapTable({
        toolbar:'#toolbar',
        url:'<%=request.getContextPath() %>/findFiveSInspectLogqt',//获取数据地址
        pagination:false, //是否展示分页
        pageList:[5, 10, 20, 50],//分页组件
        pageNumber:1,
        pageSize:5,//默认每页条数
        //search:true,//是否显示搜索框
        //searchText:'试试',//初始化搜索文字
        method:'GET',//发送请求的方式
        contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        // showColumns:false,//是否显示 内容列下拉框
        // showToggle:false,//是否显示 切换试图（table/card）按钮
        // showPaginationSwitch:false,//是否显示 数据条数选择框
        // showRefresh:false,//是否显示刷新按钮
        // detailView:false,//设置为 true 可以显示详细页面模式。
        // showFooter:false,//是否显示列脚
        clickToSelect: true, //是否启用点击选中行
        sidePagination:'server',//分页方式：client客户端分页，server服务端分页（*
        striped:true,
        queryParams:function(){
//	 		return 的数据 是传递到  action类中的参数
            return {
                page:this.pageNumber,//当前页
                rows:this.pageSize //每页条数
            }
        },
        columns:[
            {field:'f_id',align:'center',width:50,visible: false},
            {field:'f_fives',title:'5S',align:'center',width:450},
            {field:'f_clazzify',title:'分类',align:'center',width:450},
            {field:'f_content',title:'内容',align:'center',width:450},
            {field:'f_inspectuser',title:'检查人',align:'center',width:450},
            {field:'f_inspectdate',title:'检查时间',align:'center',width:450,
                //获取日期列的值进行转换
                formatter: function (value, row, index) {
                    return changeDateFormat(value);
                }},
            {field:'f_ifmeet',title:'是否满意',align:'center',width:450,formatter:function(value,rows,index){
                    var str="";
                    if(value == 0){
                        str += "不满意";
                        return str;
                    }else if(value == 1){
                        str += "满意";
                        return str;
                    }else{
                        str += "";
                        return str;
                    }
                }}
        ]
    });
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
            var d = new Date(cellval);
            var times=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ';
            return times;
        }
    }

    function fanhui() {
        location.href="topIndex";
    }

</script>
</html>
