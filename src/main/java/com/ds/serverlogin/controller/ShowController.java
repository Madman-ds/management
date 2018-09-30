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
        return "/";
    }

    /**
     * @作者: yuboyake
     * @功能描述: 去设备管理展示页面
     * @时间: 2018/9/26 23:57
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping(value="equipment/toEquipmentList")
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
    @GetMapping("/toIndex")
    public String index(){
        return "index";
    }
    /**
     * @作者: 段大神经
     * @功能描述: 去检查项赋权页面
     * @时间: 2018/9/27 21:14
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("/toInspectionItem")
    public String toInspectionItem(){
        return "/WEB-INF/jsp/inspection/inspectionitem";
    }
    /**
     * @作者: 段大神经
     * @功能描述: 去用户管理页面
     * @时间: 2018/9/27 21:23
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("/toUserList")
    public String toUserList(){
        return "/WEB-INF/jsp/user/userlist";
    }
    /**
     * @作者: 段大神经
     * @功能描述: 去数据备份主页面
     * @时间: 2018/9/27 21:26
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("/toDatabackUp")
    public String toDatabackUp(){
        return "/WEB-INF/jsp/databackup/databackup";
    }
    /**
     * @作者: 段聪祺
     * @功能描述: 后台管理系统刚进来时展示的背景图片路径
     * @时间: 2018/9/29 11:20
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("/toShowLogo")
    public String toShowLogo(){
        return "/WEB-INF/jsp/showlogo";
    }
    /**
     * @作者: 段聪祺
     * @功能描述: 去前台登陆
     * @时间: 2018/9/29 16:43
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping(value = {"/login","/"})
    public String toViewLogin(){
        return "viewindex";
    }
    /**
     * @作者: 段聪祺
     * @功能描述: 去前台住展示页面
     * @时间: 2018/9/29 16:56
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toViewList")
    public String toViewList(){
        return "/WEB-INF/jsp/viewlist";
    }
}
