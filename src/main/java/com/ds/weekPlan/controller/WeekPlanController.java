package com.ds.weekPlan.controller;

import com.ds.util.PageUtil;
import com.ds.weekPlan.pojo.WeekPlan;
import com.ds.weekPlan.servcie.WeekPlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @类名称: Controller
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:36
 * @说明: 用户相关控制器
 */
@RestController
public class WeekPlanController {
    @Autowired
    private WeekPlanService weekPlanService;
  /**
   * @作者: 段大神经
   * @功能描述: 查询本周周计划
   * @时间: 2018/9/29 14:44
   * @参数:  * @param user
   * @返回值: com.ds.util.PageUtil
   **/
    @GetMapping("findWeekPlan")
    public PageUtil findWeekPlan(WeekPlan weekPlan){
        Integer count = weekPlanService.getWeekPlanCount(weekPlan);
        List<WeekPlan> list = weekPlanService.findAllWeekPlan(weekPlan);
        PageUtil page = new PageUtil();
        page.setTotal(count);
        page.setRows(list);
        return page;
    }

    /**
     * @作者: 段大神经
     * @功能描述: 查询本周周计划
     * @时间: 2018/9/29 14:44
     * @参数:  * @param user
     * @返回值: com.ds.util.PageUtil
     **/
    @GetMapping("findWeekPlan2")
    public PageUtil findWeekPlan2(WeekPlan weekPlan){
        weekPlan.setLimit(2);
        weekPlan.setOffset(0);
        Integer count = 2;
        List<WeekPlan> list = weekPlanService.findAllWeekPlan(weekPlan);
        PageUtil page = new PageUtil();
        page.setTotal(count);
        page.setRows(list);
        return page;
    }
//    /**
//     * @作者: 段大神经
//     * @功能描述: 获取所有用户集合
//     * @时间: 2018/10/11 22:31
//     * @参数:  * @param
//     * @返回值: java.util.List
//     **/
//    @PostMapping("getUserList")
//    public List getUserList(){
//        return userService.findAllUser(null);
//    }
//    /**
//     * @作者: 段聪祺
//     * @功能描述: 条件查询用户，用于新增，修改回显
//     * @时间: 2018/9/29 15:56
//     * @参数:  * @param user
//     * @返回值: com.ds.user.pojo.User
//     **/
//    @PostMapping("selectUserByWhere")
//    public User selectUserByWhere(User user){
//        return userService.selectUserByWhere(user);
//    }
    /**
     * @作者: 段聪祺
     * @功能描述: 添加用户
     * @时间: 2018/9/29 15:58
     * @参数:  * @param user
     * @返回值: int
     **/
    @PostMapping("insertZhouJiHua")
    public int insertZhouJiHua(WeekPlan weekPlan){
        return weekPlanService.insertZhouJiHua(weekPlan);
    }
    /**
     * @作者: 段聪祺
     * @功能描述: 修改用户信息
     * @时间: 2018/9/29 16:00
     * @参数:  * @param user
     * @返回值: int
     **/
    @PostMapping("updWeekPlan")
    public int updWeekPlan(WeekPlan weekPlan){
        return weekPlanService.updWeekPlan(weekPlan);
    }
    /**
     * @作者: 段聪祺
     * @功能描述: 删除用户
     * @时间: 2018/9/29 16:02
     * @参数:  * @param request
     * @返回值: void
     **/
    @PostMapping("delAllWeekPlan")
    public void delAllUser(HttpServletRequest request){
        String ids = request.getParameter("ids");
        weekPlanService.delAllWeekPlan(ids);
    }
}
