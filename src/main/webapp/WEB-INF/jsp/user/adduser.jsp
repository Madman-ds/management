<%--
  Created by IntelliJ IDEA.
  User: 段大神经
  Date: 2018/10/7
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户页面</title>
</head>
<body>
    <form id="addUserForm">
        <label>用户姓名:</label>
        <input type="text" name="user_name" class="form-control">
        <label>密码:</label>
        <input type="text" name="password" class="form-control">
        <label>卡号:</label>
        <input type="text" name="user_kh"  class="form-control">
        <label>是否为管理员：</label>
        <select class="form-control" name="is_management">
            <option value="">请选择</option>
            <option value="1">是</option>
            <option value="2">否</option>
        </select><br>
    </form>
</body>
</html>
