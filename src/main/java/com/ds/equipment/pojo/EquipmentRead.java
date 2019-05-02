package com.ds.equipment.pojo;

import com.ds.util.Page;
import lombok.Data;

/**
 * @类名称：EquipmentRead
 * @作者: 老西儿
 * @创建时间: 2019/5/1 00:44
 * @说明: 危险点点检读权限pojo
 */
@Data
public class EquipmentRead extends Page{
    /**
     * 主键id
     */
    private Long e_r_id;
    /**
     * 检查项用户关联id
     */
    private Long ju_id;
    /**
     * 检查项id
     */
    private Long jcx_id;
    /**
     * 设备id
     */
    private Long sb_id;
    /**
     * 当前登录人id
     */
    private Long user_id;
    /**
     * 检查项
     */
    private String jcx_name;
    /**
     * 设备名
     */
    private String sb_name;
    /**
     * 设备编号
     */
    private String sb_number;
    /**
     * 用户名
     */
    private String user_name;
}
