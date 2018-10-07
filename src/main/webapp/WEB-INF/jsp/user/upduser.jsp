<%--
  Created by IntelliJ IDEA.
  User: 段大神经
  Date: 2018/10/7
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>用户修改页面</title>
</head>
<body>
    <form id="updUserForm">
        <input type="hidden" name="user_id" value="${user.user_id }">
        <input type="hidden" name="user_id" value="${user.create_time }">
        <label>用户姓名:</label>
        <input type="text" name="user_name" class="form-control" value="${user.user_name }">
        <label>密码:</label>
        <input type="text" name="password" class="form-control" value="${user.password }">


        <label>卡号:</label>
        <input type="text" name="user_kh"  class="form-control" value="${user.user_kh }">

        <label>是否为管理员：</label>
        <select class="form-control" name="is_management">
            <option value="">请选择</option>
            <option value="1" ${user.is_management == 1?"selected":"" }>是</option>
            <option value="2" ${user.is_management == 2?"selected":"" }>否</option>
        </select><br>

    </form>
</body>
</html>
