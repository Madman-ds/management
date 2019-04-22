<%--
  Created by IntelliJ IDEA.
  User: 段大神经
  Date: 2018/9/27
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>周计划管理页面</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../../../jscore.jsp"></jsp:include>
<body>
<!-- 搜索 -->
<%--<div class="panel-body">
    <form class="form-horizontal" id="searchUserForm">
        <div class="form-group" >
            <label for="user_name" class="col-sm-2 control-label">用户名：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="user_name" placeholder="请输入设备名称">
            </div>

            <label for="user_kh" class="col-sm-2 control-label">卡号：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="user_kh" placeholder="请输入卡号">
            </div>
        </div>
        <div class="form-group col-sm-5" >

        </div>
        <div class="form-group col-sm-6" >
            <button onclick="uerSearch()" class="btn btn-primary" type="button">
                <i class="glyphicon glyphicon-search">
                </i>搜索
            </button>
            <button onclick="resetUserForm()" class="btn btn-danger" type="button">
                <i class="glyphicon glyphicon-repeat">
                </i>重置
            </button>
        </div>
    </form>
</div>--%>
<div id="toolbar">
    <button class="btn btn-success" type="button" onclick="addUser()">
        <i class="glyphicon glyphicon-plus">
        </i>新增
    </button>
    <button class="btn btn-danger" type="button" onclick="delALLuUser()">
        <i class="glyphicon glyphicon-minus">
        </i>删除
    </button>
    <button type="button" class="btn btn-info" onclick="updateUser()">
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
    function resetUserForm(){
        $('#searchUserForm')[0].reset();
        uerSearch();
    }
    $("#userList").bootstrapTable({
        url:"<%=request.getContextPath()%>/findWeekPlan",
        contentType : "application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        toolbar:'#toolbar',//工具栏   显示在id为toolbar的div中
        //查询参数：条件查询时使用
        queryParams:function(params){
            return{
                "offset":(this.pageNumber-1)*this.pageSize,
                "limit":this.pageSize,
            }
        },
        columns:[{
            checkbox:true,
            formatter:stateFormatter
        },{
            field:"z_id",
            title:"用户编号",
            visible: false,
            align:'center',
        },{
            field:"z_name",
            title:"设备名称/编号",
            align:'center',
            formatter:function(value,row,index){
                return row.z_name + "(" +row.z_bh + ")" ;
            }
        }, {
            field:"z_one",
            title:"周一",
            align:'center',
            width:200
        },{
            field:"z_two",
            title:"周二",
            align:'center',
            width:200
        },{
            field:"z_three",
            title:"周三",
            align:'center',
            width:200
        },{
            field:"z_four",
            title:"周四",
            align:'center',
            width:200
        },{
            field:"z_five",
            title:"周五",
            align:'center',
            width:200
        },{
            field:"z_six",
            title:"周六",
            align:'center',
            width:200
        },{
            field:"z_sunday",
            title:"周日",
            align:'center',
            width:200
        },{
            field:"z_remarks",
            title:"备注",
            align:'center',
            width:300
        },{
            field:"z_startdate",
            title:"开始时间",
            align:'center',
            width:200,
            //获取日期列的值进行转换
            formatter: function (value, row, index) {
                return changeDateFormat(value);
            }
        },{
            field:"z_enddate",
            title:"结束时间",
            align:'center',
            width:200,
            //获取日期列的值进行转换
            formatter: function (value, row, index) {
                return changeDateFormat(value);
            }
        }
        ],
        pagination:true,
        pageNumber:1,
        pageSize:2,
        pageList:[2,4,6,8],
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
            var times=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ';
            return times;
        }
    }
    //删除用户数据
    function delALLuUser(){
        var rows=$.map($("#userList").bootstrapTable('getSelections'),function(row){
            return row.z_id;
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
                            url:"<%=request.getContextPath()%>/delAllWeekPlan",
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
    //用户修改方法
    function updateUser(){
        var ids=$.map($("#userList").bootstrapTable('getSelections'),function(row){
            return row.z_id;
        });
        if(ids.length==1){
            var id = ids[0];
            BootstrapDialog.show({
                title:"修改页面",
                message: $('<div></div>').load('<%=request.getContextPath()%>/toUpdWeekPlan?z_id='+id),
                buttons: [ {
                    label: '保存',
                    cssClass: 'btn-primary',
                    action: function(dialogItself){
                        var upduserflag=chenckUpdUserForm();
                        if(!upduserflag){
                            return;
                        }
                        $.ajax({
                            url:"<%=request.getContextPath()%>/updWeekPlan",
                            data:$("#updWeekPlan").serialize(),
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
    //添加用户
    function addUser(){
        BootstrapDialog.show({
            title:"添加商品信息",
            closable: false,
            message:$('<div><div>').load('<%=request.getContextPath()%>/addZhuJiHua'),
            buttons:[{
                label:"提交",
                cssClass:'btn-primary',
                action:function(data){
                    var adduserflag = chenckAddUserForm();
                    if (!adduserflag){
                        return;
                    }
                    $.ajax({
                        url:"<%=request.getContextPath()%>/insertZhouJiHua",
                        data:$("#addUserForm").serialize(),
                        dataType:"text",
                        type:"post",
                        success:function(){
                            data.close();
                            $("#userList").bootstrapTable('refresh');
                        },
                        error:function(){
                            BootstrapDialog.show({
                                title:"fuck！！",
                                message:'哇哦！系统走丢了！！'
                            })
                        }
                    })
                }
            },{
                label:"取消",
                cssClass:'btn-warning',
                action:function(data){
                    data.close();
                }
            }]
        })
    }



</script>
</html>
