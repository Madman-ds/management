package com.ds.databackup.service.impl;

import com.ds.databackup.mapper.DataBackupMapper;
import com.ds.databackup.pojo.DataBackup;
import com.ds.databackup.service.DataBackupService;
import com.ds.inspectionitem.pojo.UserEquipment;
import com.ds.util.ExcelDataBackup;
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
    public int insertDataBackup(DataBackup dataBackup) {
        return dataBackupMapper.insertDataBackup(dataBackup);
    }

    @Override
    public Integer getDataBackupCount(DataBackup dataBackup) {
        return dataBackupMapper.getDataBackupCount(dataBackup);
    }

    @Override
    public List<ExcelDataBackup> findDataBackupExcel(DataBackup dataBackup) {
        return dataBackupMapper.findDataBackupExcel(dataBackup);
    }

    @Override
    public int updateTop(DataBackup dataBackup) {
        return dataBackupMapper.updateTop(dataBackup);
    }

    @Override
    public UserEquipment queryByUserequipment(Long jcx_id, Long user_id) {
        return dataBackupMapper.queryByUserequipment(jcx_id,user_id);
    }


}
