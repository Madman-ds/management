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
public class ReadTpm extends PageUtil {
    /**
     * 主键
     */
    private Long id;

    /**
     * 用户id
     */
    private Long user_id;

    /**
     * tpm写权限关联表id
     */
    private Long tpm_user_id;

    private String user_name;

    private String tpm_whbh;

}
