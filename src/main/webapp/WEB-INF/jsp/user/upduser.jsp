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
        <input type="hidden" name="user_id" value="${user.user_id }" >
        <input type="hidden" name="user_id" value="${user.create_time }">
        <label>用户姓名:</label>
        <input type="text" name="user_name" class="form-control" id="upd_user_name" value="${user.user_name }">
        <label>密码:</label>
        <input type="text" name="password" class="form-control" id="upd_password" value="${user.password }">


        <label>卡号:</label>
        <input type="text" name="user_kh"  class="form-control" id="upd_user_kh" value="${user.user_kh }">

        <label>是否为管理员：</label>
        <select class="form-control" name="is_management" id="upd_is_management">
            <option value="">请选择</option>
            <option value="1" ${user.is_management == 1?"selected":"" }>是</option>
            <option value="2" ${user.is_management == 2?"selected":"" }>否</option>
        </select>
        <%--<div class="form-group" style="margin-right: 60px;margin-left: 60px;margin-top: 10px">
            <button type="button" onclick="chenckUpdUserForm()" class="btn btn-success btn-lg btn-block">
                提交
            </button>
        </div>--%>
    </form>
<script type="text/javascript">
    function chenckUpdUserForm() {
        var chenckKh = "";
        var chenckName = "";
        var upd_user_name = $("#upd_user_name").val();
        var upd_user_name_v = "${user.user_name}" ;
        var upd_user_kh = $("#upd_user_kh").val();
        var upd_user_kh_v = "${user.user_kh}";
        if (upd_user_name==""){
            alert("用户名不能为空")
            return false;
        }
        if (upd_user_name!=""){
            $.ajax({
                url:"<%=request.getContextPath()%>/selectUserByWhere",
                data:{user_name:upd_user_name},
                dataType:"json",
                type:"post",
                async:false,
                success:function(data){
                    chenckName =  data.user_name;
                }
            })
        }
        if (chenckName != "" && chenckName != upd_user_name_v) {
            alert("您修改的用户名重复，请重新输入");
            return false;
        }

        else if ($("#upd_password").val()=="" || $("#upd_password").val()==null){
            alert("密码不能为空")
            return false;
        }
        else if (upd_user_kh=="" || upd_user_kh==null){
            alert("卡号不能为空")
            return false;
        }
        else if ($("#upd_is_management").val()==""){
            alert("请选择权限")
            return false;
        }
        if (upd_user_kh!="" ){
            alert(upd_user_kh)
            $.ajax({
                url:"<%=request.getContextPath()%>/selectUserByWhere",
                data:{user_kh:upd_user_kh},
                dataType:"json",
                type:"post",
                async:false,
                success:function(data){
                    chenckKh =  data.user_kh;
                }
            })
        }
        if (chenckKh != "" && chenckKh != upd_user_kh_v) {
            alert("您修改的卡号重复，请重新输入");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
