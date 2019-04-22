package com.ds.fivesinspect.pojo;

import lombok.Data;

/**
 * @类名称：UserFiveSInspect
 * @作者: 老西儿
 * @创建时间: 2019/4/19 15:34
 * @说明:
 */
@Data
public class UserFiveSInspect {
    /**
     * 主键id
     */
    private Integer u_f_id;
    /**
     * 5Sid
     */
    private Integer f_id;
    /**
     * 用户id
     */
    private Integer user_id;
    /**
     * 是否提取 0:未提 1:已提
     */
    private String  ifextract;
    /**
     * 5S
     */
    private String  f_fives;
}
