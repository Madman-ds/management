package com.ds.tpm.pojo;

import com.ds.util.PageUtil;
import lombok.Data;

/**
 * @类名称：TpmUser
 * @作者: YuBoYaKe
 * @创建时间: 2019/5/10 22:53
 * @说明:
 */
@Data
public class TpmUser extends PageUtil {
    /**
     * 主键
     */
    private Long id;

    /**
     * tpm主键
     */
    private Long tpm_id;

    /**
     * 用户id
     */
    private Long user_id;

    /**
     * 是否提取 1提取 2还原
     */
    private String tq;

    /**
     * tpm
     */
    private Tpm tpm;

    /**
     * 形参使用
     */
    private String user_name;

}
