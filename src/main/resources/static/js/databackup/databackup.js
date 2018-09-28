//查询 表格展示
$('#dataBackupShow').bootstrapTable({
    toolbar:'#toolbar',
    url:'findDataBackup',//获取数据地址
    pagination:true, //是否展示分页
    pageList:[5, 10, 20, 50],//分页组件
    pageNumber:1,
    pageSize:5,//默认每页条数
    method:'get',//发送请求的方式
    contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
    clickToSelect: true, //是否启用点击选中行
    sidePagination:'server',//分页方式：client客户端分页，server服务端分页（*
    striped:true,
/*    queryParams:function(){
        var sb_name= $('#select_sb_name').val();
        var sb_number = $('#select_sb_number').val();
        var sb_xh = $('#select_sb_xh').val();
//	 		return 的数据 是传递到  action类中的参数
        return {
            "sb_name":sb_name,
            "sb_number":sb_number,
            "sb_xh":sb_xh,
            page:this.pageNumber,//当前页
            rows:this.pageSize //每页条数
        }
    },*/
    columns:[
        {field:'sb_name',title:'设备名称',align:'center'},
        {field:'sb_number',title:'设备编号',align:'center'},
        {field:'sb_xh',title:'设备型号',align:'center'},
        {field:'jcx_name',title:'检查项',align:'center'},
        {field:'jc_yq',title:'检查要求',align:'center'},
        {field:'jc_jg',title:'确认结果',align:'center',
            formatter: function(value,row,index){
                if (row.jc_jg==0){
                    return "正常";
                }else{
                    return "异常";
                }
            }
        },
        {field:'user_name',title:'确认人',align:'center'},
        {field:'jc_time',title:'确认时间',align:'center'},
        {field:'bz_nr',title:'备注',align:'center'}
       /*{field:'cc',title:'操作',align:'center',width:350,formatter:function(value,rows,index){
                var str="";
                // str+="<button class='btn btn-info dim' type='button' onclick='del(\""+rows.id+"\")' ><i class='fa fa-paste'></i>删除</button>";
                //str+="<button class='btn btn-info dim' type='button' onclick='updateEquipment(\""+rows.sb_id+"\")' ><i class='fa fa-paste'></i>修改</button>";
                return  str;
            }
        }*/

    ]
});