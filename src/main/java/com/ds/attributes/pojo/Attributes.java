package com.ds.attributes.pojo;

import lombok.Data;

/**
 * @类名称：Attributes
 * @作者: 段大神经
 * @创建时间: 2018/9/26 22:43
 * @说明: 设备相关属性类，对应t_ attributes
 */
@Data
public class Attributes {
    /**
     * 属性id
     */
    private Long sx_id;
    /**
     * 属性名称
     */
    private String sx_name;
    /**
     * 属性值
     */
    private String sx_v;
    /**
     * 设备id  (关联设备id)
     */
    private Long sb_id;
}
