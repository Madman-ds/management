<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>后台管理</title>
        <!-- 核心样式文件 -->
        <link href="<%=request.getContextPath() %>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/js/bootstrap-treeview/dist/bootstrap-treeview.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/js/bootStrap-addTabs/bootstrap.addtabs.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/js/bootstrap-table/dist/bootstrap-table.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/js/bootstrap-dialog/dist/css/bootstrap-dialog.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath() %>/js/bootstrap-fileinput/css/fileinput.min.css" rel="stylesheet">
        <!-- 核心js文件 -->
        <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-treeview/dist/bootstrap-treeview.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootStrap-addTabs/bootstrap.addtabs.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-table/dist/bootstrap-table.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-table/dist/locale/bootstrap-table-zh-CN.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-dialog/dist/js/bootstrap-dialog.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-fileinput/js/fileinput.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-fileinput/js/locales/zh.js"></script>
    </head>
<style type="text/css">
    body {
        padding: 20px;
    }

    .headLeft {
        float: left;
    }

    .headRight {
        padding-top: 40px;
        padding-left: 340px;
    }

    .search {
        margin-bottom: 10px;
    }

    .search .toolbar {}
</style>
<!--必须使用较新版本的BootStrap才有如下效果-->

<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <a class="navbar-brand " href="#">后台管理系统</a>
                    </div>
                    <div id="navbar" class="navbar-right">
                        <a class="navbar-brand" href="#">当前用户：xx</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="row" style="padding-top: 45px">
        <div class="col-md-3">
            <div class="list-group">
                <!--激活，作为标题-->
                <a href="#" class="list-group-item active ">
                    系统菜单
                </a>
                <a href="#" class="list-group-item">设备管理</a>
                <a href="#" class="list-group-item">检查项赋权</a>
                <a href="#" class="list-group-item">用户管理</a>
                <a href="#" class="list-group-item">数据备份</a>
            </div>
        </div>
        <div class="col-md-9">
            <div>
                <ol class="breadcrumb">
                    <li><span class="glyphicon glyphicon-home"></span>&nbsp;
                        <a href="#">主页</a>
                    </li>
                    <li class="active"></li>
                </ol>
            </div>
            <div align="center" style="padding-top: 50px;">
                <h1>热等静压安全管理系统</h1>
            </div>
        </div>
    </div>
</div>
</body>
</html>
