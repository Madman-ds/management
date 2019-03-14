package com.ds.databackup.mapper;

import com.ds.databackup.pojo.DataBackup;
import com.ds.inspectionitem.pojo.UserEquipment;
import com.ds.util.ExcelDataBackup;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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

    List<ExcelDataBackup> findDataBackupExcel(DataBackup dataBackup);

    int updateTop(DataBackup dataBackup);

    UserEquipment queryByUserequipment(@Param("jcx_id") Long jcx_id, @Param("user_id") Long user_id);
}
