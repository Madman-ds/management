package com.ds.databackup.service;

import com.ds.databackup.pojo.DataBackup;

import java.util.List;
import java.util.Map;

/**
 * @接口名称：DataBackupService
 * @作者: 段大神经
 * @创建时间: 2018/9/27 21:36
 * @说明:
 */
public interface DataBackupService {
    List findDataBackup(Map map);

    int insertDataBackup(DataBackup dataBackup);

    int getDataBackupCount(Map map);
}
