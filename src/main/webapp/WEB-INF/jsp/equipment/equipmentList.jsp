<%--
  Created by IntelliJ IDEA.
  User: 35386
  Date: 2018/9/26
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>设备管理页面</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../../../jscore.jsp"></jsp:include>
<body>

<div class="rows">
    <!-- 搜索 -->
    <div class="panel-body">
        <form class="form-horizontal" id="searchForm">
            <div class="form-group" >
                <label for="select_sb_name" class="col-sm-1 control-label">设备名称</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="select_sb_name" placeholder="请输入设备名称">
                </div>

                <label for="select_sb_number" class="col-sm-1 control-label">设备编号</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="select_sb_number" placeholder="请输入设备编号">
                </div>

                <label for="select_sb_xh" class="col-sm-1 control-label">设备型号</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="select_sb_xh" placeholder="请输入设备型号">
                </div>

                <div class="col-sm-2">
                    <button onclick="whereSearch()" class="btn btn-primary" type="button">
                        <i class="glyphicon glyphicon-search">
                        </i>搜索
                    </button>
                    <button onclick="resetForm()" class="btn btn-danger" type="button">
                        <i class="glyphicon glyphicon-repeat">
                        </i>重置
                    </button>
                </div>
            </div>
        </form>
    </div>

</div>

<div class="rows">
    <div id="toolBar">
        <button onclick="delEquipmentAll()" class="btn btn-danger"  type="button">
            <i class="glyphicon glyphicon-minus"></i>
            删除
        </button>
        <button onclick="addEquipment()" class="btn btn-success"  type="button">
            <i class="glyphicon glyphicon-plus"></i>
            添加
        </button>
    </div>

    <%--展示用户--%>
    <div id="myTable"></div>


</div>



<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn btn-primary" onclick="addRow()">新增属性</button>
                <button type="button" class="btn btn-primary" onclick="delRow3()">删除全部新增属性</button>
            </div>
            <div class="modal-body">
                <table >
                    <tr>
                        <td style="width:160px" >设备属性</td>
                        <td style="width:160px" >属性值</td>
                        <td style="width:160px;" align="center">操作</td>
                    </tr>
                    <tr>
                        <td>设备名称</td>
                        <td><input type="hidden"  id="sb_id" name="sb_id">
                            <input type="text" style="width:160px;margin-top: 5px"  id="sb_name" name="sb_name" placeholder="名称">
                        </td>
                        <td style="width:160px;" align="center">不可删除</td>
                    </tr>
                    <tr>
                        <td>设备编号</td>
                        <td><input type="text" style="width:160px;margin-top: 5px" id="sb_number" name="sb_number" placeholder="编号">
                        </td>
                        <td align="center">不可删除</td>
                    </tr>
                    <tr>
                        <td>设备型号</td>
                        <td><input type="text" style="width:160px;margin-top: 5px"  id="sb_xh"  name="sb_xh" placeholder="属性">
                        </td>
                        <td align="center">不可删除</td>
                    </tr>
                </table>
                <%--<input type="hidden" id="sb_id" value=""/>--%>
                <table id="mytableid">

                </table>
                <input type="hidden" id="delTextId" />
            </div>
            <div class="modal-footer">
                <div class="col-sm-6 col-sm-offset-2" id="addshow">
                    <button class="btn btn-primary" type="button" id="add">保存内容</button>
                </div>
                <div class="col-sm-6 col-sm-offset-2" id="updateshow">
                    <button class="btn btn-primary" type="button" id="update">修改内容</button>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 模态框（Modal） 检查项管理-->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                    <button type="button" class="btn btn-primary" onclick="addRow2()">新增检查项</button>
                    <button type="button" class="btn btn-primary" onclick="delRow4()">删除全部</button>
            </div>
            <div class="modal-body">
                <table >
                    <tr>
                        <td style="width:160px" >检查项</td>
                        <td style="width:160px" >要求</td>
                        <td style="width:160px;" align="center">操作</td>
                    </tr>
                </table>
                <input type="hidden" id="sbid" value=""/>
                <table id="mytableid2">

                </table>
                <input type="hidden" id="delTextId2" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button id="saveInspectionitem" type="button" class="btn btn-primary">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>
<script>
//---------------------------------------设备管理START----------------------------------------------------------------------
    var num = 1;
    //添加一行
    function addRow() {
        var tb = document.getElementById("mytableid");//获取表格
        var row = tb.insertRow();//添加行
        row.setAttribute('id','cel'+num);
        // var cell = row.insertCell();//添加列    id='cel"+num+"'
        row.innerHTML += "<td><input class='cell1'style='width:160px;margin-top: 5px' align='center'  type='text' placeholder='属性名称'></td>";
        row.innerHTML += "<td><input class='cell2' style='width:160px;margin-top: 5px' align='center' type='text' placeholder='属性值'><td>";
        row.innerHTML += "<td align='center' style='width:160px;margin-top: 5px'><a onclick='delRows(this)' >删除</a></td>";

    }
    //删除一行
    function delRows(obj) {
        var rowIndex = obj.parentElement.parentElement.rowIndex;
        obj.parentElement.parentElement.parentElement.deleteRow(rowIndex);
    }
    //删除一行
    function delRow() {
        var rowIndex = document.getElementById("delTextId").value;
        var tb = document.getElementById("mytableid");
        tb.deleteRow(rowIndex);
    }
    //删除全部行
    function delRow3() {
        delPublic("mytableid");
    }
//---------------------------------------设备管理END----------------------------------------------------------------------

//---------------------------------------管理检查项START--------------------------------------------------------------------

    //添加一行
    function addRow2() {
        num++;
        var tb = document.getElementById("mytableid2");//获取表格
        var row = tb.insertRow();//添加行
        // var cell = row.insertCell();//添加列
        row.innerHTML += "<td><input class='cell3'style='width:160px;margin-top: 5px' align='center'  type='text' placeholder='检查项名称'></td>" +
            "<td><input class='cell4' style='width:160px;margin-top: 5px' align='center' type='text' placeholder='要求'><td>" +
            "<td align='center' style='width:160px;margin-top: 5px'><a onclick='delRows(this)' >删除</a></td>";
    }
    //删除一行
    function delRow2() {
        var rowIndex = document.getElementById("delTextId2").value;
        var tb = document.getElementById("mytableid2");
        tb.deleteRow(rowIndex);
    }
    //删除全部行
    function delRow4() {
        delPublic("mytableid2");
    }
//---------------------------------------管理检查项END--------------------------------------------------------------------

    //删除全部公共方法
    function delPublic(id) {
        var id = id;
        document.getElementById(id).innerHTML='';
    }





//---------------------------------------设备表格查询START------------------------------------------------------------------
    //重置
    function resetForm(){
        $("#searchForm")[0].reset();
        whereSearch();
    }
    //条件查询
    function whereSearch(){
        $("#myTable").bootstrapTable('refresh',{pageNumber:1});
    }
    <%-- 回车搜索 --%>
    function enterSearch(){
        var event = arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异
        if (event.keyCode == 13){
            whereSearch();
        }
    }

    //查询 表格展示
    $('#myTable').bootstrapTable({
        toolbar:'#toolbar',
        url:'<%=request.getContextPath() %>/equipment/getEquipmentList',//获取数据地址
        pagination:true, //是否展示分页
        pageList:[5, 10, 20, 50],//分页组件
        pageNumber:1,
        pageSize:5,//默认每页条数
        //search:true,//是否显示搜索框
        //searchText:'试试',//初始化搜索文字
        method:'post',//发送请求的方式
        contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        // showColumns:false,//是否显示 内容列下拉框
        // showToggle:false,//是否显示 切换试图（table/card）按钮
        // showPaginationSwitch:false,//是否显示 数据条数选择框
        // showRefresh:false,//是否显示刷新按钮
        // detailView:false,//设置为 true 可以显示详细页面模式。
        // showFooter:false,//是否显示列脚
        clickToSelect: true, //是否启用点击选中行
        sidePagination:'server',//分页方式：client客户端分页，server服务端分页（*
        striped:true,
        queryParams:function(){
            var sb_name= $('#select_sb_name').val();
            var sb_number = $('#select_sb_number').val();
            var sb_xh = $('#select_sb_xh').val();
//	 		return 的数据 是传递到  action类中的参数
            return {
                "sb_name":sb_name,
                "sb_number":sb_number,
                "sb_xh":sb_xh,
                page:this.pageNumber,//当前页
                rows:this.pageSize //每页条数
            }
        },
        columns:[
            {checkbox:true},
            {field:'sb_id',title:'ID',align:'center',width:50},
            {field:'sb_name',title:'名称',align:'center',width:350},
            {field:'sb_number',title:'编号',align:'center',width:450},
            {field:'sb_xh',title:'属性',align:'center',width:350},
            {field:'cc',title:'操作',align:'center',width:350,formatter:function(value,rows,index){
                    var str="";
                    str+="<button class='btn btn-info dim' type='button' onclick='addInspectionitem(\""+rows.sb_id+"\")' ><i class='fa fa-paste'></i>管理检查项</button>  ";
                    str+="<button class='btn btn-info dim' type='button' onclick='updateEquipment(\""+rows.sb_id+"\")' ><i class='fa fa-paste'></i>修改</button>  ";
                    str+="<button class='btn btn-info dim' type='button' onclick='queryEquipment(\""+rows.sb_id+"\")' ><i class='fa fa-paste'></i>查看</button>";
                    return  str;
                }
            }

        ]
    });

    //查询重置
    function EquipmentSearch(){
        $('#myTable').bootstrapTable('refresh',{pageNumber:1});
    }
//---------------------------------------设备表格查询END------------------------------------------------------------------

//---------------------------------------设备表格删除START------------------------------------------------------------------
    //批量删除
    function delEquipmentAll(){
        var rows=$('#myTable').bootstrapTable('getSelections');
        if(rows.length<=0){
            BootstrapDialog.show({
                title:"温馨提示",
                message: '请选择要删除的数据'
            });
        }else{
            var ids ="";
            for (var i = 0; i < rows.length; i++) {
                ids += ids == "" ? rows[i].sb_id : "," + rows[i].sb_id;
            }
            $.ajax({
                url:'<%=request.getContextPath() %>/equipment/delEquipment',
                type:'post',
                data:{
                    ids:ids
                },
                dataType:'json',
                success:function(data){
                    if (data) {
                        EquipmentSearch();
                    }else {
                        // bootbox.alert('删除数据失败');
                    }
                }
            })
        }
    }
//---------------------------------------设备表格删除END------------------------------------------------------------------

//---------------------添加 模态窗口--START----------------------------------------------------------------------------------
    /**
     * 添加 模态窗口
     */
    function addEquipment(){
        $("#sb_id").val("");
        $("#sb_name").val("");
        $("#sb_number").val("");
        $("#sb_xh").val("");
        delRow3();
        $("#addshow").show();
        $("#buttonShow").show();
        $("#updateshow").hide();
        $('#myModal2').modal('toggle');
    }
    /**
     * 管理检查项 模态窗口
     */
    function addInspectionitem(id){
        delRow4();
        $('#myModal3').modal('toggle');
        $('#sbid').val(id);
    }
//---------------------添加 模态窗口---END---------------------------------------------------------------------------------

//---------------------------------------设备表格添加START------------------------------------------------------------------
    /**
     * 添加方法
     */
    $("#add").click(function(){
        var numArr = []; // 定义一个空数组
        var numArr2 = [];
        var txt = $('#mytableid').find('.cell1'); // 获取所有文本框
        var txt2 = $('#mytableid').find('.cell2'); // 获取所有文本框
        for (var i = 0; i < txt.length; i++) {
            numArr.push(txt.eq(i).val()); // 将文本框的值添加到数组中
            numArr2.push(txt2.eq(i).val());
        }
        var numArra = JSON.stringify(numArr);
        var numArr2 = JSON.stringify(numArr2);
        if($("#sb_name").val()==""){
            alert("请填写名称");
            return false;
        }
        if($("#sb_number").val()==""){
            alert("请填写编号");
            return false;
        }
        if($("#sb_xh").val()==""){
            alert("请填写属性");
            return false;
        }
        var tbobj=document.getElementById("mytableid");
        var chenck = true;
        var chenck1 = true;
       if (tbobj.rows.length>0) {
           $("#mytableid tr").each(function() {    // 遍历每一行
              var tdv =  $(this).children('td:eq(0)').find("input").val();  // td:eq(0)选择器表示第一个单元格
              var tdv1 =  $(this).children('td:eq(1)').find("input").val();  // td:eq(0)选择器表示第一个单元格
                if(tdv == ""){
                    chenck =false;
                }
                if(tdv1 == ""){
                    chenck1 =false;
                }
           });
       }
       if(!chenck){
           alert("属性名称必填")
           return false;
       }
       if(!chenck1){
           alert("属性值必填")
           return false;
       }
        $.ajax({
            url:'<%=request.getContextPath() %>/equipment/addEquipment',
            type:'post',
            data:{
                "sb_name":$("#sb_name").val(),
                "sb_number":$("#sb_number").val(),
                "sb_xh":$("#sb_xh").val(),
                "sx_name":numArra,
                "sx_v":numArr2
            },
            // dataType:'text',
            success:function(data){
                alert(data);
                $('#myModal2').modal('hide');
                EquipmentSearch();
            }
        })
    })
//---------------------------------------设备表格添加END------------------------------------------------------------------

//---------------------------------------设备表格修改START------------------------------------------------------------------
    /**
     * 修改方法
     */
    $("#update").click(function(){
        var numArr = []; // 定义一个空数组
        var numArr2 = [];
        var txt = $('#mytableid').find('.cell1'); // 获取所有文本框
        var txt2 = $('#mytableid').find('.cell2'); // 获取所有文本框
        for (var i = 0; i < txt.length; i++) {
            numArr.push(txt.eq(i).val()); // 将文本框的值添加到数组中
            numArr2.push(txt2.eq(i).val());
        }
        var numArra = JSON.stringify(numArr);
        var numArr2 = JSON.stringify(numArr2);
        var sb_id = $("#sb_id").val();
        if($("#sb_name").val()==""){
            alert("请填写名称");
            return false;
        }
        if($("#sb_number").val()==""){
            alert("请填写编号");
            return false;
        }
        if($("#sb_xh").val()==""){
            alert("请填写属性");
            return false;
        }
        var tbobj=document.getElementById("mytableid");
        var chenck = true;
        var chenck1 = true;
        if (tbobj.rows.length>0) {
            $("#mytableid tr").each(function() {    // 遍历每一行
                var tdv =  $(this).children('td:eq(0)').find("input").val();  // td:eq(0)选择器表示第一个单元格
                var tdv1 =  $(this).children('td:eq(1)').find("input").val();  // td:eq(0)选择器表示第一个单元格
                if(tdv == ""){
                    chenck =false;
                }
                if(tdv1 == ""){
                    chenck1 =false;
                }
            });
        }
        if(!chenck){
            alert("属性名称必填")
            return false;
        }
        if(!chenck1){
            alert("属性值必填")
            return false;
        }
        $.ajax({
            url:'<%=request.getContextPath() %>/equipment/updateEquipment',
            type:'post',
            data:
                $("#equipmentAdd").serialize(),
            dataType:'json',
            success:function(data){
                $('#myModal2').modal('hide');
                EquipmentSearch();
                // jQuery("#myModal5").trigger("refresh");
            }
        })
            $.ajax({
                url:'<%=request.getContextPath() %>/equipment/updateAttr',
                type:'post',
                data:{
                    "sx_name":numArra,
                    "sx_v":numArr2,
                    "sb_id":sb_id
                },
                dataType:'json',
                success:function(data){
                    $('#myModal2').modal('hide');
                    EquipmentSearch();
                }
            })
    })

    /**
     * 修改回显
     * @param sb_id
     */
    function updateEquipment(sb_id){
        delRow3();
        $("#addshow").hide();
        $("#updateshow").show();
        $('#myModal2').modal('toggle');
        $.ajax({
            url:'<%=request.getContextPath() %>/equipment/getEquipmentById',
            type:'post',
            data:{
                id:sb_id
            },
            async:false,
            dataType:'json',
            success:function(data){
                var list = data.list;
                console.log(list);
                for(var i=0;i<list.length;i++){
                    var name = list[i].sx_name;
                    var val = list[i].sx_v;
                    // addRows(name,val,i);
                    var tb = document.getElementById("mytableid");//获取表格
                    var row = tb.insertRow();//添加行
                    row.innerHTML += "<td><input class='cell1'value='"+name+"' style='width:160px;margin-top: 5px' align='center'  type='text' placeholder='属性名称'></td>";
                    row.innerHTML += "<td><input class='cell2' value='"+val+"' style='width:160px;margin-top: 5px' align='center' type='text' placeholder='属性值'><td>";
                    row.innerHTML += "<td align='center' style='width:160px;margin-top: 5px'><a onclick='delRow()' >删除</a></td>";
                }
                $('#sb_name').removeAttr("readonly");
                $('#sb_number').removeAttr("readonly");
                $('#sb_xh').removeAttr("readonly");

                $("#sb_id").val(data.sb_id);
                $("#sb_name").val(data.sb_name);
                $("#sb_number").val(data.sb_number);
                $("#sb_xh").val(data.sb_xh);
            }
        });
    }

function addRows(name,val,i) {
    var tb = document.getElementById("mytableid");//获取表格
    var row = tb.insertRow();//添加行
    var nam = "cel"+i;
    var vel = "vel"+i;
    row.innerHTML += "<td><input class='"+nam+"' style='width:160px;margin-top: 5px' align='center'  type='text' placeholder='设备名称'></td>";
    row.innerHTML += "<td><input class='"+vel+"' style='width:160px;margin-top: 5px' align='center' type='text' placeholder='设备名称'><td>";
    row.innerHTML += "<td align='center' style='width:160px;margin-top: 5px'><a onclick='delRow()' >删除</a></td>";
    $(".cel0").val(name);
    $(".cel1").val(name);
}

    /**
     * 查看
     * @param sb_id
     */
    function queryEquipment(sb_id){
        delRow3();
        $("#addshow").hide();
        $("#updateshow").hide();
        $("#buttonShow").hide();
        $('#myModal2').modal('toggle');
        $.ajax({
            url:'<%=request.getContextPath() %>/equipment/getEquipmentById',
            type:'post',
            data:{
                id:sb_id
            },
            async:false,
            dataType:'json',
            success:function(data){
                var list = data.list;
                for(var i=0;i<list.length;i++){
                    var name = list[i].sx_name;
                    var val = list[i].sx_v;
                    var tb = document.getElementById("mytableid");//获取表格
                    var row = tb.insertRow();//添加行
                    row.innerHTML += "<td><input readonly=readonly class='cell1'value='"+name+"' style='width:160px;margin-top: 5px' align='center'  type='text' placeholder='设备名称'></td>";
                    row.innerHTML += "<td><input readonly=readonly class='cell2' value='"+val+"' style='width:160px;margin-top: 5px' align='center' type='text' placeholder='设备名称'><td>";
                    row.innerHTML += "<td align='center' style='width:160px;margin-top: 5px'><a onclick='delRowNo()' >删除</a></td>";
                }

                $('#sb_name').attr("readonly","readonly");
                $('#sb_number').attr("readonly","readonly");
                $('#sb_xh').attr("readonly","readonly");
                $("#sb_id").val(data.sb_id);
                $("#sb_name").val(data.sb_name);
                $("#sb_number").val(data.sb_number);
                $("#sb_xh").val(data.sb_xh);
            }
        });
    }

//----------------------------------------------------------------------------------------------------------------------

function delRowNo(){
   alert("不可删除呦！");
}




//----------------------------------------------------------------------------------------------------------------------


//---------------------------------------设备表格修改END------------------------------------------------------------------


/**
 * 添加方法
 */
$("#saveInspectionitem").click(function(){
    var numArr = []; // 定义一个空数组
    var numArr2 = [];
    var txt = $('#mytableid2').find('.cell3'); // 获取所有文本框
    var txt2 = $('#mytableid2').find('.cell4'); // 获取所有文本框
    for (var i = 0; i < txt.length; i++) {
        numArr.push(txt.eq(i).val()); // 将文本框的值添加到数组中
        numArr2.push(txt2.eq(i).val());
    }
    var numArra = JSON.stringify(numArr);
    var numArr2 = JSON.stringify(numArr2);
    var sb_id = $('#sbid').val();
    $('#myModal3').modal('hide');
    $.ajax({
        url:'<%=request.getContextPath() %>/inspectionitem/addInspectionitem',
        type:'post',
        data:{
            "sx_name":numArra,
            "sx_v":numArr2,
            "sb_id":sb_id
        },
        dataType:'json',
        success:function(){
            $('#myModal3').modal('hide');
            $('#sbid').val("");
            EquipmentSearch();
        }
    })

})

</script>
</html>
