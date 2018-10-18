package com.ds.equipment.pojo;

import com.ds.attributes.pojo.Attributes;
import com.ds.inspectionitem.pojo.Inspectionitem;
import com.ds.util.Page;
import lombok.Data;

import java.util.List;

/**
 * @类名称: Equipment
 * @作者: yuboyake
 * @创建时间: 2018/9/26 22:44
 * @说明:
 */
@Data
public class Equipment extends Page {

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

    private List<Attributes> list;

}
