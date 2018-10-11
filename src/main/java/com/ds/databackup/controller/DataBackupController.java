package com.ds.databackup.controller;

import com.ds.databackup.pojo.DataBackup;
import com.ds.databackup.service.DataBackupService;
import com.ds.util.DateUtil;
import com.ds.util.ExportExcelUtil;
import com.ds.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ds.util.ExportExcelUtil.EXCEl_FILE_2007;

/**
 * @类名称：DataBackup
 * @作者: 段大神经
 * @创建时间: 2018/9/27 21:34
 * @说明: 数据备份控制类
 */
@RestController
public class DataBackupController {
    @Autowired
    private DataBackupService dataBackupService;
    /**
     * @作者: 段大神经
     * @功能描述: 条件查询数据备份
     * @时间: 2018/9/28 21:04
     * @参数:  * @param dataBackup
     * @返回值: com.ds.util.PageUtil
     **/
    @GetMapping("findDataBackup")
    public PageUtil findDataBackup(DataBackup dataBackup){
        Integer count = dataBackupService.getDataBackupCount(dataBackup);
        List<DataBackup> list = dataBackupService.findDataBackup(dataBackup);
        PageUtil page = new PageUtil();
        page.setRows(list);
        page.setTotal(count);
        return page;
    }
    /**
     * @作者: 段大神经
     * @功能描述: 添加数据备份记录
     * @时间: 2018/9/27 22:56
     * @参数:  * @param dataBackup
     * @返回值: int
     **/
    @PostMapping("insertDataBackup")
    public int insertDataBackup(DataBackup dataBackup){
        return dataBackupService.insertDataBackup(dataBackup);
    }

    /**
     * @作者: yuboyake
     * @功能描述: 导出设备信息
     * @时间: 2018/10/10 22:47
     * @参数:  * @param dataBackup
     * @param response
     * @返回值: void
     **/
    @GetMapping("ExportDataBackup")
    public void ExportDataBackup(DataBackup dataBackup,HttpServletResponse response) throws IOException {
        List<DataBackup> list = dataBackupService.findDataBackupExcel(dataBackup);
        if(list != null){
            ExportExcelUtil<DataBackup> export = new ExportExcelUtil<DataBackup>();
            String[] title = {"设备名称","设备编号","设备型号","检查项","检查要求","确认结果","确认人","确认时间","备注"};
            String fileName = DateUtil.dateToString(new Date(),"yyyyMMddHHmmss") +"shebei";
            export.exportExcel(fileName,"用户",title,list,response,EXCEl_FILE_2007);
        }
    }
}
