package com.ds.serverlogin.controller;

import com.ds.fivesinspect.pojo.FiveSInspect;
import com.ds.fivesinspect.service.FiveSInspectService;
import com.ds.glzxj.servcie.GlzxjService;
import com.ds.serverlogin.pojo.LoginUser;
import com.ds.tpm.pojo.Tpm;
import com.ds.tpm.servcie.TpmService;
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
 * 注：i      代表 前台打卡页
 *     M      代表 后台管理页
 *     TOP    代表 访客页
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

    @Autowired
    private GlzxjService glzxjService;

    @Autowired
    private TpmService tpmService;
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
        return "WEB-INF/jsp/tree_menu";
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
        return "WEB-INF/login/index";
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
        return "WEB-INF/login/viewindex";
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
        return "WEB-INF/jsp/reception/viewlist_wxddj";
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
        return "Top/topindex";
    }

    /**
     * 个人查看 查看权限项
     * @return
     */
    @GetMapping("zjRead")
    public String zjRead(){
        return "WEB-INF/jsp/reception/wxddjRead";
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
     * @作者: YuBoYaKe
     * @功能描述: i——管理者巡检——>个人查看
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("GlzxjzjReadnew")
    public String GlzxjzjReadnew(){
        return "WEB-INF/jsp/reception/GlzxjzjRead";
    }
    /**
     * @作者: YuBoYaKe
     * @功能描述: M——周计划管理页面
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toZouJiHua")
    public String toZouJiHua(){
        return "WEB-INF/jsp/zouJiHua/list";
    }
    /**
     * @作者: YuBoYaKe
     * @功能描述: M——添加周计划
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("addZhuJiHua")
    public String addZhuJiHua(){
        return "WEB-INF/jsp/zouJiHua/addZhuJiHua";
    }
    /**
     * @作者: YuBoYaKe
     * @功能描述: M——去周计划修改页面
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
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
     * @作者: YuBoYaKe
     * @功能描述: TOP——周计划首页页面
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("topZhouJiHua")
    public String topZhouJiHua(){
        return "Top/topZhouJiHua";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: M——管理者巡检页面
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toGlzxj")
    public String toGlzxj(){
        return "WEB-INF/jsp/glzxj/list";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: i——管理者巡检页面
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toGlzxjAdd")
    public String toTopGlzxj(){
        return "WEB-INF/jsp/reception/viewlist_Glzxj";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: M——仪表台账页面
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toYbtz")
    public String toYbtz(){
        return "WEB-INF/jsp/ybtz/list";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: M——添加仪表台账
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("addybtz")
    public String addybtz(){
        return "WEB-INF/jsp/ybtz/addybtz";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: M——去周计划修改页面
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
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
     * @作者: YuBoYaKe
     * @功能描述: TOP——管理者巡检
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toTopGlzxjm")
    public String toTopGlzxjm(){
        return "Top/topGlzxj";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: TOP——仪表台账
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("topyibiaoTaiZheng")
    public String topyibiaoTaiZheng(){
        return "Top/topyibiaoTaiZheng";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: M——为用户赋管理者巡检写权限页面
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toShowGlzxjUser")
    public String toShowGlzxjUser(){
        return "WEB-INF/jsp/glzxj/userTiQu";
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
    @GetMapping("toshowfiveslog")
    public String toShowFivesLog(){
        return "WEB-INF/jsp/reception/viewlist_fives";
    }
    /**
     * @作者: 老西儿
     * @功能描述: 跳转到5S读权限
     * @时间: 2019/4/24 17:09
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toFiveSReadList")
    public String toFiveSReadList(){
        return "WEB-INF/jsp/fivesinspect/fivesreadlist";
    }
    /**
     * @作者: 老西儿
     * @功能描述: 跳转到查询5S读取权限页面
     * @时间: 2019/4/27 20:44
     * @参数:  * @param model
     * @param userId
     * @返回值: java.lang.String
     **/
    @GetMapping("toShowHaveFiveSRead")
    public String toShowHaveFiveSRead(Model model,String userId){
        model.addAttribute("userId",userId);
        return "WEB-INF/jsp/fivesinspect/showhavefivesread";
    }
    /**
     * @作者: 老西儿
     * @功能描述: 跳转到5S个人查看页面
     * @时间: 2019/4/28 18:15
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("tockFivesRead")
    public String tockFivesRead(){
        return "WEB-INF/jsp/reception/ckfivesRead";
    }
    /**
     * @作者: 老西儿
     * @功能描述: 跳转到topindex5S点检页面
     * @时间: 2019/4/28 18:31
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toTopFiveBytq")
    public String toTopFiveBytq(){
        return "Top/topfivebytq";
    }
    /**
     * @作者: 老西儿
     * @功能描述: 跳转到危险点点检读权限管理页面
     * @时间: 2019/5/1 16:05
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toDanger")
    public String toDanger(){
        return "WEB-INF/jsp/equipment/dangerList";
    }
    @GetMapping("toShowHaveEquipmentRead")
    /**
     * @作者: 老西儿
     * @功能描述: 跳转到5S读权限查询页面
     * @时间: 2019/5/2 5:00
     * @参数:  * @param userId
     * @param model
     * @返回值: java.lang.String
     **/
    public String toShowHaveEquipmentRead(String userId,Model model){
        model.addAttribute("userId",userId);
        return "WEB-INF/jsp/equipment/showHaveEquipmentRead";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: TPM——TPM
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toTpmListM")
    public String toTpmListM(){
        return "WEB-INF/jsp/tpm/TpmListM";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: TPM——TPM添加基础数据
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toInsertTpmBasics")
    public String toInsertTpmBasics(){
        return "WEB-INF/jsp/tpm/addTpmBasics";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: TPM——TPM修改基础数据
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toUpdTpm")
    public String toUpdTpm(Tpm tpm,Model model){
        Tpm t = tpmService.queryByid(tpm);
        model.addAttribute("tpm",t);
        return "WEB-INF/jsp/tpm/updTpmBasics";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: tpm写权限管理
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toTpmListMWrite")
    public String toTpmListMWrite(){
        return "WEB-INF/jsp/tpm/tpmListMWrite";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: tpm写权限管理——>查询用户拥有那也数据的写权限
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toQueryTopUser")
    public String toShowFiveSInspecst(Model model,String userId){
        model.addAttribute("userId",userId);
        return "WEB-INF/jsp/tpm/queryTopUser";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: 1200TPM打卡页面
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toTpm1200List")
    public String toTpm1200List(){
        return "WEB-INF/jsp/reception/viewlist_TPM_1200";
    }
    /**
     * @作者: YuBoYaKe
     * @功能描述: 650TPM打卡页面
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toTpm650List")
    public String toTpm650List(){
        return "WEB-INF/jsp/reception/viewlist_TPM_650";
    }
    /**
     * @作者: YuBoYaKe
     * @功能描述: M——TPM日志查询
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toTpmLog")
    public String toTpmLog(){
        return "WEB-INF/jsp/tpm/tpmLog";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: TOP——1200TPM提取项
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toTop1200Tpm")
    public String toTop1200Tpm(){
        return "Top/top1200Tpm";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: TOP——1200TPM提取项
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toTop650Tpm")
    public String toTop650Tpm(){
        return "Top/top650Tpm";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: i——TPM——>个人查看
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("tozjRead1200Tpm")
    public String tozjRead1200Tpm(){
        return "WEB-INF/jsp/reception/zjRead1200Tpm";
    }
    /**
     * @作者: YuBoYaKe
     * @功能描述: i——TPM——>个人查看
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("tozjRead650Tpm")
    public String tozjRead650Tpm(){
        return "WEB-INF/jsp/reception/zjRead650Tpm";
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: TPM读权限
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toTpmReadList")
    public String toTpmReadList(){
        return "WEB-INF/jsp/tpm/tpmListMRead";
    }
    /**
     * @作者: YuBoYaKe
     * @功能描述: tpm写权限管理——>查询用户拥有那也数据的写权限
     * @时间: 2019/4/18 20:22
     * @参数:  * @param
     * @返回值: java.lang.String
     **/
    @GetMapping("toQueryReadtpm")
    public String toQueryReadtpm(Model model,String userId){
        model.addAttribute("userId",userId);
        return "WEB-INF/jsp/tpm/queryTReadtpm";
    }
}
