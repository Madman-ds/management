package com.ds.serverlogin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @类名称：ShowController
 * @作者: 段大神经
 * @创建时间: 2018/9/25 23:57
 * @说明:页跳转控制器
 *
 */
@Controller
public class ShowController {
    /**
     * @作者: 段大神经
     * @功能描述: 登陆成功去展示页面
     * @时间: 2018/9/25 23:50
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toList")
    public String toList(){
        return "WEB-INF/jsp/list";
    }
}
