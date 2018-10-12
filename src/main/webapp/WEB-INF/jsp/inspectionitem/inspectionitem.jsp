<%--
  Created by IntelliJ IDEA.
  User: 段大神经
  Date: 2018/10/10
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>检查项赋权</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../../../jscore.jsp"></jsp:include>
<body>
<form>
<!--检查项table占位-->
<div id="jcxzw"></div>
<div>
写权限：<select id="userSelect" class="selectpicker show-tick form-control " data-live-search="true"></select>
</div>
</form>
</body>
<script type="text/javascript">
    //查询 表格展示
    $('#jcxzw').bootstrapTable({
        url:'<%=request.getContextPath() %>/findAllInspectionitemBySbId?sb_id=${sb_id}',//获取数据地址
        method:'post',//发送请求的方式
        contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        clickToSelect: true, //是否启用点击选中行
        columns:[
            {checkbox:true},
            {field:'jcx_id',visible: false},
            {field:'jcx_name',title:'检查项',align:'center'},
            {field:'jcx_v',title:'要求',align:'center'}
        ]
    });
    //加载下拉框
    $(function () {
        $.ajax({
            url:"<%=request.getContextPath()%>/getUserList",
            dataType:"json",
            type:"post",
            success:function(data){
                var h = "";
                $.each(data, function(key, value) {
                    h += "<option value='" + value.user_id + "'>" + value.user_name //下拉框序言的循环数据
                        + "</option>";
                });
                $("#userSelect").append($("<option value="+0+">"+"请选择"+"</option>")).append(h);
            }
        })
    })
</script>
</html>
