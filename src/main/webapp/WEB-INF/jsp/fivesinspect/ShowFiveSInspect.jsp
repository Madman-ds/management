<%--
  Created by IntelliJ IDEA.
  User: qinmengchao
  Date: 2019/4/21
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>查询5S写权限页面</title>
</head>
<body>
    <%--展示5S--%>
    <div><table id="myTable3"></table></div>
</body>
<script type="text/javascript">
    //查询 表格展示
    $('#myTable3').bootstrapTable({
        url:'<%=request.getContextPath() %>/showUserFiveSInspect?user_id=${userId}',//获取数据地址
        method:'GET',//发送请求的方式
        contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        clickToSelect: true, //是否启用点击选中行
        columns:[
            {field:'u_f_id',align:'center',width:50,visible: false},
            {field:'f_id',align:'center',width:50,visible: false},
            {field:'f_fives',title:'5S',align:'center',width:350},
            {field:'ifextract',title:'是否提取',align:'center',width:450,formatter:function(value,rows,index){
                    var str="";
                    if(rows.ifextract == "0"){
                        str += "<button class='btn btn-info dim' type='button' onclick='upIfextract(\""+rows.u_f_id+"\",1)' ><i class='fa fa-paste'></i>提取</button>";
                        return str;
                    }else{
                        str += "<button class='btn btn-info dim' type='button' onclick='upIfextract(\""+rows.u_f_id+"\",0)' ><i class='fa fa-paste'></i>恢复</button>";
                        return str;
                    }
                }
            },
            {field:'cc',title:'操作',align:'center',width:350,formatter:function(value,rows,index){
                    var str="";
                    str+="<button class='btn btn-info dim' type='button' onclick='delUserFiveSInspect(\""+rows.u_f_id+"\")' ><i class='fa fa-paste'></i>删除</button>";
                    return  str;
                }
            }
        ]
    });
    function upIfextract(ufid,flag){
        $.ajax({
            url:'<%=request.getContextPath()%>/upIfextract',
            type:'POST',
            dataType:'text',
            data:{
                u_f_id:ufid,
                ifextract:flag
            },
            success:function(){
                BootstrapDialog.show({
                    title:"提示！",
                    message:'修改成功!'
                })
                $("#myTable3").bootstrapTable('refresh');
            },
            error: function () {
                BootstrapDialog.show({
                    title: "fuck！！",
                    message: '哇哦！系统走丢了！！'
                })
            }
        })
    }
    function delUserFiveSInspect(id){
        $.ajax({
            url:'<%=request.getContextPath()%>/delUserFiveSInspect',
            type:'POST',
            dataType:'json',
            data:{
                "ufid":id
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
