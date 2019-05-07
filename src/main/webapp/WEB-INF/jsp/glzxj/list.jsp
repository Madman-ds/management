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
<link href="<%=request.getContextPath() %>/static/js/bootStrap-select/multiple-select.css" rel="stylesheet">
<style>
    .ms-choice {
        display: block;
        width: 80%;
        height: 26px;
        padding: 0;
        overflow: hidden;
        cursor: pointer;
        border: 1px solid #aaa;
        text-align: left;
        white-space: nowrap;
        line-height: 26px;
        color: #444;
        text-decoration: none;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;
        background-color: #fff;
    }
    .ms-drop {
        top: 100%;
        width: 80%;
        -webkit-box-shadow: 0 4px 5px rgba(0, 0, 0, .15);
        -moz-box-shadow: 0 4px 5px rgba(0, 0, 0, .15);
        box-shadow: 0 4px 5px rgba(0, 0, 0, .15);
    }
</style>
<body>
<select  class="form-control" id="user_id" name="user_id">
    <option value = "0">--请选择--</option>
</select>
<div id="toolbar">
    <button class="btn btn-danger" type="button" onclick="delALLuUser()">
        <i class="glyphicon glyphicon-minus">
        </i>删除
    </button>
    <button class="btn btn-danger" type="button" onclick="addXieQX()">
        添加写权限
    </button>
    <button class="btn btn-danger" type="button" onclick="queryXieQX()">
        查看写权限
    </button>
</div>
<table id="userList"></table>
</body>
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <form id="">
                    <div class="dropup" style="position: relative;">
                        <select id="ms" multiple="multiple">

                        </select>
                    </div>
                    <input type="hidden" id="glz_user" name="glz_user">
                    <input type="hidden" id="id" name="id">
                </form>
            </div>
            <div class="modal-footer">
                    <button class="btn btn-primary" type="button" id="update">赋权</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="text/javascript" src="<%=request.getContextPath() %>/static/js/bootStrap-select/multiple-select.js"></script>
<script type="text/javascript" >
    $(function (){
        $.ajax({
            url:'<%=request.getContextPath() %>/fuXieQuanXian',
            async:'false',
            type:'get',
            dataType:'json',
            success:function(data){
                for (var i = 0;i < data.length;i++){
                    $("#user_id").append("<option value = '"+data[i].user_id+"'>"+data[i].user_name+"</option>")
                }
            },
            error:function(){
                BootstrapDialog.show({
                    title:"fuck！！",
                    message:'哇哦！系统走丢了！！'
                })
            }
        })
    })
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
                    str = "已提取";
                    // str = "<button class='btn btn-info dim' type='button' onclick='huanyuan(\""+rows.glz_id+"\")' ><i class='fa fa-paste'></i>还原</button>"+"  ";
                }else{
                    // str = "<button class='btn btn-info dim' type='button' onclick='tiqu(\""+rows.glz_id+"\")' ><i class='fa fa-paste'></i>提取</button>"+"  ";
                    str = "已还原";
                }
                return str;
            }
        }/*,{field:'cc',title:'操作',align:'center',formatter:function(value,rows,index){
                var str="";
                str+="<button class='btn btn-info dim' type='button' onclick='fuquan(\""+rows.glz_id+"\",\""+rows.glz_user+"\")' ><i class='fa fa-paste'></i>赋权</button>";
                return  str;
            }
        }*/
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













    // //多选下拉框实现
    // $(document).on("click",".check_box",function(event){
    //     event.stopPropagation();//阻止事件冒泡，防止触发li的点击事件
    //     //勾选的项
    //     var $selectTextDom=$(this).parent().parent("ul").siblings("button").children(".select_text");
    //     //勾选项的值
    //     var $selectValDom=$(this).parent().parent("ul").siblings(".select_val");
    //     //是否有选择项了
    //     var isSelected=$selectTextDom[0].getAttribute("data-is-select");
    //     var selectText="";//文本值，用于显示
    //     var selectVal=$selectValDom.val();//实际值，会提交到后台的
    //     var selected_text=$(this).siblings("span").text();//当次勾选的文本值
    //     var selected_val=$(this).val();//当次勾选的实际值
    //     //判断是否选择过
    //     if(isSelected=="true"){
    //         selectText=$selectTextDom.text();
    //     }
    //     if(selectText!=""){
    //         if(selectText.indexOf(selected_text)>=0){//判断是否已经勾选过
    //             selectText=selectText.replace(selected_text,"").replace(",,",",");//替换掉
    //             selectVal=selectVal.replace(selected_val,"").replace(",,",",");//替换掉
    //             //判断最后一个字符是否是逗号
    //             if(selectText.charAt(selectText.length - 1)==","){
    //                 //去除末尾逗号
    //                 selectText=selectText.substring(0,selectText.length - 1);
    //                 selectVal=selectVal.substring(0,selectVal.length - 1);
    //             }
    //         }else{
    //             selectText+=","+selected_text;
    //             selectVal+=","+selected_val;
    //         }
    //     }else{
    //         selectText=selected_text;
    //         selectVal=selected_val;
    //     }
    //     $selectTextDom.text(selectText);
    //     $selectValDom.val(selectVal);
    //     if(selectText==""){
    //         $selectTextDom.text("请选择");
    //         $selectTextDom[0].setAttribute("data-is-select","false");
    //     }else{
    //         $selectTextDom[0].setAttribute("data-is-select","true");
    //     }
    // })
    
    
    function addXieQX() {
        // var rows = $('#userList').bootstrapTable('getSelections');
        var userId = $("#user_id").val();
        /*if(rows.length <= 0){
            BootstrapDialog.show({
                title:"提示！",
                message:'请至少选择一条数据'
            })
        }else */if(userId == "0"&&userId==0){
            BootstrapDialog.show({
                title:"提示！",
                message:'请选择人员!'
            })
        }else{
            // var ids = "";
            // var fivess = "";
            // for (var i = 0;i < rows.length;i++){
            //     ids += ids == ""?rows[i].glz_id:","+rows[i].glz_id;
            // }
            $.ajax({
                url:'<%=request.getContextPath() %>/insertUserGlzxjUser',
                type:'post',
                data:{
                    "userId":userId,
                },
                dateType:'json',
                success:function(data){
                    BootstrapDialog.show({
                        title:"提示！",
                        message:'添加成功!'
                    })
                    location.reload()
                }
            })
        }
    }

    function queryXieQX() {
        BootstrapDialog.show({
            title:"查询管理者巡检写权限",
            closable: false,
            message:$('<div><div>').load('<%=request.getContextPath()%>/toShowGlzxjUser'),
            buttons:[{
                label:"关闭",
                cssClass:'btn-warning',
                action:function(data){
                    data.close();
                }
            }]
        })
    }
</script>
</html>
