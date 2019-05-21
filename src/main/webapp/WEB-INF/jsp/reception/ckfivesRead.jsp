<%--
  Created by IntelliJ IDEA.
  User: qinmengchao
  Date: 2019/4/28
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>5S个人查看</title>
</head>
<jsp:include page="../../../public/jscore.jsp"></jsp:include>
<body>
<img src="./static/images/logo.png" alt=""     style="width: 60%;margin: 30px 20%;" >
<div class="modal-body">
    <center>
        <button type="button" onclick="weixian()" class="btn btn-primary">危险点点检</button>
        &nbsp;
        <button type="button" onclick="glzxjClick()" class="btn btn-primary">管理者巡检</button>
        &nbsp;
        <button type="button" onclick="tpm1200Click()" class="btn btn-primary">1200-TPM点检</button>
        &nbsp;
        <button type="button" onclick="tpm650Click()" class="btn btn-primary">650-TPM点检</button>
        &nbsp;
        <button type="button" class="btn btn-danger" onclick="showfives()">5S点检</button>
        &nbsp;
        <button type="button" class="btn btn-success" onclick="returnTo()">
            <i class="glyphicon glyphicon-hand-left"> </i>
            返回
        </button>
        <div style="margin-top: 20px">
            <table id="zjRead" border="1px" style="text-align: center;font-size: 16px">
            </table>
        </div>
        <input type="hidden" id="delTextId" />
    </center>
</div>
</body>
<script type="text/javascript">
        $("#zjRead").bootstrapTable({
            // toolbar:'#toolbar',
            url:'<%=request.getContextPath() %>/ckFivesReadList',//获取数据地址
            pagination:true, //是否展示分页
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
            columns:[{
                field:"f_fives",
                title:"5S",
                align:'center',
            },{
                field:"f_clazzify",
                title:"分类",
                align:'center',
            },{
                field:"f_content",
                title:"内容",
                align:'center',
            },{
                field:"user_name",
                title:"检查人",
                align:'center',
            },{
                field:"f_inspectdate",
                title:"检查时间",
                align:'center',
                //获取日期列的值进行转换
                formatter: function (value, row, index) {
                return changeDateFormat(value);
                }
            }],
        })

    function returnTo() {
        location.href="<%=request.getContextPath()%>/toViewList";
    }
        $('#datetimepicker').datetimepicker({
            format: 'yyyy-mm-dd hh:mm:ss',     /*此属性是显示顺序，还有显示顺序是mm-dd-yyyy*/
            language:"zh-CN",
            autoclose:true
        });
        $('#datetimeend').datetimepicker({
            format: 'yyyy-mm-dd hh:mm:ss',     /*此属性是显示顺序，还有显示顺序是mm-dd-yyyy*/
            language:"zh-CN",
            autoclose:true
        });
        //转换日期格式(时间戳转换为datetime格式)
        function changeDateFormat(cellval) {
            if (cellval != null){
                var d = new Date(cellval);;
                var times=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
                return times;
            }
        }


        //-----按钮----------S--------------------------------------------------
        function glzxjClick() {
            location.href = "<%=request.getContextPath() %>/GlzxjzjReadnew"
        }

        function weixian() {
            location.href = "<%=request.getContextPath() %>/zjRead"
        }
        function showfives(){
            location.href = "<%=request.getContextPath() %>/tockFivesRead"
        }
        function tpm1200Click() {
            location.href = "<%=request.getContextPath() %>/tozjRead1200Tpm"
        }
        function tpm650Click() {
            location.href = "<%=request.getContextPath() %>/tozjRead650Tpm"
        }
        //-----按钮----------E--------------------------------------------------
</script>
</html>
