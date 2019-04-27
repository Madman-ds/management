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
    <title>提取管理页面</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../../../jscore.jsp"></jsp:include>
<body>

<table id="userListTiQu"></table>
</body>
<script type="text/javascript" >
    //条件查询
    function uerSearch(){
        //点击查询，只是让表格刷新到第一页，具体查询参数，按照组装表格时候拿到的查询条件来用
        $("#userListTiQu").bootstrapTable('refresh',{pageNumber:1});
    }
    $("#userListTiQu").bootstrapTable({
        url:"<%=request.getContextPath()%>/findAllUser",
        contentType : "application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        //查询参数：条件查询时使用
        queryParams:function(params){

            var user_name = $("#user_name").val();
            var user_kh = $("#user_kh").val();

            return{
                "user_name":user_name,
                "user_kh":user_kh,
                "offset":(this.pageNumber-1)*this.pageSize,
                "limit":this.pageSize,
            }
        },
        columns:[{
            checkbox:true,
            formatter:stateFormatter
        },{
            field:"user_id",
            title:"用户编号",
            visible: false,
            align:'center',
            width:50
        },{
            field:"user_name",
            title:"用户姓名",
            align:'center',
            width:50
        },{
            field:"is_management",
            title:"提取",
            align:'center',
            width:200,
            formatter: function (value, rows, index) {
                var str ="";
                if(rows.top =="1"){
                    str = "<button class='btn btn-info dim' type='button' onclick='huanyuan(\""+rows.user_id+"\")' ><i class='fa fa-paste'></i>还原</button>"+"  ";
                }else{
                    str = "<button class='btn btn-info dim' type='button' onclick='tiqu(\""+rows.user_id+"\")' ><i class='fa fa-paste'></i>提取</button>"+"  ";
                }
                return str;
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


    function huanyuan(id){
        $.ajax({
            url:"<%=request.getContextPath()%>/huanyuanUser",
            data:{
                'id':id
            },
            dataType:"text",
            type:"post",
            success:function(){
                $("#userListTiQu").bootstrapTable('refresh',{pageNumber:1});
            },
            error:function(){
                BootstrapDialog.show({
                    title:"fuck！！",
                    message:'哇哦！系统走丢了！！'
                })
            }
        })
    }

    function tiqu(id){
        $.ajax({
            url:"<%=request.getContextPath()%>/tiquUser",
            data:{
                'id':id
            },
            dataType:"text",
            type:"post",
            success:function(){
                $("#userListTiQu").bootstrapTable('refresh',{pageNumber:1});
            },
            error:function(){
                BootstrapDialog.show({
                    title:"fuck！！",
                    message:'哇哦！系统走丢了！！'
                })
            }
        })
    }

</script>
</html>
