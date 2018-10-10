package com.ds.util;

import lombok.Data;

import java.util.Date;

/**
 * @类名称：DataBackup
 * @作者: 段大神经
 * @创建时间: 2018/9/27 21:35
 * @说明: 数据备份相关实体类对应数据库t_inspectionrecord表
 *         导出设备信息相关信息字段
 */
@Data
public class ExcelDataBackup {

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
     * 检查项
     */
    private String jcx_name;
    /**
     * 检查要求
     */
    private String jc_yq;
    /**
     * 检查结果 1异常，0正常
     */
    private Integer jc_jg;
    /**
     * 确认人姓名
     */
    private String user_name;
    /**
     * 确认时间
     */
    private Date qr_time;
    /**
     * 备注内容
     */
    private String bz_nr;
}
