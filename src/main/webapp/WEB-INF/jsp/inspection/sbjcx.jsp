<%--
  Created by IntelliJ IDEA.
  User: 段大神经
  Date: 2018/11/18
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>查看某设备所有检查项</title>
</head>
<body>
<div><table id="sbjcx"></table></div>
<script type="text/javascript">
    //查询 表格展示
    $('#sbjcx').bootstrapTable({
        url:'<%=request.getContextPath() %>/findAllInspectionitemBySbId?sb_id=${sb_id}',//获取数据地址
        method:'post',//发送请求的方式
        contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        clickToSelect: true, //是否启用点击选中行
        columns:[
            {field:'jcx_id',visible: false},
            {field:'jcx_name',title:'检查项',align:'center'},
            {field:'jcx_v',title:'要求',align:'center'}
        ]
    });
</script>
</body>
</html>
