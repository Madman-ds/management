package com.ds.weekPlan.pojo;

import com.ds.util.PageUtil;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @类名称: User
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 15:08
 * @说明:
 */
@Data
public class WeekPlan extends PageUtil {
    /**
     * 周计划id
     */
    private Long z_id;

    /**
     * 设备名称
     */
    private String z_name;

    /**
     * 设备编号
     */
    private String z_bh;

    /**
     * 周一
     */
    private String z_one;

    /**
     * 周二
     */
    private String z_two;

    /**
     * 周三
     */
    private String z_three;

    /**
     * 周四
     */
    private String z_four;

    /**
     * 周五
     */
    private String z_five;

    /**
     * 周六
     */
    private String z_six;

    /**
     * 周日
     */
    private String z_sunday;

    /**
     * 备注
     */
    private String z_remarks;
    /**
     * 开始时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date z_startdate;

    /**
     * 结束时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date z_enddate;
}
