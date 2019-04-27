package com.ds.fivesinspect.pojo;

import lombok.Data;

/**
 * @类名称：ReadFives
 * @作者: 老西儿
 * @创建时间: 2019/4/27 16:55
 * @说明:
 */
@Data
public class ReadFives {
    /**
     * 主键id
     */
    private Long r_id;
    /**
     * 用户id
     */
    private Long user_id;
    /**
     * 5Sid
     */
    private Long f_id;
    /**
     * 5S写权限关联表id
     */
    private Long u_f_id;
}
