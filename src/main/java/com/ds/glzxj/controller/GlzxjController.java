package com.ds.glzxj.controller;

import com.ds.glzxj.pojo.Glzxj;
import com.ds.glzxj.servcie.GlzxjService;
import com.ds.serverlogin.pojo.LoginUser;
import com.ds.user.pojo.User;
import com.ds.user.servcie.UserService;
import com.ds.util.DateUtil;
import com.ds.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * GlzxjController
 * <p>根据id删除管理者巡检<br>
 * @时间: 2018/9/29 16:02
 * @author: 段大神经,YuBoYaKe
 * @version: 2.0
 **/
@RestController
public class GlzxjController {
    @Autowired
    private GlzxjService glzxjService;
    @Autowired
    private UserService userService;

    /**
     * 删除管理者巡检
     * <p>M——查询管理者巡检<br>
     * @时间: 2018/9/29 16:02
     * @param glzxj
     * @author: YuBoYaKe
     * @return: com.ds.util.PageUtil
     * @version: 2.0
     */
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
     * 添加管理者巡检
     * <p>根据id删除管理者巡检<br>
     * @时间: 2018/9/29 16:02
     * @param request
     *         glz_name
     *         glz_count
     *         user_id
     * @author: YuBoYaKe
     * @return: int
     * @version: 2.0
     */
    @PostMapping("insertGlzxj")
    public int insertGlzxj(HttpServletRequest request){
        String glz_name = request.getParameter("glz_name");
        String glz_count = request.getParameter("glz_count");
        String user_id = request.getParameter("user_id");
        User users = userService.queryByuserId(user_id);
        if(users!=null && users.getUser_id()!=null){
            Glzxj glzxj = new Glzxj();
            glzxj.setGlz_count(glz_count);
            glzxj.setGlz_name(glz_name);
            glzxj.setOffset(null);
            glzxj.setLimit(null);
            List<Glzxj> list = glzxjService.findAllGlzxj(glzxj);
            if (list != null && list.size() > 0){
                Glzxj glzxj1 = list.get(0);
                if (DateUtil.isSameDay(glzxj1.getGlz_data(),new Date())){
                    return 2;
                }
            }
//            User user = userService.queryTopByUserName(glz_name);
            glzxj.setGlz_tq(users.getTop());
            return glzxjService.insertGlzxj(glzxj);
        }else{
            return 0;
        }
    }

    /**
     * 删除管理者巡检
     * <p>根据id删除管理者巡检<br>
     * @时间: 2018/9/29 16:02
     * @param request
     *         ids
     * @author: YuBoYaKe
     * @return: void
     * @version: 2.0
     */
    @PostMapping("delAllGlzxj")
    public void delAllGlzxj(HttpServletRequest request){
        String ids = request.getParameter("ids");
        glzxjService.delAllGlzxj(ids);
    }

    /**
     * 还原
     * <p>(此版本不用)<br>
     * @时间: 2018/9/29 16:02
     * @param request
     *         id
     * @author: YuBoYaKe
     * @return: void
     * @version: 2.0
     */
    @PostMapping("huanyuanGLZ")
    public void huanyuanGLZ(HttpServletRequest request){
        String ids = request.getParameter("id");
        glzxjService.huanyuanGLZ(ids);
    }

    /**
     * 提取
     * <p>(此版本不用)<br>
     * @时间: 2018/9/29 16:02
     * @param request
     *         id
     * @author: YuBoYaKe
     * @return: void
     * @version: 2.0
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

    /**
     * 查询提取项
     * <p>Top——管理者巡检——查询提取项<br>
     * @时间: 2018/9/29 16:02
     * @param glzxj
     * @author: YuBoYaKe
     * @return: com.ds.util.PageUtil
     * @version: 2.0
     */
    @GetMapping("findGlzxj2")
    public PageUtil findGlzxj2(Glzxj glzxj){
        glzxj.setGlz_tq("1");
        Integer count = glzxjService.getGlzxjTiCount(glzxj);
        List<Glzxj> list = glzxjService.findAllTiGlzxj(glzxj);
        PageUtil page = new PageUtil();
        page.setTotal(count);
        page.setRows(list);
        return page;
    }

    /**
     * 查询提取项
     * <p>i——管理者巡检——个人查看（查看自己的以及别人赋予自己的）<br>
     * @时间: 2018/9/29 16:02
     * @param session
     * @author: YuBoYaKe
     * @return: com.ds.util.PageUtil
     * @version: 2.0
     */
    @GetMapping("queryZjRead")
    public PageUtil queryZjRead(HttpSession session){
        PageUtil page = new PageUtil();
        LoginUser users = (LoginUser)session.getAttribute("loginUser");
        users.setUser_name(users.getUser_name());
        // 注:user_id 为long类型 无法实现后续逻辑
        users.setUser_kh(users.getUser_id()+"_");//只做形参
        Integer count = glzxjService.queryZjReadCount(users);
        List<Glzxj> list = glzxjService.queryZjRead(users);
        page.setTotal(count);
        page.setRows(list);
        return page;
    }
}
