<%--
  Created by IntelliJ IDEA.
  User: qinmengchao
  Date: 2019/4/22
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../../jscore.jsp"></jsp:include>
<html>
<head>
    <title>5S日志记录</title>
</head>
<body>
    <%--展示5S--%>
    <div id="myTable"></div>
</body>
<script type="text/javascript">
    //查询 表格展示
    $('#myTable').bootstrapTable({
        toolbar:'#toolbar',
        url:'<%=request.getContextPath() %>/findFiveSInspectLog',//获取数据地址
        pagination:false, //是否展示分页
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
            {field:'f_fives',title:'5S',align:'center',width:450},
            {field:'f_clazzify',title:'分类',align:'center',width:450},
            {field:'f_content',title:'内容',align:'center',width:450},
            {field:'f_inspectuser',title:'检查人',align:'center',width:450},
            {field:'f_inspectdate',title:'检查时间',align:'center',width:450},
            {field:'f_ifmeet',title:'是否满意',align:'center',width:450,formatter:function(value,rows,index){
                    var str="";
                    if(rows.ifextract == "0"){
                        str += "不满意";
                        return str;
                    }else if(rows.ifextract == "1"){
                        str += "满意";
                        return str;
                    }else{
                        str += "";
                        return str;
                    }
                }}
        ]
    });
</script>
</html>
