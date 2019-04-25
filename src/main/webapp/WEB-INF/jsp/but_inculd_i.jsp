<%--
  Created by IntelliJ IDEA.
  User: 35386
  Date: 2019/4/15
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <button type="button" onclick="glzxjClick()" class="btn btn-primary">管理者巡检</button>
    &nbsp;
    <button type="button" class="btn btn-primary">仪表台账</button>
    &nbsp;
    <button type="button" class="btn btn-primary">1200-TPM点检</button>
    &nbsp;
    <button type="button" class="btn btn-primary">650-TPM点检</button>
    &nbsp;
    <button type="button" class="btn btn-primary" onclick="showfives()">5S点检</button>


<script>
    function glzxjClick() {
        location.href = "<%=request.getContextPath() %>/toTopGlzxjMi"
    }
</script>
</body>
</html>
