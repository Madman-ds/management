package com.ds.equipment.controller;

import com.ds.equipment.pojo.Equipment;
import com.ds.equipment.service.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

/**
 * @类名称: EquipmentController
 * @作者: yuboyake
 * @创建时间: 2018/9/26 22:33
 * @说明:
 */
@RestController
@RequestMapping("equipment")
public class EquipmentController {

    @Autowired
    private EquipmentService equipmentService;

    /**
     * @作者: yuboyake
     * @功能描述: 设备分页查询
     * @时间: 2018/9/26 22:50
     * @参数:  * @param equipment
     * @返回值: java.util.HashMap<java.lang.String,java.lang.Object>
     **/
    @PostMapping(value = "getEquipmentList")
    public HashMap<String, Object> getEquipmentList(Equipment equipment){
        equipment.calculate();
        //获取总数据
        int count=equipmentService.getEquipmentCount();
        System.out.println(count);
        List<Equipment> list=equipmentService.getEquipmentList(equipment);
        System.out.println(list.toString());
        HashMap<String, Object> result=new HashMap<String, Object>();
        result.put("total", count);
        result.put("rows", list);
        return result;
    }

    /**
     * @作者: yuboyake
     * @功能描述: 批量删除
     * @时间: 2018/9/26 23:45
     * @参数:  * @param ids
     * @返回值: boolean
     **/
    @PostMapping(value="delEquipment")
    public boolean delEquipment(String ids){
        boolean isOK = equipmentService.delEquipment(ids);
        return isOK;
    }

    /**
     * @作者: 段大神经
     * @功能描述: 根据id查询设备
     * @时间: 2018/9/27 0:19
     * @参数:  * @param id
     * @返回值: java.lang.Object
     **/
    @PostMapping(value="getEquipmentById")
    public Object getEquipmentById(String id){
        Integer sb_id = Integer.valueOf(id);
        Equipment equipment = equipmentService.getEquipmentById(sb_id);
        return equipment;
    }


    @PostMapping(value="addEquipment")
    public boolean addEquipment(Equipment equipment){
        boolean isOK = equipmentService.addEquipment(equipment);
        return isOK;
    }

    @PostMapping(value="updateEquipment")
    public boolean updateEquipment(Equipment equipment){
        boolean isOK = equipmentService.updateEquipment(equipment);
        return isOK;
    }
}
