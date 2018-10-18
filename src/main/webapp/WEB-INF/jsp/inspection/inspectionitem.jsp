<%--
  Created by IntelliJ IDEA.
  User: 段大神经
  Date: 2018/9/27
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>检查项赋权页面</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../../../jscore.jsp"></jsp:include>
<body>
    <div class="rows">
        <!-- 搜索 -->
        <div class="panel-body">
            <form class="form-horizontal" id="searchForms">
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
                        <button onclick="whereSearchs()" class="btn btn-primary" type="button">
                            <i class="glyphicon glyphicon-search">
                            </i>搜索
                        </button>
                        <button onclick="resetForms()" class="btn btn-danger" type="button">
                            <i class="glyphicon glyphicon-repeat">
                            </i>重置
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%--主展示--%>
    <div id="myTables"></div>

    </div>
</body>
<script type="text/javascript">
    //重置
    function resetForms(){
        $("#searchForms")[0].reset();
        whereSearch();
    }
    //条件查询
    function whereSearchs(){
        $("#myTables").bootstrapTable('refresh',{pageNumber:1});
    }
    <%-- 回车搜索 --%>
    function enterSearch(){
        var event = arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异
        if (event.keyCode == 13){
            whereSearch();
        }
    }

    //查询 表格展示
    $('#myTables').bootstrapTable({
        toolbar:'#toolbar',
        url:'<%=request.getContextPath() %>/equipment/getEquipmentList',//获取数据地址
        pagination:true, //是否展示分页
        pageList:[5, 10, 20, 50],//分页组件
        pageNumber:1,
        pageSize:5,//默认每页条数
        method:'post',//发送请求的方式
        contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        clickToSelect: true, //是否启用点击选中行
        sidePagination:'server',//分页方式：client客户端分页，server服务端分页（*
        striped:true,
        queryParams:function(){
            var sb_name= $('#select_sb_name').val();
            var sb_number = $('#select_sb_number').val();
            var sb_xh = $('#select_sb_xh').val();
            return {
                "sb_name":sb_name,
                "sb_number":sb_number,
                "sb_xh":sb_xh,
                page:this.pageNumber,//当前页
                rows:this.pageSize //每页条数
            }
        },
        columns:[
            {field:'sb_id',title:'ID',align:'center',visible: false},
            {field:'sb_name',title:'设备名称',align:'center',width:350},
            {field:'sb_number',title:'设备编号',align:'center',width:450},
            {field:'sb_xh',title:'设备型号',align:'center',width:350},
            {field:'cc',title:'操作',align:'center',width:350,formatter:function(value,rows,index){
                    var str="";
                    str+="<button class='btn btn-info dim' type='button' onclick='jcxfq(\""+rows.sb_id+"\")' ><i class='fa fa-paste'></i>检查项赋权</button>"+"  ";
                    str+="<button class='btn btn-info dim' type='button' onclick='updateEquipment112(\""+rows.sb_id+"\")' ><i class='fa fa-paste'></i>查看设备详细信息</button>";
                    return  str;
                }
            }

        ]
    });
    //检查项赋权触发，去检查项赋权页面
    function jcxfq(id) {
        if(id != ""){
            BootstrapDialog.show({
                title:"检查项赋权",
                message: $('<div></div>').load('<%=request.getContextPath()%>/toJcxfq?sb_id='+id),
                buttons: [ {
                    label: '保存',
                    cssClass: 'btn-primary',
                    action: function(dialogItself){
                        if (!chenckValue()) {
                            return ;
                        }
                        var arr = $.map($("#jcxzw").bootstrapTable('getSelections'),function(row){
                            return row.jcx_id;
                        });
                        var itemArr = [];
                        $("#rightSelect input[type='checkbox']").each(function(i,item){
                            itemArr.push($(item).val())
                        })
                        var arr =  JSON.stringify(arr);
                        var itemArr = JSON.stringify(itemArr);
                        $.ajax({
                            url:"<%=request.getContextPath() %>/toUserSetJcxQx",
                            data:{
                                "jcx":arr,
                                "xqx":$("#userSelect").val(),
                                "dqx":itemArr
                            },
                            dataType:"text",
                            type:"post",
                            success:function(data){
                                dialogItself.close();
                                $('#userList').bootstrapTable("refresh");
                            },
                            error:function(){
                                BootstrapDialog.show({
                                    title:"温馨提示",
                                    message: '系统出现BUG！请联系管理员！'
                                });
                            }
                        })
                    }
                }, {
                    label: '取消',
                    cssClass: 'btn-warning ',
                    action: function(dialogItself){
                        dialogItself.close();
                    }
                }]
            });
        }else{
            BootstrapDialog.show({
                title:"温馨提示",
                message: '请选择一行进行修改'
            });
        }
    }
</script>
</html>
