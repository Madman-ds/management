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
    <title>查询5S读权限页面</title>
</head>
<body>
<%--展示5S--%>
<div><table id="myTable3"></table></div>
</body>
<script type="text/javascript">
    //查询 表格展示
    $('#myTable3').bootstrapTable({
        url:'<%=request.getContextPath() %>/showHaveFiveSReadList?user_id=${userId}',//获取数据地址
        method:'GET',//发送请求的方式
        contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        clickToSelect: true, //是否启用点击选中行
        columns:[
            {field:'u_f_id',align:'center',width:50,visible: false},
            {field:'r_id',align:'center',width:50,visible: false},
            {field:'f_id',align:'center',width:50,visible: false},
            {field:'f_fives',title:'5S',align:'center',width:350},
            {field:'user_name',title:'检查人',align:'center',width:350},
            {field:'cc',title:'操作',align:'center',width:350,formatter:function(value,rows,index){
                    var str="";
                    str+="<button class='btn btn-info dim' type='button' onclick='delFiveSRead(\""+rows.r_id+"\")' ><i class='fa fa-paste'></i>删除</button>";
                    return  str;
                }
            }
        ]
    });
    function delFiveSRead(id){
        $.ajax({
            url:'<%=request.getContextPath()%>/delFiveSRead',
            type:'POST',
            dataType:'json',
            data:{
                "rid":id
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
