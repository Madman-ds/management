<%--
  Created by IntelliJ IDEA.
  User: 段大神经
  Date: 2018/9/27
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>仪表台账页面</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../public/jscore.jsp"></jsp:include>
<body>
<img src="<%=request.getContextPath() %>/static/images/logo.png" alt=""     style="width: 60%;margin: 30px 20%;" >
<center>
    <%--<jsp:include page="../public/but_inculd_m.jsp"  />--%>
        <button type="button" onclick="topIndex()" class="btn btn-primary">危险点点检</button>
        &nbsp;
        <button type="button" onclick="glzxjClick()" class="btn btn-primary">管理者巡检</button>
        &nbsp;
        <button type="button" onclick="yibiaoTaiZheng()" class="btn btn-danger">仪表台账</button>
        &nbsp;
        <button type="button" onclick="tpm1200()" class="btn btn-primary">1200-TPM点检</button>
        &nbsp;
        <button type="button" onclick="tpm650()" class="btn btn-primary">650-TPM点检</button>
        &nbsp;
        <button type="button" class="btn btn-primary" onclick="showfives()">5S点检</button>
        &nbsp;
        <button type="button" onclick="tozhou()" class="btn btn-primary">周生产计划</button>
        &nbsp;
        <button type="button" onclick="tologin()" class="btn btn-primary">
            <i class="glyphicon glyphicon-user"></i>
            日常打卡
        </button>
        &nbsp;
    <div style="margin-top: 20px">
        <table id="dataBackupShows" class="table table-bordered"></table>
    </div>
</center>
</body>
<script type="text/javascript" >
    //条件查询
    function uerSearch(){
        //点击查询，只是让表格刷新到第一页，具体查询参数，按照组装表格时候拿到的查询条件来用
        $("#dataBackupShows").bootstrapTable('refresh',{pageNumber:1});
    }
    <%-- 回车搜索 --%>
    function enterSearch(){
        var event = arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异
        if (event.keyCode == 13){
            queryDataBackUp();
        }
    }
    //重置
    function resetUserForm(){
        $('#searchUserForm')[0].reset();
        uerSearch();
    }
    $("#dataBackupShows").bootstrapTable({
        url:"<%=request.getContextPath()%>/findYbtz",
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
            checkbox:true,
            formatter:stateFormatter
        },{
            field:"ybtz_id",
            title:"主键",
            visible: false,
            align:'center',
        },{
            field:"ybtz_name",
            title:"名称",
            align:'center'
        },{
            field:"ybtz_bh",
            title:"编号",
            align:'center'
        },{
            field:"ybtz_mpa",
            title:"压力/mpa",
            align:'center'
        },{
            field:"ybtz_type",
            title:"类别",
            align:'center'
        },{
            field:"ybtz_wz",
            title:"位置",
            align:'center'
        }, {
            field:"ybtz_date",
            title:"时间",
            align:'center',
            formatter: function (value, row, index) {
                return changeDateFormat(value);
            }
        },{
            field:"ybtz_remarks",
            title:"备注",
            align:'center',
        }
        ],
        pagination:true,
        pageNumber:1,
        pageSize:5,
        pageList:[5,10,15,20],
        clickToSelect: true,
        cache搜索: false,
        sidePagination:"server"
    })
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



    //按钮----------------------S---------------------------------------
    //管理者巡检
    function glzxjClick() {
        location.href = "<%=request.getContextPath() %>/toTopGlzxjm"
    }
    //危险点点检
    function topIndex() {
        location.href = "<%=request.getContextPath() %>/topIndex"
    }

    function yibiaoTaiZheng() {
        location.href = "<%=request.getContextPath() %>/topyibiaoTaiZheng"
    }

    function showfives(){
        location.href = "<%=request.getContextPath() %>/toTopFiveBytq"
    }

    function tpm1200(){
        location.href = "<%=request.getContextPath() %>/toTop1200Tpm"
    }

    function tpm650(){
        location.href = "<%=request.getContextPath() %>/toTop650Tpm"
    }
    //跳转回前端登陆页面
    function tologin() {
        location.href="<%=request.getContextPath() %>/login";
    }
    function tozhou(){
        location.href="<%=request.getContextPath() %>/topZhouJiHua";
    }
    //按钮----------------------E---------------------------------------
</script>
</html>
