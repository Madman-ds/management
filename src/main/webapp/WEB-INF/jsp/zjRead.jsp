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
    <title>个人查看页面</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../../jscore.jsp"></jsp:include>
<body>
<img src="./static/images/logo.png" alt=""     style="width: 60%;margin: 30px 20%;" >
<div class="modal-body">
    <center>
        <jsp:include page="but_inculd_i.jsp"  />
        <button onclick="returnTo()" class="btn btn-danger" type="button">
            <i class="glyphicon glyphicon-hand-left">
            </i>返回
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
        url:"<%=request.getContextPath()%>/equipment/findZjRead",
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
            field:"sb_name",
            title:"名称",
            align:'center',
        },{
            field:"sb_number",
            title:"编号",
            align:'center',
        },{
            field:"jcx_name",
            title:"检查项",
            align:'center',
        }],
        pagination:true,
        pageNumber:1,
        pageSize:5,
        pageList:[5,10,15,20],
        // sidePagination:"server",
    })

    function returnTo() {
        location.href="<%=request.getContextPath()%>/toViewList";
    }
</script>
</html>
