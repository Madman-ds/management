package com.ds.serverlogin.pojo;

import lombok.Data;

/**
 * @类名称: LoginUser
 * @作者: yuboyake
 * @创建时间: 2018/9/24 15:13
 * @说明:
 */
@Data
public class LoginUser {
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
     * 权限
     */
    private char  user_qx;
    /**
     *卡号
     */
    private String kh;
}
