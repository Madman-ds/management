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
 * @说明: 管理者巡检相关控制器
 */
@RestController
public class GlzxjController {
    @Autowired
    private GlzxjService glzxjService;
  /**
   * @作者: 段大神经
   * @功能描述: 查询管理者巡检
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
    /**
     * @作者: 段聪祺
     * @功能描述: 添加管理者巡检
     * @时间: 2018/9/29 15:58
     * @参数:  * @param user
     * @返回值: int
     **/
    @PostMapping("insertGlzxj")
    public int insertGlzxj(HttpServletRequest request){
        String glz_name = request.getParameter("glz_name");
        String glz_count = request.getParameter("glz_count");
        Glzxj glzxj = new Glzxj();
        glzxj.setGlz_count(glz_count);
        glzxj.setGlz_name(glz_name);
        return glzxjService.insertGlzxj(glzxj);
    }
    /**
     * @作者: 段聪祺
     * @功能描述: 删除管理者巡检
     * @时间: 2018/9/29 16:02
     * @参数:  * @param request
     * @返回值: void
     **/
    @PostMapping("delAllGlzxj")
    public void delAllGlzxj(HttpServletRequest request){
        String ids = request.getParameter("ids");
        glzxjService.delAllGlzxj(ids);
    }

    /**
     * 提取
     * @param request
     */
    @PostMapping("huanyuanGLZ")
    public void huanyuanGLZ(HttpServletRequest request){
        String ids = request.getParameter("id");
        glzxjService.huanyuanGLZ(ids);
    }

    /**
     * 还原
     * @param request
     */
    @PostMapping("tiquGLZ")
    public void tiquGLZ(HttpServletRequest request){
        String ids = request.getParameter("id");
        glzxjService.tiquGLZ(ids);
    }

    @PostMapping("updateFQ")
    public void updateFQ(Glzxj glzxj){
        glzxjService.updateFQ(glzxj);
    }
}
