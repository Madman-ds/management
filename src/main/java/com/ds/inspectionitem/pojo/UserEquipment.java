package com.ds.inspectionitem.pojo;

import lombok.Data;

/**
 * @类名称：UserEquipment
 * @作者: 段大神经
 * @创建时间: 2018/10/10 22:41
 * @说明: 检查项用户关联类
 */
@Data
public class UserEquipment {
    /**
     * 检查项用户关联主键
     */
    private Long ju_id;
    /**
     * 检查项id
     */
    private Long jcx_id;
    /**
     * 用户id
     */
    private Long user_id;
    /**
     * 权限：1写；0读
     */
    private Integer qx;
}
