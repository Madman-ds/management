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
    <title>管理者巡检页面</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../../../jscore.jsp"></jsp:include>
<style>

    /*多选下拉框样式（根据自己的样式调整）*/
    .dropdown_item{width: 100%}
    .dropdown_item>li:HOVER{background-color: #eee;cursor: pointer;}
    .dropdown_item>li {display: block;padding: 3px 10px;clear: both;font-weight: normal;line-height: 1.428571429;color: #333;white-space: nowrap;}
    .dropdown_item>li>.check_box{width: 18px;height: 18px;vertical-align: middle;margin: 0px;}
    .dropdown_item>li>span{vertical-align: middle;}
    .select_multiple .caret{border-top: 4px solid!important;border-bottom: 0;}
</style>
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
    <%--<button class="btn btn-success" type="button" onclick="addUser()">
        <i class="glyphicon glyphicon-plus">
        </i>新增
    </button>--%>
    <button class="btn btn-danger" type="button" onclick="delALLuUser()">
        <i class="glyphicon glyphicon-minus">
        </i>删除
    </button>
    <%--<button type="button" class="btn btn-info" onclick="updateUser()">--%>
        <%--<i class="glyphicon glyphicon-wrench">--%>
        <%--</i>修改--%>
    <%--</button>--%>
</div>
<table id="userList"></table>
</body>
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <form id="">
                    <div class="dropup" style="position: relative;">
                        <button class="btn btn-default dropdown-toggle form-control select_multiple" style="width: 100%;margin-left: 0px;" type="button" id="dropdownMenu21" data-toggle="dropdown">
                            <span class="select_text" id="userselect" data-is-select="false">请选择用户</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu dropdown_item" style="bottom: auto;" id="deptMenu">
                            <%--<li><input type="checkbox" class="check_box" value="aa" /> <span>Action</span></li>--%>
                        </ul><!-- 为了方便演示，type设置text了，实际中可以设置成hidden -->
                        <input type="hidden" id="glz_user" name="glz_user" class="select_val"/>
                        <input type="hidden" id="id" name="id"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <div class="col-sm-6 col-sm-offset-2" id="updateshow">
                    <button class="btn btn-primary" type="button" id="update">赋权</button>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script type="text/javascript" >
    function initselect(){
        $.ajax({
            type: "get",
            url: "/findAll",
            // data: {
            //     // 'id' : null,
            // },
            dataType: "json",
            success: function(result){
                var data = result;
                var html = "";
                for (var i = 0; i < data.length; i++) {
                    html +='<li><input type="checkbox" class="check_box" value="'+data[i].user_id+'" /> <span>'+data[i].user_name+'</span></li>';
                }
                $("#deptMenu").append(html);
            }
        })
        // $("#userselect").html("1,22,33");
    }
    function inituser(glz_user) {
        $.ajax({
            type: "get",
            url: "/findAllbyids",
            data: {
                'ids' : glz_user,
            },
            dataType: "text",
            success: function(result){
                debugger
                $("#userselect").html(result);
            }
        })
    }
    
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
        url:"<%=request.getContextPath()%>/findGlzxj",
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
            field:"glz_id",
            title:"主键",
            visible: false,
            align:'center',
        },{
            field:"glz_name",
            title:"巡检人",
            align:'center'
        }, {
            field:"glz_data",
            title:"时间",
            align:'center',
            formatter: function (value, row, index) {
                return changeDateFormat(value);
            }
        },{
            field:"glz_count",
            title:"问题数量",
            align:'center',
        },{
            field:"glz_user",
            title:"赋权给用户",
            visible: false,
            align:'center',
        }, {
            field:"glz_tq",
            title:"提取项",
            align:'center',
            formatter: function (value, rows, index) {
                var str ="";
                if(rows.glz_tq =="1"){
                    str = "<button class='btn btn-info dim' type='button' onclick='huanyuan(\""+rows.glz_id+"\")' ><i class='fa fa-paste'></i>还原</button>"+"  ";
                }else{
                    str = "<button class='btn btn-info dim' type='button' onclick='tiqu(\""+rows.glz_id+"\")' ><i class='fa fa-paste'></i>提取</button>"+"  ";
                }
                return str;
            }
        },{field:'cc',title:'操作',align:'center',formatter:function(value,rows,index){
                var str="";
                str+="<button class='btn btn-info dim' type='button' onclick='fuquan(\""+rows.glz_id+"\",\""+rows.glz_user+"\")' ><i class='fa fa-paste'></i>赋权</button>";
                return  str;
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
            return row.glz_id;
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
                            url:"<%=request.getContextPath()%>/delAllGlzxj",
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

    function huanyuan(id){
        $.ajax({
            url:"<%=request.getContextPath()%>/huanyuanGLZ",
            data:{
                'id':id
            },
            dataType:"text",
            type:"post",
            success:function(){
                $("#userList").bootstrapTable('refresh',{pageNumber:1});
            },
            error:function(){
                BootstrapDialog.show({
                    title:"fuck！！",
                    message:'哇哦！系统走丢了！！'
                })
            }
        })
    }

    function tiqu(id){
        $.ajax({
            url:"<%=request.getContextPath()%>/tiquGLZ",
            data:{
                'id':id
            },
            dataType:"text",
            type:"post",
            success:function(){
                $("#userList").bootstrapTable('refresh',{pageNumber:1});
            },
            error:function(){
                BootstrapDialog.show({
                    title:"fuck！！",
                    message:'哇哦！系统走丢了！！'
                })
            }
        })
    }

    //赋权
    function fuquan(id,glz_user) {
        initselect();
        $("#id").val(id);
        inituser(glz_user);
        $("#glz_user").html(glz_user);
        // $("#userselect").html(glz_user);
        $('#myModal2').modal('toggle');
    }
    //赋权
    $("#update").click(function(){
        $.ajax({
            url:"<%=request.getContextPath()%>/updateFQ",
            data:{
                'glz_id':$("#id").val(),
                'glz_user':$("#glz_user").val()
            },
            dataType:"text",
            type:"post",
            success:function(){
                $("#id").val("");
                $('#myModal2').modal('hide');
                $("#userList").bootstrapTable('refresh',{pageNumber:1});
            },
            error:function(){
                BootstrapDialog.show({
                    title:"fuck！！",
                    message:'哇哦！系统走丢了！！'
                })
            }
        })
    })














    //多选下拉框实现
    $(document).on("click",".check_box",function(event){
        event.stopPropagation();//阻止事件冒泡，防止触发li的点击事件
        //勾选的项
        var $selectTextDom=$(this).parent().parent("ul").siblings("button").children(".select_text");
        //勾选项的值
        var $selectValDom=$(this).parent().parent("ul").siblings(".select_val");
        //是否有选择项了
        var isSelected=$selectTextDom[0].getAttribute("data-is-select");
        var selectText="";//文本值，用于显示
        var selectVal=$selectValDom.val();//实际值，会提交到后台的
        var selected_text=$(this).siblings("span").text();//当次勾选的文本值
        var selected_val=$(this).val();//当次勾选的实际值
        //判断是否选择过
        if(isSelected=="true"){
            selectText=$selectTextDom.text();
        }
        if(selectText!=""){
            if(selectText.indexOf(selected_text)>=0){//判断是否已经勾选过
                selectText=selectText.replace(selected_text,"").replace(",,",",");//替换掉
                selectVal=selectVal.replace(selected_val,"").replace(",,",",");//替换掉
                //判断最后一个字符是否是逗号
                if(selectText.charAt(selectText.length - 1)==","){
                    //去除末尾逗号
                    selectText=selectText.substring(0,selectText.length - 1);
                    selectVal=selectVal.substring(0,selectVal.length - 1);
                }
            }else{
                selectText+=","+selected_text;
                selectVal+=","+selected_val;
            }
        }else{
            selectText=selected_text;
            selectVal=selected_val;
        }
        $selectTextDom.text(selectText);
        $selectValDom.val(selectVal);
        if(selectText==""){
            $selectTextDom.text("请选择");
            $selectTextDom[0].setAttribute("data-is-select","false");
        }else{
            $selectTextDom[0].setAttribute("data-is-select","true");
        }
    })
</script>
</html>
