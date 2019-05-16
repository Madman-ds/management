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
    <title>650TPM个人查看</title>
</head>
<!-- 核心样式文件 -->
<jsp:include page="../../../public/jscore.jsp"></jsp:include>
<body>
<img src="./static/images/logo.png" alt=""     style="width: 60%;margin: 30px 20%;" >
<div class="modal-body">
    <center>
        <button onclick="returnTo()" class="btn btn-danger" type="button">
            <i class="glyphicon glyphicon-hand-left">
            </i>返回
        </button>
        <div style="margin-top: 20px">
            <table id="zjRead" border="1px" style="text-align: center;font-size: 16px">
            </table>
        </div>
        <input type="hidden" id="delTextId" />
    </center>
</div>

<script type="text/javascript" >

    $("#zjRead").bootstrapTable({
        url:"<%=request.getContextPath()%>/zjRead650Tpm",
        contentType : "application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        columns:[{
            field:"id",
            title:"tpm编号",
            visible: false,
            align:'center',
            width:50
        },
        {
            field:"tpm_xh",
            title:"型号",
            align:'center',
            width:200
        },
        {
            field:"tpm_bh",
            title:"编号",
            align:'center',
            width:200
        },
        {
            field:"tpm_whbh",
            title:"维护编号",
            align:'center',
            width:300
        },
        {
            field:"tpm_djxm",
            title:"点检项目",
            align:'center',
            width:300
        },
        {
            field:"tpm_yq",
            title:"数据/要求",
            align:'center',
            width:300
        },
        {
            field:"tpm_name",
            title:"点检人",
            align:'center',
            width:300
        },
        {
            field:"date_time",
            title:"日期",
            align:'center',
            width:300,
            formatter: function (value, row, index) {
                return changeDateFormat(value);
            }
        },
        {
            field:"tpm_is",
            title:"是否正常",
            align:'center',
            width:300,
            formatter: function (value, row, index) {
                if(row.tpm_is == 1){
                    return "正常";
                }
                return "异常";
            }
        }
        ],
        pagination:true,
        pageNumber:1,
        pageSize:5,
        pageList:[5,10,15,20],
        clickToSelect: true,
        cache搜索: false,
        sidePagination:"server"
    })

    function stateFormatter(value, row, index) {
        if (row.user_name == "admin")
            return {
                disabled : true
                //设置是否可用
                // checked : true
                //设置选中
            };
        return value;
    }
    //转换日期格式(时间戳转换为datetime格式)
    function changeDateFormat(cellval) {
        if (cellval != null){
            var d = new Date(cellval);;
            var times=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ';
            return times;
        }
    }

    function returnTo() {
        location.href="<%=request.getContextPath()%>/toViewList";
    }
</script>
</body>
</html>
