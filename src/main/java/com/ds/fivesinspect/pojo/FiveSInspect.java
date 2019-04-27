package com.ds.fivesinspect.pojo;

import com.ds.util.Page;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @类名称：FiveSInspect
 * @作者: 老西儿
 * @创建时间: 2019/4/17 21:46
 * @说明:
 */
@Data
public class FiveSInspect extends Page {
    /**
     * 主键id
     */
    private Long f_id;
    /**
     * 5s
     */
    private String f_fives;
    /**
     *  分类
     */
    private String f_clazzify;
    /**
     * 内容
     */
    private String f_content;
    /**
     *
     */
    private Long f_userid;
    /**
     * 检查人
     */
    private String f_inspectuser;
    /**
     * 检查时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date f_inspectdate;
    /**
     *  是否满意 0:不满意 1:满意
     */
    private String f_ifmeet;
}
