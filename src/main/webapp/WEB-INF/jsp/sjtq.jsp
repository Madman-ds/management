<%--
Created by IntelliJ IDEA.
User: 段大神经
Date: 2018/9/27
Time: 21:15
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<!-- 引入js核心文件 -->
<jsp:include page="../../jscore.jsp"></jsp:include>
<body>
<table id="userList"></table>
</body>
<script type="text/javascript" >
    //条件查询
    function uerSearch(){
        //点击查询，只是让表格刷新到第一页，具体查询参数，按照组装表格时候拿到的查询条件来用
        $("#userList").bootstrapTable('refresh',{pageNumber:1});
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
    $("#userList").bootstrapTable({
        url:"<%=request.getContextPath()%>/findDataTiQu",
        contentType : "application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        toolbar:'#toolbar',//工具栏   显示在id为toolbar的div中
        //查询参数：条件查询时使用
        queryParams:function(params){

            var user_name = $("#user_name").val();
            var user_kh = $("#user_kh").val();

            return{
                // "user_name":user_name,
                // "user_kh":user_kh,
                "offset":(this.pageNumber-1)*this.pageSize,
                "limit":this.pageSize,
            }
        },
        columns:[{
            checkbox:true,
            // formatter:stateFormatter
        },{
            field:"ju_id",
            title:"检查项用户关联主键ID",
            visible: false,
            align:'center',
            width:50
        },{
            field:"user_id",
            title:"用户编号",
            visible: false,
            align:'center',
            width:50
        },{
            field:"user_name",
            title:"用户名",
            align:'center',
            width:200
        },{
            field:"jcx_name",
            title:"检查项名称",
            align:'center',
            width:200
        },
        {
            field:"jcx_Id",
            title:"检查项id",
            align:'center',
            visible: false,
            width:300
        },{
            field:"sb_name",
            title:"设备名称",
            align:'center',
            width:200
        },
        {
            field:"sb_id",
            title:"设备id",
            align:'center',
            visible: false,
            width:300
        },{field:'cc',title:'操作',align:'center',width:350,formatter:function(value,rows,index){
                var str="";
                if(rows.top == 1){
                    str+="<button class='btn btn-info dim' type='button' onclick='updateTs(\""+rows.ju_id+"\",\""+2+"\",\""+rows.jcx_Id+"\")' ><i class='fa fa-paste'></i>提取</button>  ";
                }else {
                    str+="<button class='btn btn-info dim' type='button' onclick='updateTs(\""+rows.ju_id+"\",\""+1+"\",\""+rows.jcx_Id+"\",\""+rows.user_name+"\")' ><i class='fa fa-paste'></i>还原</button>";
                }
                return  str;
            }
        }],
        pagination:true,
        pageNumber:1,
        pageSize:5,
        pageList:[2,4,6,20],
        clickToSelect: true,
        cache搜索: false,
        sidePagination:"server"
    })

    function updateT(id,type){
        $.ajax({
            url:'<%=request.getContextPath() %>/updateT',
            type:'get',
            data:{
                id:id,
                type:type
            },
            dataType:'json',
            success:function(data){
                if (data>0) {
                    $("#userList").bootstrapTable('refresh',{pageNumber:1});
                }

            }
        })
    }
    function updateTs(id,type,jcx_id,user_name){
        $.ajax({
            url:'<%=request.getContextPath() %>/updateTs',
            type:'get',
            data:{
                id:id,
                type:type,
                jcx_id:jcx_id,
                user_name:user_name
            },
            dataType:'json',
            success:function(data){
                if (data>0) {
                    $("#userList").bootstrapTable('refresh',{pageNumber:1});
                }

            }
        })
    }
</script>
</html>