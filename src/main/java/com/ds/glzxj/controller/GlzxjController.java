package com.ds.glzxj.controller;

import com.ds.glzxj.pojo.Glzxj;
import com.ds.glzxj.servcie.GlzxjService;
import com.ds.util.PageUtil;
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
public class GlzxjController {
    @Autowired
    private GlzxjService glzxjService;
  /**
   * @作者: 段大神经
   * @功能描述: 查询本周周计划
   * @时间: 2018/9/29 14:44
   * @参数:  * @param user
   * @返回值: com.ds.util.PageUtil
   **/
    @GetMapping("findGlzxj")
    public PageUtil findGlzxj(Glzxj glzxj){
        Integer count = glzxjService.getGlzxjCount(glzxj);
        List<Glzxj> list = glzxjService.findAllGlzxj(glzxj);
        PageUtil page = new PageUtil();
        page.setTotal(count);
        page.setRows(list);
        return page;
    }
//    /**
//     * @作者: 段聪祺
//     * @功能描述: 添加用户
//     * @时间: 2018/9/29 15:58
//     * @参数:  * @param user
//     * @返回值: int
//     **/
//    @PostMapping("insertZhouJiHua")
//    public int insertZhouJiHua(WeekPlan weekPlan){
//        return weekPlanService.insertZhouJiHua(weekPlan);
//    }
    /**
     * @作者: 段聪祺
     * @功能描述: 删除用户
     * @时间: 2018/9/29 16:02
     * @参数:  * @param request
     * @返回值: void
     **/
    @PostMapping("delAllGlzxj")
    public void delAllGlzxj(HttpServletRequest request){
        String ids = request.getParameter("ids");
        glzxjService.delAllGlzxj(ids);
    }
}
