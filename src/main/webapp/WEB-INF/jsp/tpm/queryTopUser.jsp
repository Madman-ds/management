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
    <title>查询TPM写权限</title>
</head>
<jsp:include page="../../../public/jscore.jsp"></jsp:include>
<body>

<%--TPM--%>
    <table id="myTable3" style="width: 1000px"></table>

</body>
<script type="text/javascript" src="<%=request.getContextPath() %>/static/js/bootStrap-select/multiple-select.js"></script>
<script type="text/javascript">

    //查询 表格展示
    $('#myTable3').bootstrapTable({
        url:'<%=request.getContextPath() %>/showTpmUser?user_id=${userId}',//获取数据地址
        method:'GET',//发送请求的方式
        contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        clickToSelect: true, //是否启用点击选中行
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
                field:"tpm.name",
                title:"名称",
                align:'center',
                width:200
            },
            {
                field:"tpm.tpm_xh",
                title:"型号",
                align:'center',
                width:200
            },
            {
                field:"tpm.tpm_bh",
                title:"编号",
                align:'center',
                width:200
            },
            {
                field:"tpm.tpm_whbh",
                title:"维护编号",
                align:'center',
                width:300
            },
            {
                field:"tpm.tpm_djxm",
                title:"点检项目",
                align:'center',
                width:300
            },
            {
                field:"tpm.tpm_yq",
                title:"数据/要求",
                align:'center',
                width:300
            },
            {field:'',title:'是否提取',align:'center',width:450,formatter:function(value,rows,index){
                    var str="";
                    if(rows.tq == "2"){
                        str += "<button class='btn btn-info dim' type='button' onclick='tiqu(\""+rows.id+"\")' ><i class='fa fa-paste'></i>提取</button>";
                        return str;
                    }else{
                        str += "<button class='btn btn-info dim' type='button' onclick='huanyuan(\""+rows.id+"\")' ><i class='fa fa-paste'></i>恢复</button>";
                        return str;
                    }
                }
            },
            {field:'cc',title:'操作',align:'center',width:500,formatter:function(value,rows,index){
                    var str="";
                    str+="<button class='btn btn-info dim' type='button' onclick='delTpmUser(\""+rows.id+"\")' ><i class='fa fa-paste'></i>删除</button>";
                    // str += "<button class='btn btn-info dim' type='button' onclick='fuquans(\""+rows.id+"\",\""+rows.qx+"\")' ><i class='fa fa-paste'></i>赋权</button>"+"  ";
                    return  str;
                }
            }
        ]
    });
    function tiqu(id){
        $.ajax({
            url:'<%=request.getContextPath()%>/tiquTpmUser',
            type:'POST',
            dataType:'text',
            data:{
                id:id
            },
            success:function(){
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

    function huanyuan(id){
        $.ajax({
            url:'<%=request.getContextPath()%>/huanyuanTpmUser',
            type:'POST',
            dataType:'text',
            data:{
                id:id
            },
            success:function(){
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

    function delTpmUser(id){
        $.ajax({
            url:'<%=request.getContextPath()%>/delTpmUser',
            type:'POST',
            dataType:'text',
            data:{
                "id":id
            },
            success:function(data){
                $("#myTable3").bootstrapTable('refresh');
            }
        })
    }

</script>
</html>
