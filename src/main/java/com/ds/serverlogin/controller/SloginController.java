package com.ds.serverlogin.controller;

import com.ds.serverlogin.pojo.LoginUser;
import com.ds.serverlogin.service.SloginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @类名称: SloginController
 * @作者: yuboyake
 * @创建时间: 2018/9/24 15:04
 * @说明:登陆控制器
 */
@RestController
@RequestMapping("server")
public class SloginController {

    @Autowired
    private SloginService sloginService;
    /**
     * @作者: 段大神经
     * @功能描述: 添加了根方法
     * @时间: 2018/9/25 23:19
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("/")
    public String index(){
        return "index";
    }
    /**
     * @作者: yuboyake
     * @功能描述: 登陆验证
     * @时间: 2018/9/24 16:35
     * @参数:  * @param loginUser
     * @返回值: java.util.Map<java.lang.String,java.lang.Object>
     * @Node : map参数    useFlag 100 登陆成功
     *                            101 用户名错误
     *                            102 此用户不存在
     *                            103 此用户存在重复
     *                            104 密码错误
     **/
    @GetMapping("/queryUser")
    public Map<String, Object> queryUser(LoginUser loginUser, HttpSession session){
        Map<String, Object> map = sloginService.queryUser(loginUser,session);
        return map;
    }


    /**
     * @作者: yuboyake
     * @功能描述: test查询所有用户
     * @时间: 2018/9/25 22:52
     * @参数:  * @param
     * @返回值: com.ds.serverlogin.pojo.LoginUser
     **/
    @GetMapping("/queryUserAll")
    public LoginUser queryUserAll(){
        LoginUser loginUser= sloginService.queryUserAll();
        return loginUser;
    }

}
