<%--
  Created by IntelliJ IDEA.
  User: qinmengchao
  Date: 2019/4/18
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TPM读操作管理</title>
</head>
<jsp:include page="../../../public/jscore.jsp"></jsp:include>
<body>
    人员: <select  class="form-control" id="user_id" name="user_id">
        <option value = "0">--请选择--</option>
    </select>
    <div id="toolBar">
        <button onclick="addTPM()" class="btn btn-success"  type="button">
            <i class="glyphicon glyphicon-plus"></i>
            读操作授权
        </button>
        <button onclick="showTPM()" class="btn btn-info"  type="button">
            <i class="glyphicon glyphicon-pushpin"></i>
            查看读操作权限
        </button>
    </div>
    <%--展示TPM--%>
    <div id="myTable"></div>
</body>
<script type="text/javascript">
    //查询 表格展示
    $('#myTable').bootstrapTable({
        url:'<%=request.getContextPath() %>/findDuTpmList',//获取数据地址
        pagination:true, //是否展示分页
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
            {
                checkbox:true,
            },
            {
                field:"id",
                title:"tpm编号",
                visible: false,
                align:'center',
                width:50
            },
            {
                field:"name",
                title:"TPM名称",
                align:'center',
                width:200
            },
            {
                field:"tpm_xh",
                title:"型号",
                align:'center',
                width:200
            },
            {
                field:"tpm_bh",
                title:"编号",
                align:'center',
                width:200
            },
            {
                field:"tpm_whbh",
                title:"维护编号",
                align:'center',
                width:300
            },
            {
                field:"tpm_djxm",
                title:"点检项目",
                align:'center',
                width:300
            },
            {
                field:"tpm_yq",
                title:"数据/要求",
                align:'center',
                width:300
            },
            {
                field:"tpm_name",
                title:"点检人",
                align:'center',
                width:300
            }
        ]
    });
    $(function (){
        $.ajax({
            url:'<%=request.getContextPath() %>/getNotCurrentUserList',
            async:'false',
            type:'get',
            dataType:'json',
            success:function(data){
                for (var i = 0;i < data.length;i++){
                    $("#user_id").append("<option value = '"+data[i].user_id+"'>"+data[i].user_name+"</option>")
                }
            },
            error:function(){
                BootstrapDialog.show({
                    title:"fuck！！",
                    message:'哇哦！系统走丢了！！'
                })
            }
        })
    })
    function addTPM(){
       var rows = $('#myTable').bootstrapTable('getSelections');
        var userId = $("#user_id").val();
        console.log(userId)
        if(rows.length <= 0){
           BootstrapDialog.show({
               title:"提示！",
               message:'请至少选择一条数据'
           })
        }else if(userId == "0"&&userId==0){
            BootstrapDialog.show({
                title:"提示！",
                message:'请选择人员!'
            })
        }else{
           var ids = "";
           var fivess = "";
           for (var i = 0;i < rows.length;i++){
               ids += ids == ""?rows[i].id:","+rows[i].id;
           }
           $.ajax({
               url:'<%=request.getContextPath() %>/insertReadtpm',
               type:'post',
               data:{
                   "ids":ids,"userId":userId
               },
               dateType:'json',
               success:function(data){
                   alert("添加成功!");
                    $("#myTable").bootstrapTable("refresh")
               }
           })
        }
    }
    function showTPM(){
        var userId = $("#user_id").val();
        if(userId == "0"&&userId==0){
            BootstrapDialog.show({
                title:"提示！",
                message:'请选择人员!'
            })
        }else{
            BootstrapDialog.show({
                title:"查询TPM读权限",
                closable: false,
                message:$('<div><div>').load('<%=request.getContextPath()%>/toQueryReadtpm?userId='+userId),
                buttons:[{
                    label:"关闭",
                    cssClass:'btn-warning',
                    action:function(data){
                        data.close();
                        window.location.reload();
                    }
                }]
            })
          }
    }
</script>
</html>
