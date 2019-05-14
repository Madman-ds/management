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
    <form id="updTpmForm">
        <input type="hidden" name="id" value="${tpm.id }" >
        <label>TPM名称:</label>
        <input type="text" name="name" class="form-control" id="upd_name">
        <label>型号:</label>
        <input type="text" name="tpm_xh" class="form-control" value="${tpm.tpm_xh }"  id="upd_tpm_xh">
        <label>编号:</label>
        <input type="text" name="tpm_bh" class="form-control" value="${tpm.tpm_bh }"  id="upd_tpm_bh">
        <label>维护编号：</label>
        <select class="form-control" name="tpm_whbh" id="upd_tpm_whbh">
            <option value="">请选择</option>
            <option value="1200TPM" ${tpm.tpm_whbh == "1200TPM" ?"selected":"" }>1200TPM</option>
            <option value="650TPM" ${tpm.tpm_whbh == "650TPM" ?"selected":"" }>650TPM</option>
        </select><br>
        <label>点检项目:</label>
        <input type="text" name="tpm_djxm" value="${tpm.tpm_djxm }" class="form-control" id="upd_tpm_djxm">
        <label>数据/要求:</label>
        <input type="text" name="tpm_yq"  value="${tpm.tpm_yq }" class="form-control" id="upd_tpm_yq">
    </form>
</body>
<script type="text/javascript">
    function chenckupdTpmForm() {
        if ($("#upd_name").val()==""){
            alert("TPM名称不能为空")
            return false;
        }
        if ($("#upd_tpm_xh").val()==""){
            alert("型号不能为空")
            return false;
        }
        if ($("#upd_tpm_bh").val()==""){
            alert("编号不能为空")
            return false;
        }
        if ($("#upd_tpm_whbh").val()==""){
            alert("维护编号不能为空")
            return false;
        }
        if ($("#upd_tpm_djxm").val()==""){
            alert("点检项目不能为空")
            return false;
        }if ($("#upd_tpm_yq").val()==""){
            alert("数据/要求不能为空")
            return false;
        }
        return true;
    }
</script>
</html>
