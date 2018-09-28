package com.ds.databackup.service.impl;

import com.ds.databackup.mapper.DataBackupMapper;
import com.ds.databackup.pojo.DataBackup;
import com.ds.databackup.service.DataBackupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @类名称：DataBackupServiceImpl
 * @作者: 段大神经
 * @创建时间: 2018/9/27 21:36
 * @说明:
 */
@Service
public class DataBackupServiceImpl implements DataBackupService {
    @Autowired
    private DataBackupMapper dataBackupMapper;

    @Override
    public List findDataBackup(Map map) {
        return dataBackupMapper.findDataBackup(map);
    }

    @Override
    public int insertDataBackup(DataBackup dataBackup) {
        return dataBackupMapper.insertDataBackup(dataBackup);
    }

    @Override
    public int getDataBackupCount(Map map) {
        return dataBackupMapper.getDataBackupCount(map);
    }
}
