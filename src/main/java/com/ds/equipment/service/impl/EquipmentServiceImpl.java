package com.ds.equipment.service.impl;

import com.ds.attributes.mapper.AttributesMapper;
import com.ds.attributes.pojo.Attributes;
import com.ds.equipment.mapper.EquipmentMapper;
import com.ds.equipment.pojo.Equipment;
import com.ds.equipment.pojo.EquipmentInspectionitem;
import com.ds.equipment.pojo.EquipmentRead;
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
    @Autowired
    private AttributesMapper attributesMapper;

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

    /**
     * @作者: yuboyake
     * @功能描述: 批量删除
     * @时间: 2018/9/28 6:36
     * @参数:  * @param ids
     * @返回值: boolean
     **/
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
    public Equipment getEquipmentById(Long sb_id) {
        List<Attributes> list = attributesMapper.findAllAttributesSbId(sb_id);
        Equipment equipment = equipmentMapper.getEquipmentidById(sb_id);
        equipment.setList(list);
        return equipment;
    }

    /**
     * @作者: yuboyake
     * @功能描述: 添加
     * @时间: 2018/9/28 6:36
     * @参数:  * @param equipment
     * @返回值: boolean
     **/
    @Override
    public Integer addEquipment(Equipment equipment) {
        try {
            return equipmentMapper.addEquipment(equipment);
           //  equipment.getSb_id();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * @作者: yuboyake
     * @功能描述: 修改
     * @时间: 2018/9/28 6:36
     * @参数:  * @param equipment
     * @返回值: boolean
     **/
    @Override
    public int updateEquipment(Equipment equipment) {
            return equipmentMapper.updateEquipment(equipment);
    }

    @Override
    public EquipmentInspectionitem selectEquipmentInspectionitemBySbId(Long sbId) {
        return equipmentMapper.selectEquipmentInspectionitemBySbId(sbId);
    }

    @Override
    public List findEquipmentInspectionitem(Long userId) {
        return equipmentMapper.findEquipmentInspectionitem(userId);
    }

    @Override
    public List findReadEquipmentInspectionitem(Long userId) {
        return equipmentMapper.findReadEquipmentInspectionitem(userId);
    }

    /**
     * @作者: 老西儿
     * @功能描述: 危险点点检授权数据
     * @时间: 2019/5/1 1:15
     * @参数:  * @param equipmentRead
     * @返回值: java.util.List
     **/
    @Override
    public List showEquipmentReadList(EquipmentRead equipmentRead) {
        return equipmentMapper.showEquipmentReadList(equipmentRead);
    }

    @Override
    public List showHaveEquipmentReadList(EquipmentRead equipmentRead) {
        return equipmentMapper.showHaveEquipmentReadList(equipmentRead);
    }

    /**
     * @作者: 老西儿
     * @功能描述: 添加危险点读权限时查询是否有记录
     * @时间: 2019/5/1 15:26
     * @参数:  * @param equipmentRead
     * @返回值: java.util.List
     **/
    @Override
    public List findEquipmentReadRepeat(EquipmentRead equipmentRead) {
        return equipmentMapper.findEquipmentReadRepeat(equipmentRead);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 危险点点检读权限赋权
     * @时间: 2019/5/1 15:42
     * @参数:  * @param equipmentRead
     * @返回值: void
     **/
    @Override
    public void insertEquipmentRead(EquipmentRead equipmentRead) {
        equipmentMapper.insertEquipmentRead(equipmentRead);
    }

    @Override
    public Boolean delEquipmentRead(String erid) {
        return equipmentMapper.delEquipmentRead(erid);
    }

    @Override
    public int showEquipmentReadCount(EquipmentRead equipmentRead) {
        return equipmentMapper.showEquipmentReadCount(equipmentRead);
    }


}
