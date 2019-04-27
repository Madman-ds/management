<%--
  Created by IntelliJ IDEA.
  User: qinmengchao
  Date: 2019/4/24
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>5S读权限管理</title>
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
    <button onclick="showUserFiveSInspect()" class="btn btn-info"  type="button">
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
        url:'<%=request.getContextPath() %>/showFiveSReadList',//获取数据地址
        method:'GET',//发送请求的方式
        contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        clickToSelect: true, //是否启用点击选中行
        columns:[
            {checkbox:true},
            {field:'f_id',align:'center',width:50,visible: false},
            {field:'u_f_id',align:'center',width:50,visible: false},
            {field:'f_fives',title:'5S',align:'center',width:450},
            {field:'f_clazzify',title:'分类',align:'center',width:450},
            {field:'f_content',title:'内容',align:'center',width:450}
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
            var ids = "";
            var fivess = "";
            var ufid = "";
            for (var i = 0;i < rows.length;i++){
                ids += ids == ""?rows[i].f_id:","+rows[i].f_id;
                fivess += fivess == ""?rows[i].f_fives:","+rows[i].f_fives;
                ufid += ufid == ""?rows[i].u_f_id:","+rows[i].u_f_id
            }
            $.ajax({
                url:'<%=request.getContextPath() %>/insertReadFive',
                type:'post',
                data:{
                    "ids":ids,"userId":userId,"ufid":ufid
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
</script>
</html>
