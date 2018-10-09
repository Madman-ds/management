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
        <input type="text" name="user_name" class="form-control" id="add_user_name">
        <label>密码:</label>
        <input type="text" name="password" class="form-control" id="add_password">
        <label>卡号:</label>
        <input type="text" name="user_kh"  class="form-control" id="add_user_kh">
        <label>是否为管理员：</label>
        <select class="form-control" name="is_management" id="add_is_management">
            <option value="">请选择</option>
            <option value="1">是</option>
            <option value="2">否</option>
        </select><br>
    </form>
</body>
<script type="text/javascript">
    function chenckAddUserForm() {
        var chenckKh = "";
        var chenckName = "";
        if ($("#add_user_name").val()==""){
            alert("用户名不能为空")
            return false;
        }
        if ($("#add_user_name").val()!=""){
            $.ajax({
                url:"<%=request.getContextPath()%>/selectUserByWhere",
                data:{user_name:$("#add_user_name").val()},
                dataType:"json",
                type:"post",
                async:false,
                success:function(data){
                    chenckName =  data.user_name;
                }
            })
        }
        if (chenckName != "") {
            alert("您输入的用户名重复，请重新输入");
            return false;
        }

        else if ($("#add_password").val()=="" ){
            alert("密码不能为空")
            return false;
        }
        else if ($("#add_user_kh").val()==""){
            alert("卡号不能为空")
            return false;
        }
        else if ($("#add_is_management").val()==""){
            alert("请选择权限")
            return false;
        }
        if ($("#add_user_kh").val()!="" ){
            $.ajax({
                url:"<%=request.getContextPath()%>/selectUserByWhere",
                data:{user_kh:$("#add_user_kh").val()},
                dataType:"json",
                type:"post",
                async:false,
                success:function(data){
                    chenckKh =  data.user_kh;
                }
            })
        }
        if (chenckKh != "") {
            alert("您输入的卡号重复，请重新输入");
            return false;
        }
        return true;
    }
</script>
</html>
