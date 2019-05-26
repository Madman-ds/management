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
    <title>添加仪表台账</title>
</head>
<style>
    .row {
        margin-top: 15px;
        margin-left: 15px;
    }
</style>
<body>
    <form id="addUserForm">
        <div class="row">
            <div class="col-sm-2">
                <label>名称:</label>
            </div>
            <div class="col-sm-9">
                <input type="text" name="ybtz_name" class="form-control" id="ybtz_name" >
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <label>编号:</label>
            </div>
            <div class="col-sm-9">
                <input type="text" name="ybtz_bh"  class="form-control" id="ybtz_bh">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <label>压力/mpa:</label>
            </div>
            <div class="col-sm-9">
                <input type="text" name="ybtz_mpa"  class="form-control" id="ybtz_mpa">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <label>类别:</label>
            </div>
            <div class="col-sm-9">
                <input type="text" name="ybtz_type"  class="form-control" id="ybtz_type">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <label>位置:</label>
            </div>
            <div class="col-sm-9">
                <input type="text" name="ybtz_wz"  class="form-control" id="ybtz_wz">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <label>下次校验时间:</label>
            </div>
            <div class="col-sm-9">
                <input  name="ybtz_date" id="ybtz_date" class="form-control time" placeholder="下次校验时间">
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <label>备注:</label>
            </div>
            <div class="col-sm-9">
                <textarea type="text" name="ybtz_remarks"  class="form-control" id="ybtz_remarks"></textarea>
            </div>
        </div>
    </form>
</body>
<script type="text/javascript">

    function chenckAddUserForm() {
        var chenckKh = "";
        var chenckName = "";
        if ($("#ybtz_name").val()==""){
            alert("名称不能为空")
            return false;
        }
        else if ($("#ybtz_bh").val()=="" ){
            alert("编号不能为空")
            return false;
        }
        else if ($("#ybtz_mpa").val()==""){
            alert("压力/mpa不能为空")
            return false;
        }
        else if ($("#ybtz_type").val()==""){
            alert("类别不能为空")
            return false;
        }
        else if ($("#ybtz_wz").val()==""){
            alert("位置不能为空")
            return false;
        }
        else if ($("#ybtz_date").val()==""){
            alert("下次校验时间不能为空")
            return false;
        }
        return true;
    }

    $('.time').datetimepicker({
        format: 'yyyy-mm-dd',     /*此属性是显示顺序，还有显示顺序是mm-dd-yyyy*/
        language:"zh-CN",
        weekStart: 1,
        format: 'yyyy-mm-dd',
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        pickerPosition: "bottom-top"
    });
</script>
</html>
