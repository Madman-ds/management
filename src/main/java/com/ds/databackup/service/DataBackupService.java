package com.ds.databackup.service;

import com.ds.databackup.pojo.DataBackup;
import com.ds.databackup.pojo.Remarks;

import java.util.List;

/**
 * @接口名称：DataBackupService
 * @作者: 段大神经
 * @创建时间: 2018/9/27 21:36
 * @说明:
 */
public interface DataBackupService {
    List findDataBackup(DataBackup dataBackup);

    int insertRemarks(Remarks remarks);

    int insertDataBackup(DataBackup dataBackup);
}
