package com.ds.databackup.controller;

import com.ds.databackup.pojo.DataBackup;
import com.ds.databackup.pojo.Remarks;
import com.ds.databackup.service.DataBackupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

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
     * @时间: 2018/9/27 22:04
     * @参数:  * @param dataBackup
     * @返回值: java.util.List
     **/
    @GetMapping("findDataBackup")
    public List findDataBackup(DataBackup dataBackup){
        return dataBackupService.findDataBackup(dataBackup);
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
        Long aLong = this.insertRemarks(dataBackup.getBz_nr());
        dataBackup.setBz_id(aLong);
        return dataBackupService.insertDataBackup(dataBackup);
    }
    /**
     * @作者: 段大神经
     * @功能描述: 添加日志信息返回主键
     * @时间: 2018/9/27 22:52
     * @参数:  * @param bz_nr
     * @返回值: java.lang.Long
     **/
    protected Long insertRemarks(String bz_nr){
        Remarks remarks = new Remarks();
        remarks.setBz_nr(bz_nr);
        int c = dataBackupService.insertRemarks(remarks);
        return remarks.getBz_id();
    }
}
