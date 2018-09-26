package com.ds.serverlogin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

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
    public String toList(ModelMap modelMap, HttpSession session){
        modelMap.addAttribute("user",session.getAttribute("loginUser"));
        return "WEB-INF/jsp/list";
    }
    /**
     * @作者: 段大神经
     * @功能描述: 退出方法
     * @时间: 2018/9/26 22:14
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute("loginUser");
        return "index";
    }

    /**
     * @作者: yuboyake
     * @功能描述: 去展示页面
     * @时间: 2018/9/26 23:57
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping(value="toEquipmentList")
    public String toEquipmentList(){
        return "/WEB-INF/jsp/equipment/equipmentList";
    }
    /**
     * @作者: 段大神经
     * @功能描述: 项目访问根页面，也就是登陆页面
     * @时间: 2018/9/27 0:30
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("/")
    public String index(){
        return "index";
    }
}
