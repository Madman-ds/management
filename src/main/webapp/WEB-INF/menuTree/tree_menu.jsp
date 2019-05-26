<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>后台管理</title>
        <!-- 引入js核心文件 -->
        <jsp:include page="../../public/jscore.jsp"></jsp:include>
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
                overflow-x:hidden;
                padding-bottom: 30px;
                /*overflow: auto;*/
                background-color: #e3e3e3;
            }
            .splitter {
                width: 5px;
                height: 100%;
                bottom: 0;
                left: 140px;
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

            .well {
                min-height: 20px;
                padding: 0px;
                margin-bottom: 20px;
                background-color: #f5f5f5;
                border: 1px solid #e3e3e3;
                border-radius: 4px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
                box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
            }
            .list_dt {
                background: #333;
                color: white;
                width: 130px;
                padding: 0 40px 0 20px;
                height: 34px;
                line-height: 34px;
                cursor: pointer;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
                position: relative;
                border-bottom: 1px solid #464646;
            }
            .list_li:hover {
                width: 130px;
                background: #4285F4;
            }
            /*
                点击之后添加样式
            */
            .clickstyle{
                width: 130px;
                background: #4285F4;
            }
            a:focus, a:hover {
                color: #23527c;
                text-decoration: none;
            }
        </style>
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
            <div class="tree well " style="padding: 0px;background: #4e4e4e;width: 130px;">
                    <dt class="list_dt">
                        <span class="_after"></span>
                        <p>危险点点检</p>
                        <i class="list_dt_icon"></i>
                    </dt>
                    <dd class="list_dd">
                        <ul>
                            <a href="<%=request.getContextPath() %>/equipment/toEquipmentList" target="mainFrame" ><li class="list_li">设备管理</li></a>
                            <a href="<%=request.getContextPath() %>/toDanger" target="mainFrame"><li class="list_li">读权限</li></a>
                            <a href="<%=request.getContextPath() %>/toDatabackUp" target="mainFrame"><li class="list_li">数据备份</li></a>
                            <a href="<%=request.getContextPath() %>/toDataTiqu" target="mainFrame"><li class="list_li">提取管理</li></a>
                            <a href="<%=request.getContextPath() %>/toInspectionItem" target="mainFrame"><li class="list_li">检查项赋权</li></a>
                        </ul>
                    </dd>

                    <dt class="list_dt">
                        <span class="_after"></span>
                        <p>用户管理</p>
                        <i class="list_dt_icon"></i>
                    </dt>
                    <dd class="list_dd">
                        <ul>
                            <a href="<%=request.getContextPath() %>/toUserList" target="mainFrame"><li class="list_li">用户管理</li></a>
                        </ul>
                    </dd>

                    <dt class="list_dt">
                        <span class="_after"></span>
                        <p>周计划</p>
                        <i class="list_dt_icon"></i>
                    </dt>
                    <dd class="list_dd">
                        <ul>
                            <a href="<%=request.getContextPath() %>/toZouJiHua" target="mainFrame"><li class="list_li">周计划</li></a>
                        </ul>
                    </dd>

                    <dt class="list_dt">
                        <span class="_after"></span>
                        <p>管理者巡检</p>
                        <i class="list_dt_icon"></i>
                    </dt>
                    <dd class="list_dd">
                        <ul>
                            <a href="<%=request.getContextPath() %>/toGlzxj" target="mainFrame"><li class="list_li">管理者巡检</li></a>
                        </ul>
                    </dd>

                    <dt class="list_dt">
                        <span class="_after"></span>
                        <p>仪表台账</p>
                        <i class="list_dt_icon"></i>
                    </dt>
                    <dd class="list_dd">
                        <ul>
                            <a href="<%=request.getContextPath() %>/toYbtz" target="mainFrame"><li class="list_li">仪表台账</li></a>
                        </ul>
                    </dd>

                    <dt class="list_dt">
                        <span class="_after"></span>
                        <p>5S管理</p>
                        <i class="list_dt_icon"></i>
                    </dt>
                    <dd class="list_dd">
                        <ul>
                            <a href="<%=request.getContextPath() %>/toFiveSInspect" target="mainFrame"><li class="list_li">5S点检</li></a>
                            <a href="<%=request.getContextPath() %>/toFiveSWrite" target="mainFrame"><li class="list_li">写操作</li></a>
                            <a href="<%=request.getContextPath() %>/toFiveSReadList" target="mainFrame"><li class="list_li">读操作</li></a>
                            <a href="<%=request.getContextPath() %>/toFiveSLog" target="mainFrame"><li class="list_li">日志记录</li></a>
                        </ul>
                    </dd>

                    <dt class="list_dt">
                        <span class="_after"></span>
                        <p>TPM管理</p>
                        <i class="list_dt_icon"></i>
                    </dt>
                    <dd class="list_dd">
                        <ul>
                            <a href="<%=request.getContextPath() %>/toTpmListM" target="mainFrame"><li class="list_li">TPM</li></a>
                            <a href="<%=request.getContextPath() %>/toTpmListMWrite" target="mainFrame"><li class="list_li">写操作</li></a>
                            <a href="<%=request.getContextPath() %>/toTpmReadList" target="mainFrame"><li class="list_li">读操作</li></a>
                            <a href="<%=request.getContextPath() %>/toTpmLog" target="mainFrame"><li class="list_li">日志记录</li></a>
                        </ul>
                    </dd>

            </div>
        </div>
        <!-- 左侧导航和正文内容的分隔线 -->
        <div class="splitter"></div>
        <!-- 正文内容部分 -->
        <div class="pageContent">
            <iframe src="<%=request.getContextPath() %>/toShowLogo" id="mainFrame" name="mainFrame" frameborder="0" width="100%" height="100%" frameBorder="0"></iframe>
        </div>
    </div>


    <script type="text/javascript">

        $(".list_dt").on("click",function () {
            $('.list_dd').stop();
            $(this).siblings("dt").removeAttr("id");
            if($(this).attr("id")=="open"){
                $(this).removeAttr("id").siblings("dd").slideUp();
            }else{
                $(this).attr("id","open").next().slideDown().siblings("dd").slideUp();
            }
        });

        $("ul li").click(function() {
            $(".list_li").removeClass('clickstyle');
            $(this).addClass(" clickstyle");
        });
    </script>
    </body>
</html>
