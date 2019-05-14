<%--
  Created by IntelliJ IDEA.
  User: qinmengchao
  Date: 2019/4/21
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>查询TPM写权限页面</title>
</head>
<jsp:include page="../../../public/jscore.jsp"></jsp:include>
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
        display: none;
        top: 100%;
        width: 80%;
        -webkit-box-shadow: 0 4px 5px rgba(0, 0, 0, .15);
        -moz-box-shadow: 0 4px 5px rgba(0, 0, 0, .15);
        box-shadow: 0 4px 5px rgba(0, 0, 0, .15);
    }
    li{
        list-style: none;
    }
    .ms-no-results{
        display: none;
    }
</style>
<body>
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <form id="">
                    <div class="dropup" style="position: relative;">
                        <select id="mv" multiple="multiple">

                        </select>
                    </div>
                    <input type="hidden" id="ids" name="id">
                    <input type="hidden" id="tpm_qx" name="glz_user">
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

<%--TPM--%>
    <div><table id="myTable3"></table></div>

</body>
<script type="text/javascript" src="<%=request.getContextPath() %>/static/js/bootStrap-select/multiple-select.js"></script>
<script type="text/javascript">
    //初始化下拉多选数据
    function initselect(id,qx){
        $("#ids").val(id);
        $("#mv").find("option").remove();
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
                        $("#mv").append(html);
                        $('#mv').change(function() {
                            $("#tpm_qx").val($(this).val());
                        }).multipleSelect({
                            width: '100%'
                        });
                        return ;
                    }
                })

            }
        })
    }


    //查询 表格展示
    $('#myTable3').bootstrapTable({
        url:'<%=request.getContextPath() %>/showTpmUser?user_id=${userId}',//获取数据地址
        method:'GET',//发送请求的方式
        contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        clickToSelect: true, //是否启用点击选中行
        columns:[
            {
                checkbox:true,
            },
            {
                field:"id",
                title:"tpm编号",
                visible: false,
                align:'center',
                width:50
            },
            {
                field:"tpm.tpm_xh",
                title:"型号",
                align:'center',
                width:200
            },
            {
                field:"tpm.tpm_bh",
                title:"编号",
                align:'center',
                width:200
            },
            {
                field:"tpm.tpm_whbh",
                title:"维护编号",
                align:'center',
                width:300
            },
            {
                field:"tpm.tpm_djxm",
                title:"点检项目",
                align:'center',
                width:300
            },
            {
                field:"tpm.tpm_yq",
                title:"数据/要求",
                align:'center',
                width:300
            },
            {field:'',title:'是否提取',align:'center',width:450,formatter:function(value,rows,index){
                    var str="";
                    if(rows.tq == "2"){
                        str += "<button class='btn btn-info dim' type='button' onclick='tiqu(\""+rows.id+"\")' ><i class='fa fa-paste'></i>提取</button>";
                        return str;
                    }else{
                        str += "<button class='btn btn-info dim' type='button' onclick='huanyuan(\""+rows.id+"\")' ><i class='fa fa-paste'></i>恢复</button>";
                        return str;
                    }
                }
            },
            {field:'cc',title:'操作',align:'center',width:500,formatter:function(value,rows,index){
                    var str="";
                    str+="<button class='btn btn-info dim' type='button' onclick='delTpmUser(\""+rows.id+"\")' ><i class='fa fa-paste'></i>删除</button>";
                    // str += "<button class='btn btn-info dim' type='button' onclick='fuquans(\""+rows.id+"\",\""+rows.qx+"\")' ><i class='fa fa-paste'></i>赋权</button>"+"  ";
                    return  str;
                }
            }
        ]
    });
    function tiqu(id){
        $.ajax({
            url:'<%=request.getContextPath()%>/tiquTpmUser',
            type:'POST',
            dataType:'text',
            data:{
                id:id
            },
            success:function(){
                $("#myTable3").bootstrapTable('refresh');
            },
            error: function () {
                BootstrapDialog.show({
                    title: "fuck！！",
                    message: '哇哦！系统走丢了！！'
                })
            }
        })
    }

    function huanyuan(id){
        $.ajax({
            url:'<%=request.getContextPath()%>/huanyuanTpmUser',
            type:'POST',
            dataType:'text',
            data:{
                id:id
            },
            success:function(){
                $("#myTable3").bootstrapTable('refresh');
            },
            error: function () {
                BootstrapDialog.show({
                    title: "fuck！！",
                    message: '哇哦！系统走丢了！！'
                })
            }
        })
    }

    function delTpmUser(id){
        $.ajax({
            url:'<%=request.getContextPath()%>/delTpmUser',
            type:'POST',
            dataType:'text',
            data:{
                "id":id
            },
            success:function(data){
                $("#myTable3").bootstrapTable('refresh');
            }
        })
    }


    //赋权模态窗口
    function fuquans(id,qx) {
        $('#myModal4').modal('toggle');
        initselect(id,qx);
    }
    //赋权按钮事件
    $("#updateQX").click(function(){
        $.ajax({
            url:"<%=request.getContextPath()%>/updateFQTpmUser",
            data:{
                'id':$("#ids").val(), //id
                'qx':$("#tpm_qx").val() //权限
            },
            dataType:"text",
            type:"post",
            success:function(){
                $("#ids").val("");
                $("#tpm_qx").val("");
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
