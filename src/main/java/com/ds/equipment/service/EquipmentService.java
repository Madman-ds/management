package com.ds.equipment.service;

import com.ds.equipment.pojo.Equipment;

import java.util.List;

/**
 * @接口名称: EquipmentService
 * @作者: yuboyake
 * @创建时间: 2018/9/26 22:34
 * @说明:
 */
public interface EquipmentService {

    int getEquipmentCount();

    List<Equipment> getEquipmentList(Equipment equipment);

    boolean delEquipment(String ids);

    Equipment getEquipmentById(Long sb_id);

    Integer addEquipment(Equipment equipment);

    boolean updateEquipment(Equipment equipment);
}
