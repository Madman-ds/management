package com.ds.ybtz.pojo;

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
public class Ybtz extends PageUtil {
    /**
     * 主键
     */
    private Long ybtz_id;

    /**
     * 名称
     */
    private String ybtz_name;

    /**
     * 编号
     */
    private String ybtz_bh;

    /**
     * 压力/mpa
     */
    private String ybtz_mpa;

    /**
     * 类别
     */
    private String ybtz_type;

    /**
     * 位置
     */
    private String ybtz_wz;

    /**
     *  下次校验时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ybtz_date;

    /**
     * 备注
     */
    private String ybtz_remarks;

}
