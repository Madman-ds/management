package com.ds.user.controller;

import com.ds.user.pojo.User;
import com.ds.user.servcie.UserService;
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
public class UserController {
    @Autowired
    private UserService userService;
  /**
   * @作者: 段大神经
   * @功能描述: 查询所有用户，前台条件查询为卡号和姓名
   * @时间: 2018/9/29 14:44
   * @参数:  * @param user
   * @返回值: com.ds.util.PageUtil
   **/
    @GetMapping("findAllUser")
    public PageUtil findAllUser(User user){
        Integer count = userService.getUserCount(user);
        List<User> list = userService.findAllUser(user);
        PageUtil page = new PageUtil();
        page.setTotal(count);
        page.setRows(list);
        return page;
    }
    /**
     * @作者: 段聪祺
     * @功能描述: 条件查询用户，用于新增，修改回显
     * @时间: 2018/9/29 15:56
     * @参数:  * @param user
     * @返回值: com.ds.user.pojo.User
     **/
    @PostMapping("selectUserByWhere")
    public  User selectUserByWhere(User user){
        return userService.selectUserByWhere(user);
    }
    /**
     * @作者: 段聪祺
     * @功能描述: 添加用户
     * @时间: 2018/9/29 15:58
     * @参数:  * @param user
     * @返回值: int
     **/
    @PostMapping("insertUser")
    public int insertUser(User user){
        return userService.insertUser(user);
    }
    /**
     * @作者: 段聪祺
     * @功能描述: 修改用户信息
     * @时间: 2018/9/29 16:00
     * @参数:  * @param user
     * @返回值: int
     **/
    @PostMapping("updUser")
    public int updUser(User user){
        return userService.updUser(user);
    }
    /**
     * @作者: 段聪祺
     * @功能描述: 删除用户
     * @时间: 2018/9/29 16:02
     * @参数:  * @param request
     * @返回值: void
     **/
    @PostMapping("delAllUser")
    public void delAllUser(HttpServletRequest request){
        String ids = request.getParameter("ids");
        userService.delAllUser(ids);
    }
}
