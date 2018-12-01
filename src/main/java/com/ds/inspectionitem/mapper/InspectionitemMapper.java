package com.ds.inspectionitem.mapper;

import com.ds.inspectionitem.pojo.Inspectionitem;
import com.ds.inspectionitem.pojo.UserEquipment;

import java.util.List;

/**
 * @接口名称：InspectionitemMapper
 * @作者: 段大神经
 * @创建时间: 2018/10/10 22:35
 * @说明:
 */
public interface InspectionitemMapper {
    List findAllInspectionitemBySbId(Long sb_id);

    void insertUserEquipment(UserEquipment userEquipment);

    UserEquipment selectUserequipment(UserEquipment userEquipment);

    void updUserEquipment(UserEquipment userEquipment);

    void addInspectionitem(Inspectionitem inspectionitem);

    void updateInspectionitem(Inspectionitem inspectionitem);

    int delInspectionitem(String sb_id);
}
