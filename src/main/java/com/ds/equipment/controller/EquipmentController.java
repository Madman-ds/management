package com.ds.equipment.controller;

import com.ds.equipment.pojo.Equipment;
import com.ds.equipment.service.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

/**
 * @类名称: EquipmentController
 * @作者: yuboyake
 * @创建时间: 2018/9/26 22:33
 * @说明:
 */
@Controller
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
    @RequestMapping(value = "getEquipmentList")
    @ResponseBody
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
     * @功能描述: 去展示页面
     * @时间: 2018/9/26 23:57
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @RequestMapping(value="toEquipmentList")
    public String toEquipmentList(){
        return "/WEB-INF/jsp/equipment/equipmentList";
    }

    /**
     * @作者: yuboyake
     * @功能描述: 批量删除
     * @时间: 2018/9/26 23:45
     * @参数:  * @param ids
     * @返回值: boolean
     **/
    @RequestMapping(value="delEquipment",method = RequestMethod.POST)
    @ResponseBody
    public boolean delEquipment(String ids){
        boolean isOK = equipmentService.delEquipment(ids);
        return isOK;
    }

    @RequestMapping(value="getEquipmentById",method = RequestMethod.POST)
    @ResponseBody
    public Object getEquipmentById(String id){
        Equipment equipment = equipmentService.getEquipmentById(id);
        return equipment;
    }
}
