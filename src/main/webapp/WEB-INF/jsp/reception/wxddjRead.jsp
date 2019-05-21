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
    <title>危险点点检个人查看</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../../../public/jscore.jsp"></jsp:include>
<body>
<img src="./static/images/logo.png" alt=""     style="width: 60%;margin: 30px 20%;" >
<div class="modal-body">
    <center>
        <button type="button" onclick="weixian()" class="btn btn-danger">危险点点检</button>
        &nbsp;
        <button type="button" onclick="glzxjClick()" class="btn btn-primary">管理者巡检</button>
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
    function returnTo() {
        location.href="<%=request.getContextPath()%>/toViewList";
    }
    //-----按钮----------E--------------------------------------------------
</script>
</html>