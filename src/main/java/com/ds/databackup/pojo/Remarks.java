package com.ds.databackup.pojo;

import lombok.Data;

/**
 * @类名称：Remarks
 * @作者: 段大神经
 * @创建时间: 2018/9/27 22:44
 * @说明: 日志相关类对应数据库t_remarks表
 */
@Data
public class Remarks {
    /**
     * 备注id
     */
    private Long bz_id;
    /**
     * 备注内容
     */
    private String bz_nr;
}
