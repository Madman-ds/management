package com.ds.serverlogin.pojo;

import com.ds.util.PageUtil;
import lombok.Data;

/**
 * @类名称: LoginUser
 * @作者: yuboyake
 * @创建时间: 2018/9/24 15:13
 * @说明:
 */
@Data
public class LoginUser extends PageUtil {
    /**
     * 用户id
     */
    private Long user_id;
    /**
     * 用户姓名
     */
    private String user_name;
    /**
     * 用户密码
     */
    private String password;
    /**
     *卡号
     */
    private String user_kh;
    /**
     * 是否为管理员   1：是；0：否
     */
    private Integer is_management;
}
