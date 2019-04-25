package com.ds.glzxj.pojo;

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
public class Glzxj extends PageUtil {
    /**
     * 主键
     */
    private Long glz_id;

    /**
     * 打卡人名称
     */
    private String glz_name;

    /**
     * 问题数
     */
    private String glz_count;
    /**
     *  时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date glz_data;

    /**
     * 提取项 1提取 2还原
     */
    private String glz_tq;

    /**
     * 赋权给用户
     */
    private String glz_user;
}
