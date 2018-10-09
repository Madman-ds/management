package com.ds.databackup.controller;

import com.ds.databackup.pojo.DataBackup;
import com.ds.databackup.service.DataBackupService;
import com.ds.util.DateUtil;
import com.ds.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
}
