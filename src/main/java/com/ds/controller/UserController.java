package com.ds.controller;

import com.ds.pojo.User;
import com.ds.service.UserService;
import com.ds.util.HttpUrlConnectionUtil;
import com.sun.org.apache.bcel.internal.classfile.Code;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

/**
 * 测试类不用管
 */
@RestController
@RequestMapping("api/user/")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 返回openid
     * @return
     */
    @GetMapping("get_weixin_sns_info")
    public User getUser(@RequestParam String code){
        String path = "https://api.weixin.qq.com/sns/jscode2session?appid=wxe7e7267fb441371c&secret=ae045b5549f1c0f7b5a3c2e42bd82fba&js_code="+code+"&grant_type=authorization_code";
        Object o = HttpUrlConnectionUtil.opentConnection(path);
        System.err.print(o);
        return null;
    }

}
