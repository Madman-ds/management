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
<jsp:include page="../../public/jscore.jsp"></jsp:include>
<body>
<img src="./static/images/logo.png" alt=""     style="width: 60%;margin: 30px 20%;" >
<button onclick="returnTo()" class="btn btn-danger" type="button">
    <i class="glyphicon glyphicon-hand-left">
    </i>返回
</button>
<table id="zjRead"></table>
</body>
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
        },{
            field:"user_name",
            title:"确认人姓名",
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
    //转换日期格式(时间戳转换为datetime格式1)
    function changeDateFormat(cellval) {
        if (cellval != null){
            var d = new Date(cellval);;
            var times=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
            return times;
        }
    }
</script>
</html>