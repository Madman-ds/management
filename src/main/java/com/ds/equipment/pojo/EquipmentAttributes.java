package com.ds.equipment.pojo;

import com.ds.attributes.pojo.Attributes;
import com.ds.util.Page;
import lombok.Data;

import java.util.List;

/**
 * @类名称: EquipmentInspectionitem
 * @作者: 段大神经
 * @创建时间: 2018/10/18 23:52
 * @说明: 设备属性相关类，用于设备管理查看设备详细信息
 */
@Data
public class EquipmentAttributes {

    /**
     * 设备id
     */
    private Long sb_id;

    /**
     * 设备名称
     */
    private String sb_name;

    /**
     * 设备编号
     */
    private String sb_number;

    /**
     * 设备型号
     */
    private String sb_xh;
    /**
     * 相关属性集合
     */
    private List<Attributes> attributesList;
}
