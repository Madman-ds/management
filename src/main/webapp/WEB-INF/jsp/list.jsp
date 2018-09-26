<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>后台管理</title>
        <style>
            body {
                width: 100%;
                height: 100%;
                margin: 0;
                overflow: hidden;
                background-color: #FFFFFF;
                font-family: "Microsoft YaHei", sans-serif;
            }
            .pageSidebar{
                width: 240px;
                height:100%;
                padding-bottom: 30px;
                overflow: auto;
                background-color: #e3e3e3;
            }
            .splitter {
                width: 5px;
                height: 100%;
                bottom: 0;
                left: 240px;
                position: absolute;
                overflow: hidden;
                background-color: #fff;
            }
            .pageContent{
                height: 100%;
                min-width: 768px;
                left: 246px;
                top: 0;
                right: 0;
                z-index: 3;
                padding-bottom: 30px;
                position: absolute;
            }
            .pageContainer{
                bottom: 0;
                left:0;
                right: 0;
                top: 53px;
                overflow: auto;
                position: absolute;
                width: 100%;
            }
            .footer {
                width: 100%;
                height: 30px;
                line-height: 30px;
                margin-top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                position: absolute;
                z-index: 10;
                background-color:#DFDFDF;
            }
        </style>

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
    <body>
    <!--顶部导航栏部分-->
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" title="logoTitle" href="#">后台管理系统</a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li role="presentation">
                        <a href="#">当前用户：<span class="badge">${user.user_name}</span></a>
                    </li>
                    <li>
                        <a href="logout">
                            <span class="glyphicon glyphicon-lock"></span>退出登录</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- 中间主体内容部分 -->
    <div class="pageContainer">
        <!-- 左侧导航栏 -->
        <div class="pageSidebar">
            <ul class="nav nav-stacked nav-pills">
                <li role="presentation">
                    <a href="<%=request.getContextPath() %>/equipment/toEquipmentList" target="mainFrame" >设备管理</a>
                </li>
                <li role="presentation">
                    <a href="nav2.html" target="mainFrame">检查项赋权</a>
                </li>
                <li role="presentation">
                    <a href="nav3.html" target="mainFrame">用户管理</a>
                </li>
                <li role="presentation">
                    <a href="nav3.html" target="mainFrame">数据备份</a>
                </li>
            </ul>
        </div>
        <!-- 左侧导航和正文内容的分隔线 -->
        <div class="splitter"></div>
        <!-- 正文内容部分 -->
        <div class="pageContent">
            <iframe src="/images/logo.jpg" id="mainFrame" name="mainFrame" frameborder="0" width="100%" height="100%" frameBorder="0"></iframe>
        </div>
    </div>
    <!-- 选中蓝条 -->
    <script>
        $(".nav li").click(function() {
            $(".active").removeClass('active');
            $(this).addClass("active");
        });
    </script>
</body>
</html>
