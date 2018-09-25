package com.ds.serverlogin.service;

import com.ds.serverlogin.pojo.LoginUser;

import java.util.Map;

/**
 * @接口名称: SloginService
 * @作者: yuboyake
 * @创建时间: 2018/9/24 15:09
 * @说明:
 */
public interface SloginService {

    Map<String,Object> queryUser(LoginUser loginUser);

    LoginUser queryUserAll();
}
