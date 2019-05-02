package com.ds.user.pojo;

import com.ds.serverlogin.pojo.LoginUser;
import com.ds.util.PageUtil;
import lombok.Data;

import java.util.Date;

/**
 * @类名称: User
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 15:08
 * @说明:
 */
@Data
public class User extends LoginUser {
    /**
     * 创建时间
     */
    private Date create_time;

    private  String top;

    private String qx;

    private String[] ids;
}
