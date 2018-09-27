<%--
  Created by IntelliJ IDEA.
  User: 35386
  Date: 2018/9/26
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../../../jscore.jsp"></jsp:include>
<body>
<div class="rows">
    <div id="toolBar">
        <button onclick="delTeacherAll()" class="btn btn-danger"  type="button">
            <i class="glyphicon glyphicon-minus"></i>
            批量删除
        </button>
    </div>

    <%--展示用户--%>
    <div id="myTable"></div>
</div>
</body>
<script>

    //查询 表格展示
    $('#myTable').bootstrapTable({
        toolbar:'#toolbar',
        url:'<%=request.getContextPath() %>/equipment/getEquipmentList',//获取数据地址
        pagination:true, //是否展示分页
        pageList:[5, 10, 20, 50],//分页组件
        pageNumber:1,
        pageSize:5,//默认每页条数
        //search:true,//是否显示搜索框
        //searchText:'试试',//初始化搜索文字
        method:'post',//发送请求的方式
        contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码

        showColumns:false,//是否显示 内容列下拉框
        showToggle:false,//是否显示 切换试图（table/card）按钮
        showPaginationSwitch:false,//是否显示 数据条数选择框
        showRefresh:false,//是否显示刷新按钮
        detailView:false,//设置为 true 可以显示详细页面模式。
        showFooter:false,//是否显示列脚
        clickToSelect: true, //是否启用点击选中行
        sidePagination:'server',//分页方式：client客户端分页，server服务端分页（*
        // striped:true,
//         queryParams:function(){
//             var searchTname= $('#searchTname').val();
//             var titleHonorId = $('#searchtitleHonorId').val();
//             var StartTime = $('#StartTime').val();
//             var EndTime = $('#EndTime').val();
// //	 		return 的数据 是传递到  action类中的参数
//             return {
//                 "tname":searchTname,
//                 "titleHonorId":titleHonorId,
//                 "StartTime":StartTime,
//                 "EndTime":EndTime,
//                 page:this.pageNumber,//当前页
//                 rows:this.pageSize //每页条数
//             }
//         },
        columns:[
            {checkbox:true},
            {field:'sb_id',title:'ID',align:'center',width:150},
            {field:'sb_name',title:'设备名称',align:'center',width:150},
            {field:'sb_number',title:'设备编号',align:'center',width:150},
            {field:'sb_xh',title:'设备型号',align:'center',width:150},
            {field:'cc',title:'操作',width:300,formatter:function(value,rows,index){
                    var str="";
                    // str+="<button class='btn btn-info dim' type='button' onclick='del(\""+rows.id+"\")' ><i class='fa fa-paste'></i>删除</button>";
                    str+="<button class='btn btn-info dim' type='button' onclick='updateUser(\""+rows.id+"\")' ><i class='fa fa-paste'></i>修改</button>";
                    return  str;
                }
            },

        ]
    });

    function userSearch(){
        $('#myTable').bootstrapTable('refresh',{pageNumber:1});
    }


    //批量删除
    function delTeacherAll(){
        var rows=$('#myTable').bootstrapTable('getSelections');
        if(rows.length<=0){
            // bootbox.alert('请选择删除的数据');
        }else{
            var ids ="";
            for (var i = 0; i < rows.length; i++) {
                ids += ids == "" ? rows[i].sb_id : "," + rows[i].sb_id;
            }
            $.ajax({
                url:'<%=request.getContextPath() %>/equipment/delEquipment',
                type:'post',
                data:{
                    ids:ids
                },
                dataType:'json',
                success:function(data){
                    if (data) {
                        userSearch();
                    }else {
                        // bootbox.alert('删除数据失败');
                    }
                }
            })
        }
    }

</script>
</html>
