package com.ds.equipment.mapper;

import com.ds.equipment.pojo.Equipment;
import com.ds.equipment.pojo.EquipmentInspectionitem;
import com.ds.inspectionitem.pojo.Inspectionitem;

import java.util.List;

/**
 * @接口名称: EquipmentMapper
 * @作者: yuboyake
 * @创建时间: 2018/9/26 22:41
 * @说明:
 */
public interface EquipmentMapper {
    int getEquipmentCount();

    List<Equipment> getEquipmentList(Equipment equipment);

    void delEquipment(String[] id);

    Equipment getEquipmentidById(Long sb_id);

    Integer addEquipment(Equipment equipment);

    void updateEquipment(Equipment equipment);

    EquipmentInspectionitem selectEquipmentInspectionitemBySbId(Long sbId);

    List findEquipmentInspectionitem(Long userId);

}
