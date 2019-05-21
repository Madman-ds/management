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
    <title>仪表台账页面</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../../../public/jscore.jsp"></jsp:include>
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
    <%--<button type="button" class="btn btn-info" onclick="updateUser()">
        <i class="glyphicon glyphicon-wrench">
        </i>修改
    </button>--%>
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
        url:"<%=request.getContextPath()%>/findYbtz",
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
            field:"ybtz_id",
            title:"主键",
            visible: false,
            align:'center',
        },{
            field:"ybtz_name",
            title:"名称",
            align:'center'
        },{
            field:"ybtz_bh",
            title:"编号",
            align:'center'
        },{
            field:"ybtz_mpa",
            title:"压力/mpa",
            align:'center'
        },{
            field:"ybtz_type",
            title:"类别",
            align:'center'
        },{
            field:"ybtz_wz",
            title:"位置",
            align:'center'
        }, {
            field:"ybtz_date",
            title:"时间",
            align:'center',
            formatter: function (value, row, index) {
                return changeDateFormat(value);
            }
        },{
            field:"ybtz_remarks",
            title:"备注",
            align:'center',
        },{
            title:"操作",
            align:'center',
            width:200,
            formatter:function(value,row,index){
                var str ="<button class='btn btn-info dim' type='button' onclick='updateByid(\""+row.ybtz_id+"\")' >修改</button>" +
                "&nbsp;<button class='btn btn-danger' type='button' onclick='deleteByid(\""+row.ybtz_id+"\")' >删除</button>";
                return str;
            }
        }
        ],
        pagination:true,
        pageNumber:1,
        pageSize:5,
        pageList:[5,10,15,20],
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
            return row.ybtz_id;
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
                            url:"<%=request.getContextPath()%>/delAllYbtz",
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
            return row.ybtz_id;
        });
        if(ids.length==1){
            var id = ids[0];
            BootstrapDialog.show({
                title:"修改页面",
                message: $('<div></div>').load('<%=request.getContextPath()%>/toUpdYbtz?ybtz_id='+id),
                buttons: [ {
                    label: '保存',
                    cssClass: 'btn-primary',
                    action: function(dialogItself){
                        var upduserflag=chenckUpdUserForm();
                        if(!upduserflag){
                            return;
                        }
                        $.ajax({
                            url:"<%=request.getContextPath()%>/updYbtz",
                            data:$("#addUserForm").serialize(),
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
            title:"添加仪表台账信息",
            closable: false,
            message:$('<div><div>').load('<%=request.getContextPath()%>/addybtz'),
            buttons:[{
                label:"提交",
                cssClass:'btn-primary',
                action:function(data){
                    var adduserflag = chenckAddUserForm();
                    if (!adduserflag){
                        return;
                    }
                    $.ajax({
                        url:"<%=request.getContextPath()%>/insertYbtz",
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


    //删除
    function deleteByid(id) {
        $.ajax({
            url:"<%=request.getContextPath()%>/delAllYbtz",
            data:{
                "ids":id
            },
            dataType:"text",
            type:"post",
            success:function(data){
                $("#userList").bootstrapTable('refresh');
            },
            error:function(){
                BootstrapDialog.show({
                    message: '系统出现BUG！请联系管理员！'
                });
            }
        })
    }

    function updateByid(id) {
        BootstrapDialog.show({
            title:"修改页面",
            message: $('<div></div>').load('<%=request.getContextPath()%>/toUpdYbtz?ybtz_id='+id),
            buttons: [ {
                label: '保存',
                cssClass: 'btn-primary',
                action: function(dialogItself){
                    var upduserflag=chenckUpdUserForm();
                    if(!upduserflag){
                        return;
                    }
                    $.ajax({
                        url:"<%=request.getContextPath()%>/updYbtz",
                        data:$("#addUserForm").serialize(),
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
    }

</script>
</html>
