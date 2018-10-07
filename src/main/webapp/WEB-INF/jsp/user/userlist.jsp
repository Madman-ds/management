<%--
  Created by IntelliJ IDEA.
  User: 段大神经
  Date: 2018/9/27
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理页面</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../../../jscore.jsp"></jsp:include>
<body>
<!-- 搜索 -->
    <div class="panel-body">
        <form class="form-horizontal" id="searchUserForm">
            <div class="form-group" >
                <label for="user_name" class="col-sm-1 control-label">用户名：</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="user_name" placeholder="请输入设备名称">
                </div>

                <label for="user_kh" class="col-sm-1 control-label">卡号：</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="user_kh" placeholder="请输入卡号">
                </div>
                <div class="col-sm-2">
                    <button onclick="uerSearch()" class="btn btn-primary" type="button">
                        <i class="glyphicon glyphicon-search">
                        </i>搜索
                    </button>
                    <button onclick="resetUserForm()" class="btn btn-danger" type="button">
                        <i class="glyphicon glyphicon-repeat">
                        </i>重置
                    </button>
                </div>
            </div>
        </form>
    </div>
    <div id="toolbar">
        <button class="btn btn-success" type="button" onclick="addcomm()">
            <i class="glyphicon glyphicon-plus">
            </i>新增
        </button>
        <button class="btn btn-danger" type="button" onclick="delALLuUser()">
            <i class="glyphicon glyphicon-minus">
            </i>删除
        </button>
        <button type="button" class="btn btn-info" onclick="updatecomm()">
            <i class="glyphicon glyphicon-wrench">
            </i>修改
        </button>
    </div>
    <table id="userList"></table>
</body>
<script type="text/javascript" >
    //条件查询
    function uerSearch(){
        //点击查询，只是让表格刷新到第一页，具体查询参数，按照组装表格时候拿到的查询条件来用
        $("#userList").bootstrapTable('refresh',{pageNumber:1});
    }
    <%-- 回车搜索 --%>
    function enterSearch(){
        var event = arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异
        if (event.keyCode == 13){
            queryDataBackUp();
        }
    }
    //重置
    function reset_table(){
        $('#searchUserForm')[0].reset();
    }
    $("#userList").bootstrapTable({
        url:"<%=request.getContextPath()%>/findAllUser",
        contentType : "application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        toolbar:'#toolbar',//工具栏   显示在id为toolbar的div中
        //查询参数：条件查询时使用
        queryParams:function(params){

            var user_name = $("#user_name").val();
            var user_kh = $("#user_kh").val();

            return{
                "user_name":user_name,
                "user_kh":user_kh,
                "offset":(this.pageNumber-1)*this.pageSize,
                "limit":this.pageSize,
            }
        },
        columns:[{
            checkbox:true,
            formatter:stateFormatter
        },{
            field:"user_id",
            title:"用户编号",
            visible: false
        },{
            field:"user_name",
            title:"用户名"
        },{
            field:"password",
            title:"密码"
        },
            {
            field:"user_kh",
            title:"卡号"
        },{
            field:"is_management",
            title:"角色",
            formatter:function(value,row,index){
                if (value == 1){
                    return "管理员";
                } else if(value == 2){
                    return "普通员工";
                }
            }
        },{
            field:"create_time",
            title:"创建时间",
            //获取日期列的值进行转换
            formatter: function (value, row, index) {
                return changeDateFormat(value);
            }
        }],
        pagination:true,
        pageNumber:1,
        pageSize:5,
        pageList:[2,4,6,20],
        clickToSelect: true,
        cache搜索: false,
        sidePagination:"server"
    })
    function stateFormatter(value, row, index) {
        if (row.user_name == "admin")
            return {
                disabled : true
                //设置是否可用
               // checked : true
                //设置选中
            };
        return value;
    }
    //转换日期格式(时间戳转换为datetime格式)
    function changeDateFormat(cellval) {
        if (cellval != null){
            var d = new Date(cellval);;
            var times=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
            return times;
        }
    }
    //删除用户数据
    function delALLuUser(){
        var rows=$.map($("#userList").bootstrapTable('getSelections'),function(row){
            return row.user_id;
        });
        var arr = $("#userList").bootstrapTable('getData');
        var ids = rows.join(",");
        if(ids!="" && ids.length>0){
            BootstrapDialog.show({
                title:"删除确认",
                message:"确定要删除吗？",
                buttons: [ {
                    label: '确认',
                    cssClass: 'btn-primary',
                    action: function(dialogItself){
                        $.ajax({
                            url:"<%=request.getContextPath()%>/delAllUser",
                            data:{"ids":ids},
                            dataType:"text",
                            type:"post",
                            success:function(data){
                                dialogItself.close();
                                if(arr.length == rows.length){
                                    $("#userList").bootstrapTable('refresh',{pageNumber:1});
                                }else{
                                    $("#userList").bootstrapTable('refresh');
                                }
                            },
                            error:function(){
                                BootstrapDialog.show({
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
                message: '请选择要删除的数据'
            });
        }
    }
</script>
</html>
