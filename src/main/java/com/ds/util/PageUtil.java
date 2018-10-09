package com.ds.util;

import lombok.Data;

import java.util.List;

/**
 * @类名称：PageUtil
 * @作者: 段大神经
 * @创建时间: 2018/10/9 20:13
 * @说明: 分页相关工具类
 */
@Data
public class PageUtil {
    /**
     * 每页显示多少条
     */
    private Integer limit;
    /**
     * 第多少页
     */
    private Integer offset;
    /**
     * 数据总条数
     */
    private Integer total;
    /**
     * 所有数据
     */
    private List rows;
}
