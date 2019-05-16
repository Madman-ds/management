<%--
  Created by IntelliJ IDEA.
  Tpm: 段大神经
  Date: 2018/9/27
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>TPM管理页面</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../../../public/jscore.jsp"></jsp:include>
<body>
<!-- 搜索 -->
<%--<div class="panel-body">
    <form class="form-horizontal" id="searchTpmForm">
        <div class="form-group" >
            <label for="Tpm_name" class="col-sm-2 control-label">tpm名：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="Tpm_name" placeholder="请输入设备名称">
            </div>

            <label for="Tpm_kh" class="col-sm-2 control-label">卡号：</label>
            <div class="col-sm-3">
                <input type="text" class="form-control" id="Tpm_kh" placeholder="请输入卡号">
            </div>
        </div>
        <div class="form-group col-sm-5" >

        </div>
        <div class="form-group col-sm-6" >
            <button onclick="uerSearch()" class="btn btn-primary" type="button">
                <i class="glyphicon glyphicon-search">
                </i>搜索
            </button>
            <button onclick="resetTpmForm()" class="btn btn-danger" type="button">
                <i class="glyphicon glyphicon-repeat">
                </i>重置
            </button>
        </div>
    </form>
</div>--%>
<div id="toolbar">
    <button class="btn btn-success" type="button" onclick="addTpm()">
        <i class="glyphicon glyphicon-plus">
        </i>新增
    </button>
    <button class="btn btn-danger" type="button" onclick="delALLuTpm()">
        <i class="glyphicon glyphicon-minus">
        </i>删除
    </button>
    <%--<button type="button" class="btn btn-info" onclick="updateTpm()">
        <i class="glyphicon glyphicon-wrench">
        </i>修改
    </button>--%>
</div>
<table id="TpmList"></table>
</body>
<script type="text/javascript" >
    //条件查询
    function uerSearch(){
        //点击查询，只是让表格刷新到第一页，具体查询参数，按照组装表格时候拿到的查询条件来用
        $("#TpmList").bootstrapTable('refresh',{pageNumber:1});
    }
    <%-- 回车搜索 --%>
    function enterSearch(){
        var event = arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异
        if (event.keyCode == 13){
            queryDataBackUp();
        }
    }
    //重置
    function resetTpmForm(){
        $('#searchTpmForm')[0].reset();
        uerSearch();
    }

    $("#TpmList").bootstrapTable({
        url:"<%=request.getContextPath()%>/findTpmList",
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
        },{
            field:"id",
            title:"tpm编号",
            visible: false,
            align:'center',
            width:50
        },{
            field:"name",
            title:"TPM名称",
            align:'center',
            width:200
        },{
            field:"tpm_xh",
            title:"型号",
            align:'center',
            width:200
        },{
            field:"tpm_bh",
            title:"编号",
            align:'center',
            width:200
        },
            {
                field:"tpm_whbh",
                title:"维护编号",
                align:'center',
                width:300
            },
            {
                field:"tpm_djxm",
                title:"点检项目",
                align:'center',
                width:300
            },
            {
                field:"tpm_yq",
                title:"数据/要求",
                align:'center',
                width:300
            },{
                title:"操作",
                align:'center',
                width:200,
                formatter:function(value,row,index){
                   var str ="<button class='btn btn-info warning' type='button' onclick='deleteByid(\""+row.id+"\")' >删除</button>" +
                       "&nbsp;<button class='btn btn-info dim' type='button' onclick='updateByid(\""+row.id+"\")' >修改</button>";
                    return str;
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

    //转换日期格式(时间戳转换为datetime格式)
    function changeDateFormat(cellval) {
        if (cellval != null){
            var d = new Date(cellval);;
            var times=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
            return times;
        }
    }
    //删除tpm数据
    function delALLuTpm(){
        var rows=$.map($("#TpmList").bootstrapTable('getSelections'),function(row){
            return row.id;
        });
        var arr = $("#TpmList").bootstrapTable('getData');
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
                            url:"<%=request.getContextPath()%>/delAllTpm",
                            data:{"ids":ids},
                            dataType:"text",
                            type:"post",
                            success:function(data){
                                dialogItself.close();
                                if(arr.length == rows.length){
                                    $("#TpmList").bootstrapTable('refresh',{pageNumber:1});
                                }else{
                                    $("#TpmList").bootstrapTable('refresh');
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

    //删除
    function deleteByid(id) {
        $.ajax({
            url:"<%=request.getContextPath()%>/delAllTpm",
            data:{"ids":id},
            dataType:"text",
            type:"post",
            success:function(data){
                dialogItself.close();
                if(arr.length == rows.length){
                    $("#TpmList").bootstrapTable('refresh',{pageNumber:1});
                }else{
                    $("#TpmList").bootstrapTable('refresh');
                }
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
            message: $('<div></div>').load('<%=request.getContextPath()%>/toUpdTpm?id='+id),
            buttons: [ {
                label: '保存',
                cssClass: 'btn-primary',
                action: function(dialogItself){
                    var updTpmflag=chenckupdTpmForm();
                    if(!updTpmflag){
                        return;
                    }
                    $.ajax({
                        url:"<%=request.getContextPath()%>/updTpm",
                        data:$("#updTpmForm").serialize(),
                        dataType:"text",
                        type:"post",
                        success:function(data){
                            if(data==2){
                                alert("TPM名称不可重复");
                            }else{
                                dialogItself.close();
                                $('#TpmList').bootstrapTable("refresh");
                            }
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

    //添加tpm
    function addTpm(){
        BootstrapDialog.show({
            title:"添加商品信息",
            closable: false,
            message:$('<div><div>').load('<%=request.getContextPath()%>/toInsertTpmBasics'),
            buttons:[{
                label:"提交",
                cssClass:'btn-primary',
                action:function(data){
                    var addTpmflag = chenckAddTpmForm();
                    if (!addTpmflag){
                        return;
                    }
                    $.ajax({
                        url:"<%=request.getContextPath()%>/insertTpm",
                        data:$("#addTpmForm").serialize(),
                        dataType:"text",
                        type:"post",
                        success:function(result){
                            if(result==2){
                                alert("TPM名称不可重复");
                            }else{
                                data.close();
                                $('#TpmList').bootstrapTable("refresh");
                            }
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
