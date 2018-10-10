package com.ds.databackup.mapper;

import com.ds.databackup.pojo.DataBackup;

import java.util.List;
import java.util.Map;

/**
 * @接口名称：DataBackupMapper
 * @作者: 段大神经
 * @创建时间: 2018/9/27 21:37
 * @说明:
 */
public interface DataBackupMapper {
    List findDataBackup(DataBackup dataBackup);

    int insertDataBackup(DataBackup dataBackup);

    int getDataBackupCount(DataBackup dataBackup);

    List<DataBackup> findDataBackupExcel(DataBackup dataBackup);
}
