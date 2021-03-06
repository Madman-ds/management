package com.ds.serverlogin.mapper;

import com.ds.serverlogin.pojo.LoginUser;

import java.awt.*;
import java.util.Map;

/**
 * @接口名称: SloginMapper
 * @作者: yuboyake
 * @创建时间: 2018/9/24 15:11
 * @说明:
 */
public interface SloginMapper {

    LoginUser queryUser(LoginUser loginUser);

    int queryUserName(LoginUser loginUser);

    int getKhCount(LoginUser loginUser);

    LoginUser queryUserByKh(LoginUser loginUser);
}
