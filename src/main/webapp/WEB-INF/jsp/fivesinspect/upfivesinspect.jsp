<%--
  Created by IntelliJ IDEA.
  User: qinmengchao
  Date: 2019/4/18
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>修改5S</title>
</head>
<body>
<form class="form-horizontal" id="UpFiveSInspectFrom">
    <input type="hidden" name="f_id" value="${fsi.f_id }" >
    <label>5S：</label>
    <input type="text" class="form-control" id="f_fives" value="${fsi.f_fives}" placeholder="请输入5S">
    <label>分类：</label>
    <input type="text" class="form-control" id="f_clazzify" value="${fsi.f_clazzify}" placeholder="请输入类别">
    <label>内容：</label>
    <input type="text" class="form-control" id="f_content" value="${fsi.f_content}" placeholder="请输入内容">
</form>
</body>
<script type="text/javascript">
    function chenckupUserForm() {
        if ($("#f_fives").val()==""){
            alert("5S内容不能为空")
            return false;
        }
        else if ($("#f_clazzify").val()=="" ){
            alert("类别不能为空")
            return false;
        }
        else if ($("#f_content").val()==""){
            alert("卡号不能为空")
            return false;
        }return true;
    }
</script>
</html>
