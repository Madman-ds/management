package com.ds.inspectionitem.pojo;

import lombok.Data;

/**
 * @类名称：Inspectionitem
 * @作者: 段大神经
 * @创建时间: 2018/10/10 22:37
 * @说明: 检查项类
 */
@Data
public class Inspectionitem {
    /**
     * 检查项主键
     */
    private Long jcx_id;
    /**
     * 检查项名称
     */
    private String jcx_name;
    /**
     * 检查值（要求）
     */
    private String jcx_v;
    /**
     * 设备id
     */
    private Long sb_id;
}
