<%--
  Created by IntelliJ IDEA.
  User: qinmengchao
  Date: 2019/4/30
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>危险点点检读权限管理页面</title>
</head>
<jsp:include page="../../../jscore.jsp"></jsp:include>
<body>
人员: <select  class="form-control" id="user_id" name="user_id">
    <option value = "0">--请选择--</option>
</select>
<div id="toolBar">
    <button onclick="addUserFiveSInspect()" class="btn btn-success"  type="button">
        <i class="glyphicon glyphicon-plus"></i>
        读操作授权
    </button>
    <button onclick="showHaveFiveSRead()" class="btn btn-info"  type="button">
        <i class="glyphicon glyphicon-pushpin"></i>
        查看读操作权限
    </button>
    <%--展示5S--%>
    <div id="myTable"></div>
</div>
</body>
<script type="text/javascript">
    //查询 表格展示
    $('#myTable').bootstrapTable({
        url:'<%=request.getContextPath() %>/equipment/showEquipmentReadList',//获取数据地址
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
            {checkbox:true},
            {field:'ju_id',align:'center',width:50,visible: false},
            {field:'jcx_id',align:'center',width:50,visible: false},
            {field:'sb_id',align:'center',width:50,visible: false},
            {field:'sb_name',title:'设备',align:'center',width:450},
            {field:'sb_number',title:'编号',align:'center',width:450},
            {field:'jcx_name',title:'检查项',align:'center',width:450},
            {field:'user_name',title:'用户名',align:'center',width:450}
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
    function addUserFiveSInspect(){
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
            var juid = "";
            var jcxid = "";
            var sbid = "";
            var sbname = "";
            var sbnumber = "";
            var jcxname = "";
            var username = "";
            for (var i = 0;i < rows.length;i++){
                juid += juid == ""?rows[i].ju_id:","+rows[i].ju_id;
                jcxid += jcxid == ""?rows[i].jcx_id:","+rows[i].jcx_id;
                sbid += sbid == ""?rows[i].sb_id:","+rows[i].sb_id;
                sbname += sbname == ""?rows[i].sb_name:","+rows[i].sb_name;
                sbnumber += sbnumber == ""?rows[i].sb_number:","+rows[i].sb_number;
                jcxname += jcxname == ""?rows[i].jcx_name:","+rows[i].jcx_name;
                username += username == ""?rows[i].user_name:","+rows[i].user_name;
            }
            $.ajax({
                url:'<%=request.getContextPath() %>/equipment/insertEquipmentRead',
                type:'post',
                data:{
                    "juid":juid,"jcxid":jcxid,"sbid":sbid,"sbname":sbname,"sbnumber":sbnumber,"jcxname":jcxname,"userid":userId,"username":username
                },
                dateType:'json',
                success:function(data){
                    BootstrapDialog.show({
                        title:"提示！",
                        message:'添加成功!'
                    })
                    $("#myTable").bootstrapTable("refresh")
                }
            })
        }
    }
    function showHaveFiveSRead(){
        var userId = $("#user_id").val();
        if(userId == "0"&&userId==0){
            BootstrapDialog.show({
                title:"提示！",
                message:'请选择人员!'
            })
        }else{
            BootstrapDialog.show({
                title:"查询5S读权限",
                closable: false,
                message:$('<div><div>').load('<%=request.getContextPath()%>/toShowHaveEquipmentRead?userId='+userId),
                buttons:[{
                    label:"关闭",
                    cssClass:'btn-warning',
                    action:function(data){
                        data.close();
                    }
                }]
            })
        }
    }
</script>
</html>
