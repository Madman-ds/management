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
 * 注：周计划注：后台添加 前台展示（2条，一周的两条信息）
 */
@RestController
public class WeekPlanController {
    @Autowired
    private WeekPlanService weekPlanService;
  /**
   * @作者: YuBoYaKe
   * @功能描述: M——查询本周周计划
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
     * @作者: YuBoYaKe
     * @功能描述: TOP——查询本周周计划
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
