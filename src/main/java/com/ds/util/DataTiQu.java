package com.ds.util;

import lombok.Data;

import java.util.Date;

/**
 * @类名称：DataBackup
 * @作者: 段大神经
 * @创建时间: 2018/9/27 21:35
 * @说明:  提取管理类
 */
@Data
public class DataTiQu {

    /**
     * 检查项用户关联主键
     */
    private Integer ju_id;

    /**
     * 用户名
     */
    private String user_name;

    /**
     * 用户表id
     */
    private Integer user_id;

    /**
     * 检查项名称
     */
    private String jcx_name;

    /**
     * 检查项id
     */
    private Integer jcx_Id;

    /**
     * 设备名称
     */
    private String sb_name;

    /**
     * 设备id
     */
    private Integer sb_id;

    /**
     * 1 提取  2 还原
     */
    private Integer top;

    /**
     * 巡检id
     */
    private Integer xj_id;
}
