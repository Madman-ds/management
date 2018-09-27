package com.ds.equipment.service.impl;

import com.ds.equipment.mapper.EquipmentMapper;
import com.ds.equipment.pojo.Equipment;
import com.ds.equipment.service.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @类名称: SloginServiceImpl
 * @作者: yuboyake
 * @创建时间: 2018/9/24 15:10
 * @说明:
 */
@Service
public class EquipmentServiceImpl implements EquipmentService {
    @Autowired
    private EquipmentMapper equipmentMapper;

    /**
     * @作者: yuboyake
     * @功能描述: 查询设备总条数
     * @时间: 2018/9/26 22:52
     * @参数:  * @param
     * @返回值: int
     **/
    @Override
    public int getEquipmentCount() {
        return equipmentMapper.getEquipmentCount();
    }

    /**
     * @作者: yuboyake
     * @功能描述: 查询设备
     * @时间: 2018/9/26 22:52
     * @参数:  * @param equipment
     * @返回值: java.util.List<com.ds.equipment.pojo.Equipment>
     **/
    @Override
    public List<Equipment> getEquipmentList(Equipment equipment) {
        return equipmentMapper.getEquipmentList(equipment);
    }

    @Override
    public boolean delEquipment(String ids) {
        try {
            String[] id = ids.split(",");
            equipmentMapper.delEquipment(id);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * @作者: yuboyake
     * @功能描述: 回显
     * @时间: 2018/9/26 23:59
     * @参数:  * @param id
     * @返回值: com.ds.equipment.pojo.Equipment
     **/
    @Override
    public Equipment getEquipmentById(Integer sb_id) {
        return equipmentMapper.getEquipmentidById(sb_id);
    }

    @Override
    public boolean addEquipment(Equipment equipment) {
        try {
            equipmentMapper.addEquipment(equipment);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateEquipment(Equipment equipment) {
        try {
            equipmentMapper.updateEquipment(equipment);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
