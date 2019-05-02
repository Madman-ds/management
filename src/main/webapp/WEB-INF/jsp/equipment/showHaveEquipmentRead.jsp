<%--
  Created by IntelliJ IDEA.
  User: qinmengchao
  Date: 2019/4/27
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>查询危险点点检读权限页面</title>
</head>
<body>
<%--展示5S--%>
<div><table id="myTable3"></table></div>
</body>
<script type="text/javascript">
    //查询 表格展示
    $('#myTable3').bootstrapTable({
        url:'<%=request.getContextPath() %>/equipment/showHaveEquipmentReadList?user_id=${userId}',//获取数据地址
        method:'GET',//发送请求的方式
        contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        clickToSelect: true, //是否启用点击选中行
        columns:[
            {checkbox:true},
            {field:'e_r_id',align:'center',width:50,visible: false},
            {field:'ju_id',align:'center',width:50,visible: false},
            {field:'jcx_id',align:'center',width:50,visible: false},
            {field:'sb_id',align:'center',width:50,visible: false},
            {field:'sb_name',title:'设备',align:'center',width:450},
            {field:'sb_number',title:'编号',align:'center',width:450},
            {field:'jcx_name',title:'检查项',align:'center',width:450},
            {field:'user_name',title:'用户名',align:'center',width:450},
            {field:'cc',title:'操作',align:'center',width:350,formatter:function(value,rows,index){
                    var str="";
                    str+="<button class='btn btn-info dim' type='button' onclick='delFiveSRead(\""+rows.e_r_id+"\")' ><i class='fa fa-paste'></i>删除</button>";
                    return  str;
                }
            }
        ]
    });
    function delFiveSRead(id){
        $.ajax({
            url:'<%=request.getContextPath()%>/equipment/delEquipmentRead',
            type:'POST',
            dataType:'json',
            data:{
                "erid":id
            },
            success:function(data){
                if (data) {
                    $("#myTable3").bootstrapTable('refresh');
                }else {
                    // bootbox.alert('删除数据失败');
                }
            }
        })
    }
</script>
</html>
