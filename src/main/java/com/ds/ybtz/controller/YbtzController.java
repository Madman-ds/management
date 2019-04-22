package com.ds.ybtz.controller;

import com.ds.util.PageUtil;
import com.ds.weekPlan.pojo.WeekPlan;
import com.ds.ybtz.pojo.Ybtz;
import com.ds.ybtz.servcie.YbtzService;
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
public class YbtzController {
    @Autowired
    private YbtzService ybtzService;
  /**
   * @作者: 段大神经
   * @功能描述: 查询本周周计划
   * @时间: 2018/9/29 14:44
   * @参数:  * @param user
   * @返回值: com.ds.util.PageUtil
   **/
    @GetMapping("findYbtz")
    public PageUtil findYbtz(Ybtz ybtz){
        Integer count = ybtzService.getYbtzCount(ybtz);
        List<Ybtz> list = ybtzService.findAllYbtz(ybtz);
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
    @PostMapping("insertYbtz")
    public int insertYbtz(Ybtz ybtz){
        return ybtzService.insertYbtz(ybtz);
    }
    /**
     * @作者: 段聪祺
     * @功能描述: 删除用户
     * @时间: 2018/9/29 16:02
     * @参数:  * @param request
     * @返回值: void
     **/
    @PostMapping("delAllYbtz")
    public void delAllYbtz(HttpServletRequest request){
        String ids = request.getParameter("ids");
        ybtzService.delAllYbtz(ids);
    }

    /**
     * @作者: 段聪祺
     * @功能描述: 修改用户信息
     * @时间: 2018/9/29 16:00
     * @参数:  * @param user
     * @返回值: int
     **/
    @PostMapping("updYbtz")
    public int updYbtz(Ybtz ybtz){
        return ybtzService.updYbtz(ybtz);
    }
}
