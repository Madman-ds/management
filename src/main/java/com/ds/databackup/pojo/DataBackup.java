package com.ds.databackup.pojo;

import com.ds.util.Page;
import com.ds.util.PageUtil;
import lombok.Data;

import java.util.Date;

/**
 * @类名称：DataBackup
 * @作者: 段大神经
 * @创建时间: 2018/9/27 21:35
 * @说明: 数据备份相关实体类对应数据库t_inspectionrecord表
 */
@Data
public class DataBackup extends PageUtil {
    /**
     * 巡检id
     */
    private Long xj_id;
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
     * 提取项 默认‘0’
     */
    private String top;
    /**
     * 确认时间
     */
    private Date qr_time;
    /**
     * 确认起始时间
     */
    private String start_time;
    /**
     * 确认结束时间
     */
    private String end_time;
    /**
     * 备注内容
     */
    private String bz_nr;

    /**
     * 检查项id
     */
    private Integer jcx_id;
}
