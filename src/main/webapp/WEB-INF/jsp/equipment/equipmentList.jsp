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
    <title>Title</title>
</head>
<!-- 核心样式文件 -->
<link href="<%=request.getContextPath() %>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/js/bootstrap-treeview/dist/bootstrap-treeview.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/js/bootStrap-addTabs/bootstrap.addtabs.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/js/bootstrap-table/dist/bootstrap-table.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/js/bootstrap-dialog/dist/css/bootstrap-dialog.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/js/bootstrap-fileinput/css/fileinput.min.css" rel="stylesheet">
<!-- 核心js文件 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-treeview/dist/bootstrap-treeview.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootStrap-addTabs/bootstrap.addtabs.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-table/dist/bootstrap-table.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-table/dist/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-dialog/dist/js/bootstrap-dialog.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-fileinput/js/fileinput.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-fileinput/js/locales/zh.js"></script>
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
                </div>
            </div>
        </form>
    </div>

</div>

<div class="rows">
    <div id="toolBar" style="margin-left: 60px">
        <button onclick="delEquipmentAll()" class="btn btn-danger"  type="button">
            <i class="glyphicon glyphicon-minus"></i>
            批量删除
        </button>
        <button onclick="addEquipment()" class="btn btn-danger"  type="button">
            <i class="glyphicon glyphicon-minus"></i>
            添加
        </button>
    </div>

    <%--展示用户--%>
    <div id="myTable"></div>

    <div class="modal inmodal fade" id="myModal2" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="ibox-content">
                        <div class="alert alert-info" class="col-sm-2">
                            设备数据
                        </div>
                        <form id="equipmentAdd" role="form" class="form-horizontal m-t">
                            <div class="form-group">
                                <label for="sb_name" class="col-sm-2 control-label">设备名称</label>
                                <div class="col-sm-6">
                                    <input type="hidden"  class="form-control" id="sb_id" name="sb_id">
                                    <input type="text"  class="form-control" id="sb_name" name="sb_name" placeholder="设备名称">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sb_number" class="col-sm-2 control-label">设备编号</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="sb_number" name="sb_number" placeholder="设备编号">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sb_xh" class="col-sm-2 control-label">设备型号</label>
                                <div class="col-sm-6">
                                    <input type="text"  class="form-control" id="sb_xh"  name="sb_xh" placeholder="设备型号">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group draggable">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-6 col-sm-offset-2" id="addshow">
                                    <button class="btn btn-primary" type="submit" id="add">保存内容</button>
                                </div>
                                <div class="col-sm-6 col-sm-offset-2" id="updateshow">
                                    <button class="btn btn-primary" type="submit" id="update">修改内容</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
<script>


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
        // pageList:[5, 10, 20, 50],//分页组件
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
            {field:'sb_id',title:'ID',align:'center',width:20},
            {field:'sb_name',title:'设备名称',align:'center',width:150},
            {field:'sb_number',title:'设备编号',align:'center',width:150},
            {field:'sb_xh',title:'设备型号',align:'center',width:150},
            {field:'cc',title:'操作',width:300,formatter:function(value,rows,index){
                    var str="";
                    // str+="<button class='btn btn-info dim' type='button' onclick='del(\""+rows.id+"\")' ><i class='fa fa-paste'></i>删除</button>";
                    str+="<button class='btn btn-info dim' type='button' onclick='updateEquipment(\""+rows.sb_id+"\")' ><i class='fa fa-paste'></i>修改</button>";
                    return  str;
                }
            },

        ]
    });

    function EquipmentSearch(){
        $('#myTable').bootstrapTable('refresh',{pageNumber:1});
    }


    //批量删除
    function delEquipmentAll(){
        var rows=$('#myTable').bootstrapTable('getSelections');
        if(rows.length<=0){
            // bootbox.alert('请选择删除的数据');
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


    /**
     * 添加 模态窗口
     */
    function addEquipment(){
        $("#updateshow").hide();
        $('#myModal2').modal('toggle');
    }

    /**
     * 添加方法
     */
    $("#add").click(function(){
            $.ajax({
                url:'<%=request.getContextPath() %>/equipment/addEquipment',
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
    })

    /**
     * 修改方法
     */
    $("#update").click(function(){
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
    })

    /**
     * 修改回显
     * @param sb_id
     */
    function updateEquipment(sb_id){
        $("#addshow").hide();
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
                $("#sb_id").val(data.sb_id);
                $("#sb_name").val(data.sb_name);
                $("#sb_number").val(data.sb_number);
                $("#sb_xh").val(data.sb_xh);
            }
        });
    }



</script>
</html>
