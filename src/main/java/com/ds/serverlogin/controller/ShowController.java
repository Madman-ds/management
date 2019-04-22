package com.ds.serverlogin.controller;

import com.ds.fivesinspect.pojo.FiveSInspect;
import com.ds.fivesinspect.service.FiveSInspectService;
import com.ds.serverlogin.pojo.LoginUser;
import com.ds.user.pojo.User;
import com.ds.user.servcie.UserService;
import com.ds.weekPlan.pojo.WeekPlan;
import com.ds.weekPlan.servcie.WeekPlanService;
import com.ds.ybtz.pojo.Ybtz;
import com.ds.ybtz.servcie.YbtzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
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
    @Autowired
    private UserService userService;
    @Autowired
    private WeekPlanService weekPlanService;
    @Autowired
    private FiveSInspectService fiveSInspectService;
    @Autowired
    private YbtzService ybtzService;
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
        return "redirect:/topIndex";
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
        return "WEB-INF/jsp/equipment/equipmentList";
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
    @GetMapping("toInspectionItem")
    public String toInspectionItem(){
        return "WEB-INF/jsp/inspection/inspectionitem";
    }
    /**
     * @作者: 段大神经
     * @功能描述: 去用户管理页面
     * @时间: 2018/9/27 21:23
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toUserList")
    public String toUserList(){
        return "WEB-INF/jsp/user/userlist";
    }
    /**
     * @作者: 段大神经
     * @功能描述: 去数据备份主页面
     * @时间: 2018/9/27 21:26
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toDatabackUp")
    public String toDatabackUp(){
        return "WEB-INF/jsp/databackup/databackup";
    }
    /**
     * @作者: 段聪祺
     * @功能描述: 后台管理系统刚进来时展示的背景图片路径
     * @时间: 2018/9/29 11:20
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toShowLogo")
    public String toShowLogo(){
        return "WEB-INF/jsp/showlogo";
    }
    /**
     * @作者: 段聪祺
     * @功能描述: 去前台登陆
     * @时间: 2018/9/29 16:43
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping(value = "login")
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
        return "WEB-INF/jsp/viewlist";
    }
    /**
     * @作者: 段大神经
     * @功能描述: 去添加用户页面
     * @时间: 2018/10/7 22:49
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toInsertUser")
    public String toInsertUser(){
        return "WEB-INF/jsp/user/adduser";
    }
    /**
     * @作者: 段大神经
     * @功能描述: 去用户修改页面
     * @时间: 2018/10/7 22:20
     * @参数:  * @param request
     * @返回值: java.lang.String
     **/
    @GetMapping("toUpdUser")
    public String toUpdUser(HttpServletRequest request, ModelMap modelMap){
        User user = new User();
        user.setUser_id(Long.valueOf(request.getParameter("user_id")));
        User user1 = userService.selectUserByWhere(user);
        modelMap.addAttribute("user",user1);
        return "WEB-INF/jsp/user/upduser";
    }
    /**
     * @作者: 段大神经
     * @功能描述: 去检查项赋权页面
     * @时间: 2018/10/11 21:30
     * @参数:  * @param request
     * @param modelMap
     * @返回值: java.lang.String
     **/
    @GetMapping("toJcxfq")
    public String toJcxfq(HttpServletRequest request, ModelMap modelMap){
        modelMap.addAttribute("sb_id",Long.valueOf(request.getParameter("sb_id")));
        return "WEB-INF/jsp/inspectionitem/inspectionitem";
    }
    /**
     * @作者: 段大神经
     * @功能描述: 去读权限页面
     * @时间: 2018/10/24 21:26
     * @参数:  * @param modelMap
     * @返回值: java.lang.String
     **/
    @GetMapping("toread")
    public String toread(ModelMap modelMap,HttpSession Session){
        LoginUser loginUser = (LoginUser) Session.getAttribute("loginUser");
        if (loginUser != null){
            modelMap.addAttribute("userId",loginUser.getUser_id());
        }
        return "WEB-INF/jsp/read";
    }
    /**
     * @作者: 段大神经
     * @功能描述: 去设备检查项页面
     * @时间: 2018/11/18 14:41
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("tosbjcx")
    public String tosbjcx(HttpServletRequest request,ModelMap modelMap){
        modelMap.addAttribute("sb_id",Long.valueOf(request.getParameter("sb_id")));
        return "WEB-INF/jsp/inspection/sbjcx";
    }
    /**
     * @作者: 段大神经
     * @功能描述: 首展示top页
     * @时间: 2018/12/1 13:43
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping(value = {"topIndex","/"})
    public String topIndex(){
        return "topindex";
    }

    /**
     * 个人查看 查看权限项
     * @return
     */
    @GetMapping("zjRead")
    public String zjRead(){
        return "WEB-INF/jsp/zjRead";
    }

    /**
     * 数据提取
     * @return
     */
    @GetMapping("toDataTiqu")
    public String zjsRead(){
        return "WEB-INF/jsp/sjtq";
    }
    /**
     * 周计划
     * @return
     */
    @GetMapping("toZouJiHua")
    public String toZouJiHua(){
        return "WEB-INF/jsp/zouJiHua/list";
    }
    /**
     * 添加周计划
     * @return
     */
    @GetMapping("addZhuJiHua")
    public String addZhuJiHua(){
        return "WEB-INF/jsp/zouJiHua/addZhuJiHua";
    }
    /**
     * @作者: 段大神经
     * @功能描述: 去周计划修改页面
     * @时间: 2018/10/7 22:20
     * @参数:  * @param request
     * @返回值: java.lang.String
     **/
    @GetMapping("toUpdWeekPlan")
    public String toUpdWeekPlan(HttpServletRequest request, ModelMap modelMap){
        WeekPlan week = new WeekPlan();
        week.setZ_id(Long.valueOf(request.getParameter("z_id")));
        WeekPlan weekPlan = weekPlanService.toUpdWeekPlan(week);
        modelMap.addAttribute("weekPlan",weekPlan);
        return "WEB-INF/jsp/zouJiHua/updateZhuJiHua";
    }

    /**
     * 周计划首页页面
     * @return
     */
    @GetMapping("topZhouJiHua")
    public String topZhouJiHua(){

        return "topZhouJiHua";
    }

    /**
     * 管理者巡检页面
     * @return
     */
    @GetMapping("toGlzxj")
    public String toGlzxj(){
        return "WEB-INF/jsp/glzxj/list";
    }

    /**
     * 管理者巡检页面
     * @return
     */
    @GetMapping("toTopGlzxj")
    public String toTopGlzxj(){
        return "toTopGlzxj";
    }

    /**
     * 管理者巡检页面
     * @return
     */
    @GetMapping("toYbtz")
    public String toYbtz(){
        return "WEB-INF/jsp/ybtz/list";
    }

    /**
     * 添加仪表台账
     * @return
     */
    @GetMapping("addybtz")
    public String addybtz(){
        return "WEB-INF/jsp/ybtz/addybtz";
    }

    /**
     * @作者: 段大神经
     * @功能描述: 去周计划修改页面
     * @时间: 2018/10/7 22:20
     * @参数:  * @param request
     * @返回值: java.lang.String
     **/
    @GetMapping("toUpdYbtz")
    public String toUpdYbtz(HttpServletRequest request, ModelMap modelMap){
        Ybtz week = new Ybtz();
        week.setYbtz_id(Long.valueOf(request.getParameter("ybtz_id")));
        Ybtz ybtz = ybtzService.toUpdYbtz(week);
        modelMap.addAttribute("ybtz",ybtz);
        return "WEB-INF/jsp/ybtz/updybtz";
    }
    /**
     * @作者: 老西儿
     * @功能描述: 跳转到5S点检页面
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toFiveSInspect")
    public String toFiveSInspect(){
        return "WEB-INF/jsp/fivesinspect/fivesinspectlist";
    }
    /**
     * @作者: 老西儿
     * @功能描述: 跳转到添加5S页面
     * @时间: 2019/4/18 20:25
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toAddFiveSInspect")
    public String toAddFiveSInspect(){
        return "WEB-INF/jsp/fivesinspect/addfivesinspect";
    }
    /**
     * @作者: 老西儿
     * @功能描述: 跳转到修改5S页面
     * @时间: 2019/4/18 21:42
     * @参数:  * @param fiveSInspect
     * @param model
     * @返回值: java.lang.String
     **/
    @GetMapping("toUpFiveSInspect")
    public String toUpFiveSInspect(FiveSInspect fiveSInspect, Model model){
        FiveSInspect inspect = fiveSInspectService.findFiveSInspectById(fiveSInspect);
        model.addAttribute("fsi",inspect);
        return "WEB-INF/jsp/fivesinspect/upfivesinspect";
    }
    /**
     * @作者: 老西儿
     * @功能描述: 跳转到5S写权限页面
     * @时间: 2019/4/21 15:47
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toFiveSWrite")
    public String toFiveSWrite(){
        return "WEB-INF/jsp/fivesinspect/fiveswritelist";
    }
    /**
     * @作者: 老西儿
     * @功能描述: 跳转到查看5S写权限页面
     * @时间: 2019/4/21 16:43
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toShowFiveSInspect")
    public String toShowFiveSInspect(Model model,String userId){
        model.addAttribute("userId",userId);
        return "WEB-INF/jsp/fivesinspect/ShowFiveSInspect";
    }
    /**
     * @作者: 老西儿
     * @功能描述: 跳转到5S日志记录页面
     * @时间: 2019/4/22 17:14
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toFiveSLog")
    public String toFiveSLog(){
        return "WEB-INF/jsp/fivesinspect/fiveslog";
    }
}
