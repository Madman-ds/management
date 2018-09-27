package com.ds.equipment.mapper;

import com.ds.equipment.pojo.Equipment;

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

    Equipment getEquipmentidById(Integer sb_id);

    void addEquipment(Equipment equipment);

    void updateEquipment(Equipment equipment);
}
