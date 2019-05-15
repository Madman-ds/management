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
    <button type="button" onclick="topIndex()" class="btn btn-primary">危险点点检</button>
    &nbsp;
    <button type="button" onclick="glzxjClick()" class="btn btn-primary">管理者巡检</button>
    &nbsp;
    <button type="button" onclick="yibiaoTaiZheng()" class="btn btn-primary">仪表台账</button>
    &nbsp;
    <button type="button" onclick="tpm1200()" class="btn btn-primary">1200-TPM点检</button>
    &nbsp;
    <button type="button" onclick="tpm650()" class="btn btn-primary">650-TPM点检</button>
    &nbsp;
    <button type="button" class="btn btn-primary" onclick="showfives()">5S点检</button>

<script>
    //管理者巡检
    function glzxjClick() {
        location.href = "<%=request.getContextPath() %>/toTopGlzxjm"
    }
    //危险点点检
    function topIndex() {
        location.href = "<%=request.getContextPath() %>/topIndex"
    }

    function yibiaoTaiZheng() {
        location.href = "<%=request.getContextPath() %>/topyibiaoTaiZheng"
    }

    function showfives(){
        location.href = "<%=request.getContextPath() %>/toTopFiveBytq"
    }

    function tpm1200(){
        location.href = "<%=request.getContextPath() %>/toTop1200Tpm"
    }

    function tpm650(){
        location.href = "<%=request.getContextPath() %>/toTop650Tpm"
    }
</script>
</body>
</html>
