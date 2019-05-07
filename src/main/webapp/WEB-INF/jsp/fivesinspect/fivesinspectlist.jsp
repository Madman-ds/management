<%--
  Created by IntelliJ IDEA.
  User: qinmengchao
  Date: 2019/4/17
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>5S点检</title>
</head>
<jsp:include page="../../../public/jscore.jsp"></jsp:include>
<body>
<div class="rows">
    <div id="toolBar">
        <button onclick="addFiveSInspect()" class="btn btn-success"  type="button">
            <i class="glyphicon glyphicon-plus"></i>
            添加
        </button>
    </div>
    <%--展示5S--%>
    <div id="myTable"></div>
</body>
<script type="text/javascript">
    //查询 表格展示
    $('#myTable').bootstrapTable({
        toolbar:'#toolbar',
        url:'<%=request.getContextPath() %>/findFiveSInspect',//获取数据地址
        pagination:true, //是否展示分页
        pageList:[5, 10, 20, 50],//分页组件
        pageNumber:1,
        pageSize:5,//默认每页条数
        //search:true,//是否显示搜索框
        //searchText:'试试',//初始化搜索文字
        method:'GET',//发送请求的方式
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
//	 		return 的数据 是传递到  action类中的参数
            return {
                page:this.pageNumber,//当前页
                rows:this.pageSize //每页条数
            }
        },
        columns:[
            {checkbox:true},
            {field:'f_id',align:'center',width:50,visible: false},
            {field:'f_fives',title:'5S',align:'center',width:350},
            {field:'f_clazzify',title:'分类',align:'center',width:450},
            {field:'f_content',title:'内容',align:'center',width:350},
            {field:'cc',title:'操作',align:'center',width:350,formatter:function(value,rows,index){
                    var str="";
                        str += "<button class='btn btn-info dim' type='button' onclick='delFiveSInspect(\""+rows.f_id+"\")' ><i class='fa fa-paste'></i>删除</button>";
                        str += "<button class='btn btn-info dim' type='button' onclick='updateFiveSInspect(\""+rows.f_id+"\")' ><i class='fa fa-paste'></i>修改</button>";
                        return str;
                }
            }

        ]
    });
    //添加用户
    function addFiveSInspect(){
        BootstrapDialog.show({
            title:"添加5S",
            closable: false,
            message:$('<div><div>').load('<%=request.getContextPath()%>/toAddFiveSInspect'),
            buttons:[{
                label:"提交",
                cssClass:'btn-primary',
                action:function(data){
                    var adduserflag = chenckAddUserForm();
                    if (!adduserflag){
                        return;
                    }
                    var fives = $("#f_fives").val();
                    var clazzify = $("#f_clazzify").val();
                    var content = $("#f_content").val();
                    $.ajax({
                        url:"<%=request.getContextPath()%>/addFiveSInspect",
                        data:{
                            "f_fives":fives,"f_clazzify":clazzify,"f_content":content
                        },
                        dataType:"text",
                        type:"post",
                        success:function(){
                            data.close();
                            $("#myTable").bootstrapTable('refresh');
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
function delFiveSInspect(id){
        if(id<=0){
            BootstrapDialog.show({
                title:"温馨提示",
                message: '请选择要删除的数据'
            });
        }
            $.ajax({
                url:'<%=request.getContextPath() %>/delFiveSInspectAll',
                type:'post',
                data:{
                    ids:id
                },
                dataType:'json',
                success:function(data){
                    if (data) {
                        $("#myTable").bootstrapTable('refresh');
                    }else {
                        // bootbox.alert('删除数据失败');
                    }
                }
            })
    }
    function updateFiveSInspect(id) {
        BootstrapDialog.show({
            title: "修改5S",
            closable: false,
            message: $('<div><div>').load('<%=request.getContextPath()%>/toUpFiveSInspect?f_id='+id),
            buttons: [{
                label: "提交",
                cssClass: 'btn-primary',
                action: function (data) {
                    var upuserflag = chenckupUserForm();
                    if (!upuserflag) {
                        return;
                    }
                    var fives = $("#f_fives").val();
                    var clazzify = $("#f_clazzify").val();
                    var content = $("#f_content").val();
                    $.ajax({
                        url: "<%=request.getContextPath()%>/upFiveSInspect?f_id=" + id,
                        data: {
                            "f_fives":fives,"f_clazzify":clazzify,"f_content":content
                        },
                        dataType: "text",
                        type: "post",
                        success: function () {
                            data.close();
                            $("#myTable").bootstrapTable('refresh');
                        },
                        error: function () {
                            BootstrapDialog.show({
                                title: "fuck！！",
                                message: '哇哦！系统走丢了！！'
                            })
                        }
                    })
                }
            }, {
                label: "取消",
                cssClass: 'btn-warning',
                action: function (data) {
                    data.close();
                }
            }]
        })
    }
</script>
</html>
