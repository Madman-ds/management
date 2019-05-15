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
<div>
    <button type="button" onclick="weixian()" class="btn btn-primary">危险点点检</button>
    &nbsp;
    <button type="button" onclick="glzxjClick()" class="btn btn-primary">管理者巡检</button>
    &nbsp;
    <button type="button" onclick="tpm1200Click()" class="btn btn-primary">1200-TPM点检</button>
    &nbsp;
    <button type="button" onclick="tpm650Click()" class="btn btn-primary">650-TPM点检</button>
    &nbsp;
    <button type="button" class="btn btn-primary" onclick="showfives()">5S点检</button>
</div>

<script>
    function glzxjClick() {
        location.href = "<%=request.getContextPath() %>/toGlzxjAdd"
    }
    
    function weixian() {
        location.href = "<%=request.getContextPath() %>/toViewList"
    }
    function showfives(){
        location.href = "<%=request.getContextPath() %>/toshowfiveslog"
    }
    function tpm1200Click() {
        location.href = "<%=request.getContextPath() %>/toTpm1200List"
    }
    function tpm650Click() {
        location.href = "<%=request.getContextPath() %>/toTpm650List"
    }
</script>
</body>
</html>
