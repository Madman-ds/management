package com.ds.databackup.service.impl;

import com.ds.databackup.mapper.DataBackupMapper;
import com.ds.databackup.pojo.DataBackup;
import com.ds.databackup.pojo.Remarks;
import com.ds.databackup.service.DataBackupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public List findDataBackup(DataBackup dataBackup) {
        return dataBackupMapper.findDataBackup(dataBackup);
    }

    @Override
    public int insertRemarks(Remarks remarks) {
        return dataBackupMapper.insertRemarks(remarks);
    }

    @Override
    public int insertDataBackup(DataBackup dataBackup) {
        return dataBackupMapper.insertDataBackup(dataBackup);
    }
}
