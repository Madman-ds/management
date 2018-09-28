<%--
  Created by IntelliJ IDEA.
  User: 段大神经
  Date: 2018/9/27
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据备份页</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../../../jscore.jsp"></jsp:include>
<body>
<div class="rows">
    <!-- 搜索 -->
    <div class="panel-body">
        <form class="form-horizontal" id="searchForm">
            <div class="form-group" >
                <label for="select_sb_name" class="col-sm-1 control-label">设备名称</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="select_sb_name" placeholder="请输入设备名称">
                </div>

                <label for="select_sb_number" class="col-sm-1 control-label">设备编号</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="select_sb_number" placeholder="请输入设备编号">
                </div>

                <label for="select_sb_xh" class="col-sm-1 control-label">设备型号</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="select_sb_xh" placeholder="请输入设备型号">
                </div>

                <div class="col-sm-2">
                    <button onclick="whereSearch()" class="btn btn-primary" type="button">
                        <i class="glyphicon glyphicon-search">
                        </i>搜索
                    </button>
                    <button onclick="resetForm()" class="btn btn-danger" type="button">
                        <i class="glyphicon glyphicon-repeat">
                        </i>重置
                    </button>
                </div>
            </div>
        </form>
    </div>

</div>

<div id="dataBackupShow" class="table table-bordered"></div>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/databackup/databackup.js"></script>
</body>
</html>
