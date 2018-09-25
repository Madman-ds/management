package com.ds.login.controller;

import com.ds.login.service.LoginServcie;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;



/**
 * @类名称：LoginController
 * @作者: yuboyake
 * @创建时间: 2018/9/19 22:05
 * @说明:登陆相关controller
 */
public class LoginController {
    private final static Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    private LoginServcie loginServcie;
    /**
     * @作者: 李勇奇
     * @功能描述: 登录方法
     * @时间: 2018/9/25 21:00
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("Login")
    public String Login(){
        logger.info("=============登陆方法开始=================");
        //loginServcie.queryUser(){}
        logger.info("=============登陆方法结束，返回值为："+""+"=================");
        return "list";
    }
}
