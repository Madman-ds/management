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
    <form id="updWeekPlan">
        <input type="hidden" value="${weekPlan.z_id}" name="z_id"  class="form-control" id="z_id">
        <label>时间:</label>
        <br>
        <div class="form-group">
            <div class="col-sm-6">
                <input  name="z_startdate" id="z_startdate" value="${weekPlan.z_startdate}" class="form-control time" placeholder="开始时间">
            </div>
            <div class="col-sm-6">
                <input  name="z_enddate" id="z_enddate" value="${weekPlan.z_enddate}" class="form-control time" placeholder="结束时间">
            </div>
        </div>
        <br>
        <label>设备名称:</label>
        <select class="form-control" onchange="checkz_bh(this.value)">
            <option value="">请选择</option>
            <option value="18510001" ${weekPlan.z_bh == 18510001 ?"selected":"" }>1200热等静压机</option>
            <option value="18510002" ${weekPlan.z_bh == 18510002 ?"selected":"" }>650热等静压机</option>
        </select>
        <label>设备编号:</label>
        <input type="hidden" value="${weekPlan.z_name}" name="z_name" class="form-control" id="z_name" >
        <input type="text" value="${weekPlan.z_bh}" name="z_bh" class="form-control" id="z_bh">
        <label>周一:</label>
        <input type="text" value="${weekPlan.z_one}" name="z_one"  class="form-control" id="z_one">
        <label>周二:</label>
        <input type="text" value="${weekPlan.z_two}" name="z_two"  class="form-control" id="z_two">
        <label>周三:</label>
        <input type="text" value="${weekPlan.z_three}" name="z_three"  class="form-control" id="z_three">
        <label>周四:</label>
        <input type="text" value="${weekPlan.z_four}" name="z_four"  class="form-control" id="z_four">
        <label>周五:</label>
        <input type="text" value="${weekPlan.z_five}" name="z_five"  class="form-control" id="z_five">
        <label>周六:</label>
        <input type="text" value="${weekPlan.z_six}" name="z_six"  class="form-control" id="z_six">
        <label>周日:</label>
        <input type="text" value="${weekPlan.z_sunday}" name="z_sunday"  class="form-control" id="z_sunday">
        <label>备注:</label>
        <input type="text" value="${weekPlan.z_remarks}" name="z_remarks"  class="form-control" id="z_remarks">
    </form>
</body>
<script type="text/javascript">
    function checkz_bh(value) {
        if(value == "18510001"){
            $("#z_name").val("1200热等静压机");
        }else if(value == "18510002"){
            $("#z_name").val("650热等静压机");
        }
        $("#z_bh").val(value);
    }
    function chenckUpdUserForm() {
        var chenckKh = "";
        var chenckName = "";
        if ($("#z_bh").val()==""){
            alert("设备名称不能为空")
            return false;
        }
        else if ($("#z_bh").val()=="" ){
            alert("编号不能为空")
            return false;
        }
        else if ($("#z_one").val()==""){
            alert("周一计划不能为空")
            return false;
        }
        else if ($("#z_two").val()==""){
            alert("周二计划不能为空")
            return false;
        }
        else if ($("#z_two").val()==""){
            alert("周二计划不能为空")
            return false;
        }
        else if ($("#z_three").val()==""){
            alert("周三计划不能为空")
            return false;
        }
        else if ($("#z_four").val()==""){
            alert("周四计划不能为空")
            return false;
        }
        else if ($("#z_five").val()==""){
            alert("周五计划不能为空")
            return false;
        }
        else if ($("#z_six").val()==""){
            alert("周六计划不能为空")
            return false;
        }
        else if ($("#z_sunday").val()==""){
            alert("周日计划不能为空")
            return false;
        }
        else if ($("#z_remarks").val()==""){
            alert("备注不能为空")
            return false;
        }
        else if ($("#z_startdate").val()=="" || $("#z_enddate").val()==""){
            alert("时间为空")
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
