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
    <title>管理者巡检个人查看</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../../../public/jscore.jsp"></jsp:include>
<body>
<img src="./static/images/logo.png" alt=""     style="width: 60%;margin: 30px 20%;" >
<div class="modal-body">
    <center>
        <button type="button" onclick="weixian()" class="btn btn-primary">危险点点检</button>
        &nbsp;
        <button type="button" onclick="glzxjClick()" class="btn btn-danger">管理者巡检</button>
        &nbsp;
        <button type="button" onclick="tpm1200Click()" class="btn btn-primary">1200-TPM点检</button>
        &nbsp;
        <button type="button" onclick="tpm650Click()" class="btn btn-primary">650-TPM点检</button>
        &nbsp;
        <button type="button" class="btn btn-primary" onclick="showfives()">5S点检</button>
        &nbsp;
        <button type="button" class="btn btn-success" onclick="returnTo()">
            <i class="glyphicon glyphicon-hand-left"> </i>
            返回
        </button>
        <div style="margin-top: 20px">
            <table id="zjRead" border="1px" style="text-align: center;font-size: 16px">
            </table>
        </div>
        <input type="hidden" id="delTextId" />
    </center>
</div>

<script type="text/javascript" >

    $("#zjRead").bootstrapTable({
        url:"<%=request.getContextPath()%>/queryZjRead",
        contentType : "application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        // toolbar:'#toolbar',//工具栏   显示在id为toolbar的div中
        //查询参数：条件查询时使用
        // queryParams:function(params){
        //
        //     return{
        //         "offset":(this.pageNumber-1)*this.pageSize,
        //         "limit":this.pageSize,
        //     }
        // },
        columns:[{
            field:"glz_id",
            title:"主键",
            visible: false,
            align:'center',
        },{
            field:"glz_name",
            title:"巡检人",
            align:'center'
        }, {
            field:"glz_data",
            title:"时间",
            align:'center',
            formatter: function (value, row, index) {
                return changeDateFormat(value);
            }
        },{
            field:"glz_count",
            title:"问题数量",
            align:'center',
        }],
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

    function returnTo() {
        location.href="<%=request.getContextPath()%>/toViewList";
    }


    //-----按钮----------S--------------------------------------------------
    function glzxjClick() {
        location.href = "<%=request.getContextPath() %>/GlzxjzjReadnew"
    }

    function weixian() {
        location.href = "<%=request.getContextPath() %>/zjRead"
    }
    function showfives(){
        location.href = "<%=request.getContextPath() %>/tockFivesRead"
    }
    function tpm1200Click() {
        location.href = "<%=request.getContextPath() %>/tozjRead1200Tpm"
    }
    function tpm650Click() {
        location.href = "<%=request.getContextPath() %>/tozjRead650Tpm"
    }
    //-----按钮----------E--------------------------------------------------
</script>
</html>
