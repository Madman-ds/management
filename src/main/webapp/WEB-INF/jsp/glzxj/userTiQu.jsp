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
    <title>管理者巡检写权限管理</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../../../jscore.jsp"></jsp:include>
<%--<link href="<%=request.getContextPath() %>/static/js/bootStrap-select/multiple-select.css" rel="stylesheet">--%>
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
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="height:900px">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <form id="">
                    <div class="dropup" style="position: relative;">
                        <select id="mss" multiple="multiple">

                        </select>
                    </div>
                    <input type="hidden" id="glz_users" name="glz_user">
                    <input type="hidden" id="ids" name="id">
                </form>
            </div>
            <div class="modal-footer">
                <%--<div class="col-sm-6 col-sm-offset-2" id="updateshow">--%>
                <button class="btn btn-primary" type="button" id="updateQX">赋权</button>
                <%--</div>--%>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<table id="userListTiQu"></table>
</body>
<script type="text/javascript" src="<%=request.getContextPath() %>/static/js/bootStrap-select/multiple-select.js"></script>
<script type="text/javascript" >

    //初始化下拉多选数据
    function initselect(id,qx){
        $("#ids").val(id);
        $("#mss").find("option").remove();
        $.ajax({
            type: "get",
            url: "/findAll",
            data: {
                'user_id' : id,
            },
            dataType: "json",
            success: function(result){
                var data = result;
                var html = "";
                $.ajax({
                    type: "get",
                    url: "/findAllbyids",
                    data: {
                        'ids' : qx,
                    },
                    dataType: "text",
                    success: function(a){
                        // $("#userselect").html(result);
                        for (var i = 0; i < data.length; i++) {
                            var ar = data[i].user_id;
                            if(a.indexOf(ar) !=-1){
                                html +='<option selected value="'+data[i].user_id+'">'+data[i].user_name+'</option>';
                            }else{
                                html +='<option value="'+data[i].user_id+'">'+data[i].user_name+'</option>';
                            }
                        }
                        console.log(html);
                        $("#mss").append(html);
                        $('#mss').change(function() {
                            $("#glz_users").val($(this).val());
                        }).multipleSelect({
                            width: '100%'
                        });
                        return ;
                    }
                })

            }
        })
    }
    //
    $("#userListTiQu").bootstrapTable({
        url:"<%=request.getContextPath()%>/findAllUserGlzxj",
        contentType : "application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        //查询参数：条件查询时使用
        queryParams:function(params){
            return{
                "offset":(this.pageNumber-1)*this.pageSize,
                "limit":this.pageSize,
            }
        },
        columns:[{
            field:"user_id",
            title:"用户编号",
            visible: false,
            align:'center',
            width:50
        },{
            field:"user_name",
            title:"用户姓名",
            align:'center',
            width:50
        },{
            field:"qx",
            title:"用户姓名",
            align:'center',
            visible: false,
            width:50
        },{
            field:"",
            title:"提取",
            align:'center',
            width:200,
            formatter: function (value, rows, index) {
                var str ="";
                if(rows.top =="1"){
                    str += "<button class='btn btn-info dim' type='button' onclick='huanyuan(\""+rows.user_id+"\")' ><i class='fa fa-paste'></i>还原</button>"+"  ";
                }else{
                    str += "<button class='btn btn-info dim' type='button' onclick='tiqu(\""+rows.user_id+"\")' ><i class='fa fa-paste'></i>提取</button>"+"  ";
                }
                str += "<button class='btn btn-info dim' type='button' onclick='shanchu(\""+rows.user_id+"\")' ><i class='fa fa-paste'></i>删除</button>"+"  ";
                str += "<button class='btn btn-info dim' type='button' onclick='fuquans(\""+rows.user_id+"\",\""+rows.qx+"\")' ><i class='fa fa-paste'></i>赋权</button>"+"  ";
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

    //还原
    function huanyuan(id){
        $.ajax({
            url:"<%=request.getContextPath()%>/huanyuanUser",
            data:{
                'id':id
            },
            dataType:"text",
            type:"post",
            success:function(){
                $("#userListTiQu").bootstrapTable('refresh',{pageNumber:1});
            },
            error:function(){
                BootstrapDialog.show({
                    title:"fuck！！",
                    message:'哇哦！系统走丢了！！'
                })
            }
        })
    }

    //提取
    function tiqu(id){
        $.ajax({
            url:"<%=request.getContextPath()%>/tiquUser",
            data:{
                'id':id
            },
            dataType:"text",
            type:"post",
            success:function(){
                $("#userListTiQu").bootstrapTable('refresh',{pageNumber:1});
            },
            error:function(){
                BootstrapDialog.show({
                    title:"fuck！！",
                    message:'哇哦！系统走丢了！！'
                })
            }
        })
    }

    //删除
    function shanchu(id){
        $.ajax({
            url:"<%=request.getContextPath()%>/delUserGlzxj",
            data:{
                'id':id
            },
            dataType:"text",
            type:"post",
            success:function(){
                // location.reload()
                $("#userListTiQu").bootstrapTable('refresh',{pageNumber:1});
            },
            error:function(){
                BootstrapDialog.show({
                    title:"fuck！！",
                    message:'哇哦！系统走丢了！！'
                })
                location.reload()
            }
        })
    }

    //赋权模态窗口
    function fuquans(id,qx) {
        $('#myModal3').modal('toggle');
        initselect(id,qx);
    }
    //赋权按钮事件
    $("#updateQX").click(function(){
        $.ajax({
            url:"<%=request.getContextPath()%>/updateFQuserGlzxj",
            data:{
                'glz_id':$("#ids").val(),
                'glz_user':$("#glz_users").val()
            },
            dataType:"text",
            type:"post",
            success:function(){
                $("#ids").val("");
                $("#glz_users").val("");
                $('#myModal3').modal('hide');
                alert("操作成功!");
                location.reload();
            },
            error:function(){
                BootstrapDialog.show({
                    title:"fuck！！",
                    message:'哇哦！系统走丢了！！'
                })
            }
        })
    })



</script>
</html>
