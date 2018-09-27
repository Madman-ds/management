<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>树页面</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="jscore.jsp"></jsp:include>
<body>
    <%--<div id="tree" style="width: 10%"></div>--%>

    <nav class="navbar navbar-default  navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">QQ</a>
            </div>
            <div class="navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Link0 <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">Link1</a></li>
                    <li><a href="#">Link2</a></li>
                    <li><a href="#">Link3</a></li>
                </ul>
            </div>
        </div>
    </nav>


    <!-- 流式布局 -->
    <div class="container-fluid" style="margin-top: 51px;">
        <!-- 定义布局     行 -->
        <div class="row">
            <!-- 列  -->
            <div class="col-xs-2 bg">
                <div id="tree"></div>
            </div>
            <div class="col-xs-8 bg">
                <div id="bootstrap-table">
                    <ul class="nav nav-tabs">
                        <li role="presentation" class="active"><a href="#">首页</a></li>
                    </ul>
                    <!-- 展示js打开的页面 -->
                    <div class="tab-content" id="tabs">

                    </div>
                </div>
            </div>
        </div>
    </div>





</body>
<script type="text/javascript">

    function getTree() {
        // Some logic to retrieve, or generate tree structure
        return data;
    }

    $(function(){
        $('#tree').treeview({
            data: tree,         // data is not optional
            levels: 5,
            backColor:'',
            onNodeSelected: function(event, node) {
                <%-- //js操作，新增页签--%>
                $.ajax({
                    <%--url:"<%=request.getContextPath() %>"+node.url,--%>
                    url:"<%=request.getContextPath() %>/server/queryUserAll",
                    success:function(data){
                        $.addtabs.add({
                            id:node.id,
                            title:node.text,
                            content:"111111111111111111"+data
                        })
                    }
                })
                <%-- //js操作，新增页签 --%>
            }
        });
    })



    var tree = [
        {
            text:"Parent 1",
            href:"/server/queryUser",
        },
        {
            text:"Parent 2"
        },
        {
            text:"Parent 3"
        },
        {
            text:"Parent 4"
        },
        {
            text:"Parent 5"
        }
    ];
</script>
</html>





<%--科普--%>
<%--
var options = {
    data: data, //data属性是必须的，是一个对象数组    Array of Objects.
    color: "", //所有节点使用的默认前景色，这个颜色会被节点数据上的backColor属性覆盖.        String
    backColor: "#000000", //所有节点使用的默认背景色，这个颜色会被节点数据上的backColor属性覆盖.     String
    borderColor: "#000000", //边框颜色。如果不想要可见的边框，则可以设置showBorder为false。        String
    nodeIcon: "glyphicon glyphicon-stop", //所有节点的默认图标
    checkedIcon: "glyphicon glyphicon-check", //节点被选中时显示的图标         String
    collapseIcon: "glyphicon glyphicon-minus", //节点被折叠时显示的图标        String
    expandIcon: "glyphicon glyphicon-plus", //节点展开时显示的图标        String
    emptyIcon: "glyphicon", //当节点没有子节点的时候显示的图标              String
    enableLinks: false, //是否将节点文本呈现为超链接。前提是在每个节点基础上，必须在数据结构中提供href值。        Boolean
    highlightSearchResults: true, //是否高亮显示被选中的节点        Boolean
    levels: 2, //设置整棵树的层级数  Integer
    multiSelect: false, //是否可以同时选择多个节点      Boolean
    onhoverColor: "#F5F5F5", //光标停在节点上激活的默认背景色      String
    selectedIcon: "glyphicon glyphicon-stop", //节点被选中时显示的图标     String

    searchResultBackColor: "", //当节点被选中时的背景色
    searchResultColor: "", //当节点被选中时的前景色

    selectedBackColor: "", //当节点被选中时的背景色
    selectedColor: "#FFFFFF", //当节点被选中时的前景色

    showBorder: true, //是否在节点周围显示边框
    showCheckbox: false, //是否在节点上显示复选框
    showIcon: true, //是否显示节点图标
    showTags: false, //是否显示每个节点右侧的标记。前提是这个标记必须在每个节点基础上提供数据结构中的值。
    uncheckedIcon: "glyphicon glyphicon-unchecked", //未选中的复选框时显示的图标，可以与showCheckbox一起使用
}
--%>