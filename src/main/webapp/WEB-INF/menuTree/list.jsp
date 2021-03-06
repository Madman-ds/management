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
                width: 140px;
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
                left: 146px;
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

        </style>
    <!-- 引入js核心文件 -->
    <jsp:include page="../../public/jscore.jsp"></jsp:include>
    </head>
    <body>
    <!--顶部导航栏部分-->
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" title="logoTitle" href="#">
                    <div style="float: left"><img class="img-responsive" src="<%=request.getContextPath() %>/static/images/logo.png" style="width: 200px;height: auto"></div>
                    <div style="float: left;margin-left: 300px">后台管理系统</div>
                </a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li role="presentation">
                        <a href="#">当前用户：<span class="badge">${user.user_name}</span></a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() %>/logout">
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
                    <a href="<%=request.getContextPath() %>/toInspectionItem" target="mainFrame">检查项赋权</a>
                </li>
                <li role="presentation">
                    <a href="<%=request.getContextPath() %>/toDanger" target="mainFrame">危险点读权限管理</a>
                </li>
                <li role="presentation">
                    <a href="<%=request.getContextPath() %>/toUserList" target="mainFrame">用户管理</a>
                </li>
                <li role="presentation">
                    <a href="<%=request.getContextPath() %>/toDatabackUp" target="mainFrame">数据备份</a>
                </li>
                <li role="presentation">
                    <a href="<%=request.getContextPath() %>/toDataTiqu" target="mainFrame">提取管理</a>
                </li>
                <li role="presentation">
                    <a href="<%=request.getContextPath() %>/toZouJiHua" target="mainFrame">周计划</a>
                </li>
                <li role="presentation">
                    <a href="<%=request.getContextPath() %>/toGlzxj" target="mainFrame">管理者巡检</a>
                </li>
                <li role="presentation">
                    <a href="<%=request.getContextPath() %>/toYbtz" target="mainFrame">仪表台账</a>
                </li>
                <li role="presentation">
                    <a href="<%=request.getContextPath() %>/toFiveSInspect" target="mainFrame">5S点检</a>
                </li>
                <li role="presentation">
                    <a href="<%=request.getContextPath() %>/toFiveSWrite" target="mainFrame">5S写操作管理</a>
                </li>
                <li role="presentation">
                    <a href="<%=request.getContextPath() %>/toFiveSReadList" target="mainFrame">5S读操作管理</a>
                </li>
                <li role="presentation">
                    <a href="<%=request.getContextPath() %>/toFiveSLog" target="mainFrame">5S日志记录</a>
                </li>

            </ul>
        </div>
        <!-- 左侧导航和正文内容的分隔线 -->
        <div class="splitter"></div>
        <!-- 正文内容部分 -->
        <div class="pageContent">
            <iframe src="<%=request.getContextPath() %>/toShowLogo" id="mainFrame" name="mainFrame" frameborder="0" width="100%" height="100%" frameBorder="0"></iframe>
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
