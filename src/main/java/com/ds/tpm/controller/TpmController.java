package com.ds.tpm.controller;

import com.ds.serverlogin.pojo.LoginUser;
import com.ds.tpm.pojo.ReadTpm;
import com.ds.tpm.pojo.Tpm;
import com.ds.tpm.pojo.TpmUser;
import com.ds.tpm.servcie.TpmService;
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
import java.util.Date;
import java.util.List;

/**
 * @类名称: Controller
 * @作者: YuBoYaKe
 * @创建时间: 2018/9/29 14:36
 * @说明: TPM相关控制器
 */
@RestController
public class TpmController {
    @Autowired
    private TpmService TpmService;
    @Autowired
    private UserService userService;
  /**
   * @作者: YuBoYaKe
   * @功能描述: M——查询upd
   * @时间: 2018/9/29 14:44
   * @参数:  * @param user
   * @返回值: com.ds.util.PageUtil
   **/
    @GetMapping("findTpmList")
    public PageUtil findTpm(Tpm tpm){
        Integer count = TpmService.getTpmCount(tpm);
        List<Tpm> list = TpmService.findAllTpm(tpm);
        PageUtil page = new PageUtil();
        page.setTotal(count);
        page.setRows(list);
        return page;
    }
//    /**
//   * @作者: YuBoYaKe
//   * @功能描述: M——查询打卡数据
//   * @时间: 2018/9/29 14:44
//   * @参数:  * @param user
//   * @返回值: com.ds.util.PageUtil
//   **/
//    @GetMapping("findDkTpmList")
//    public PageUtil findDkTpmList(Tpm tpm){
//        Integer count = TpmService.findDkTpmListCount(tpm);
//        List<Tpm> list = TpmService.findDkTpmList(tpm);
//        PageUtil page = new PageUtil();
//        page.setTotal(count);
//        page.setRows(list);
//        return page;
//    }
    /**
     * @作者: YuBoYaKe
     * @功能描述: 添加TPM
     * @时间: 2018/9/29 15:58
     * @参数:  * @param user
     * @返回值: int
     **/
    @PostMapping("insertTpm")
    public int insertTpm(Tpm tpm){
        return TpmService.insertTpm(tpm);
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: 添加TPM
     * @时间: 2018/9/29 15:58
     * @参数:  * @param user
     * @返回值: int
     **/
    @PostMapping("updTpm")
    public int updTpm(Tpm tpm){
        return TpmService.updTpm(tpm);
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: 删除TPM
     * @时间: 2018/9/29 16:02
     * @参数:  * @param request
     * @返回值: void
     **/
    @PostMapping("delAllTpm")
    public void delAllTpm(HttpServletRequest request){
        String ids = request.getParameter("ids");
        TpmService.delAllTpm(ids);
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: tpm添加写权限
     * @时间: 2019/4/21 14:16
     * @参数:  * @param ids
     * @param userId
     * @返回值: void
     **/
    @PostMapping("insertTpmUser")
    public void insertTpmUser(String ids, String userId){
        String[] idss = ids.split(",");
        for (int i = 0;i < idss.length;i++){
            TpmUser tpmUser = new TpmUser();
            tpmUser.setTpm_id(Long.valueOf(idss[i]));
            tpmUser.setUser_id(Long.valueOf(userId));
            tpmUser.setTq("2");
            List<TpmUser> tpmUsers = TpmService.findtpmUser(tpmUser);
            if(tpmUsers.size() <= 0){
                TpmService.addtpmUser(tpmUser);
            }
        }
    }
    /**
     * @作者: YuBoYaKe
     * @功能描述: tpm添加读权限
     * @时间: 2019/4/21 14:16
     * @参数:  * @param ids
     * @param userId
     * @返回值: void
     **/
    @PostMapping("insertReadtpm")
    public void insertReadtpm(String ids, String userId){
        String[] idss = ids.split(",");
        for (int i = 0;i < idss.length;i++){
            ReadTpm readTpm = new ReadTpm();
            readTpm.setTpm_user_id(Long.valueOf(idss[i]));
            readTpm.setUser_id(Long.valueOf(userId));
            List<ReadTpm> tpmUsers = TpmService.findReadTpm(readTpm);
            if(tpmUsers.size() <= 0){
                TpmService.addReadTpm(readTpm);
            }
        }
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: 根据用户id查询TPM写权限
     * @时间: 2019/4/21 14:16
     * @参数:  * @param ids
     * @返回值: void
     **/
    @GetMapping("showTpmUser")
    public List<TpmUser> showTpmUser(TpmUser tpmUser){
        List<TpmUser> tpmUsers = TpmService.showTpmUser(tpmUser);
        return tpmUsers;
    }/**
     * @作者: YuBoYaKe
     * @功能描述: 根据用户id查询TPM读权限
     * @时间: 2019/4/21 14:16
     * @参数:  * @param ids
     * @返回值: void
     **/
    @GetMapping("showReadtpm")
    public List<ReadTpm> showReadtpm(ReadTpm readTpm){
        List<ReadTpm> ss = TpmService.showReadtpm(readTpm);
        return ss;
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: 还原
     * @时间: 2019/4/21 14:16
     * @参数:  * @param ids
     * @返回值: void
     **/
    @PostMapping("huanyuanTpmUser")
    public void huanyuanGLZ(HttpServletRequest request){
        String ids = request.getParameter("id");
        TpmService.huanyuanTpmUser(ids);
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: 提取
     * @时间: 2019/4/21 14:16
     * @参数:  * @param ids
     * @返回值: void
     **/
    @PostMapping("tiquTpmUser")
    public void tiquTpmUser(HttpServletRequest request){
        String ids = request.getParameter("id");
        TpmService.tiquTpmUser(ids);
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: 删除对TPM数据的写权限
     * @时间: 2019/4/21 14:16
     * @参数:  * @param ids
     * @返回值: void
     **/
    @PostMapping("delTpmUser")
    public void delTpmUser(HttpServletRequest request){
        String ids = request.getParameter("id");
        TpmService.delTpmUser(ids);
    }
    /**
     * @作者: YuBoYaKe
     * @功能描述: 删除对TPM数据的读权限
     * @时间: 2019/4/21 14:16
     * @参数:  * @param ids
     * @返回值: void
     **/
    @PostMapping("delReadtpm")
    public void delReadtpm(HttpServletRequest request){
        String ids = request.getParameter("id");
        TpmService.delReadtpm(ids);
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: 1200TPM打卡数据
     * @时间: 2019/4/21 14:16
     * @参数:  * @param ids
     * @返回值: void
     **/
    @GetMapping("tpm1200List")
    public List<Tpm> tpm1200List(HttpSession session){
        LoginUser users = (LoginUser)session.getAttribute("loginUser");
        List<Tpm> tpm = TpmService.tpm1200List(users);
        return tpm;
    }
    /**
     * @作者: YuBoYaKe
     * @功能描述: 1200TPM打卡数据
     * @时间: 2019/4/21 14:16
     * @参数:  * @param ids
     * @返回值: void
     **/
    @GetMapping("tpm650List")
    public List<Tpm> tpm650List(HttpSession session){
        LoginUser users = (LoginUser)session.getAttribute("loginUser");
        List<Tpm> tpm = TpmService.tpm650List(users);
        return tpm;
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: 1200TPM打卡
     * @时间: 2019/4/21 14:16
     * @参数:  * @param ids
     * @返回值: void
     **/
    @PostMapping("insert1200Tpm")
    public int insert1200Tpm(HttpSession session, HttpServletRequest request){
        LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
        Tpm tpm = new Tpm();
        tpm.setTpm_name(loginUser.getUser_name());
        List<Tpm> list = TpmService.findTpmByTpmName(tpm);
        if (list != null && list.size() > 0){
            tpm = list.get(0);
            if (DateUtil.isSameDay(tpm.getDate_time(),new Date())){
                return 2;
            }
        }
        String numArr1 = request.getParameter("numArr1");
        String numArr2 = request.getParameter("numArr2");
        String numArr3 = request.getParameter("numArr3");
        String numArr4 = request.getParameter("numArr4");
        String numArr5 = request.getParameter("numArr5");
        String numArr6 = request.getParameter("numArr6");
        String numArr7 = request.getParameter("numArr7");
        String[] s1 = numArr1.substring(1).replaceAll("]","").split(",");
        String[] s2 = numArr2.substring(1).replaceAll("]","").split(",");
        String[] s3 = numArr3.substring(1).replaceAll("]","").split(",");
        String[] s4 = numArr4.substring(1).replaceAll("]","").split(",");
        String[] s5 = numArr5.substring(1).replaceAll("]","").split(",");
        String[] s6 = numArr6.substring(1).replaceAll("]","").split(",");
        String[] s7 = numArr7.substring(1).replaceAll("]","").split(",");
        Tpm addTpm = null;
        for (int i = 0; i < s1.length; i++){
            addTpm = new Tpm();
            addTpm.setTpm_xh(s1[i].substring(1, s1[i].length()-1));
            addTpm.setTpm_bh(s2[i].substring(1, s2[i].length()-1));
            addTpm.setTpm_whbh(s3[i].substring(1, s3[i].length()-1));
            addTpm.setTpm_djxm(s4[i].substring(1, s4[i].length()-1));
            addTpm.setTpm_yq(s5[i].substring(1, s5[i].length()-1));
            addTpm.setTpm_is(s6[i].substring(1, s6[i].length()-1));
            addTpm.setTpm_name(loginUser.getUser_name());
            TpmUser tpmUser = new TpmUser();
            //根据tpm id 和 用户id锁定是否提取项
            tpmUser.setTpm_id(Long.valueOf(s7[i].substring(1, s7[i].length()-1)));
            tpmUser.setUser_id(loginUser.getUser_id());
            TpmUser tpms = TpmService.queryTpmUserIsTQ(tpmUser);
            if (tpms != null && tpms.getTq() != null){
                addTpm.setTpm_tq(tpms.getTq());
            }else{
                addTpm.setTpm_tq("2");
            }
            TpmService.insert1200Tpm(addTpm);
        }
        return 1;
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: M——读权限管理
     * @时间: 2018/9/29 14:44
     * @参数:  * @param user
     * @返回值: com.ds.util.PageUtil
     **/
    @GetMapping("findDuTpmList")
    public PageUtil findDuTpmList(Tpm tpm){
        Integer count = TpmService.findDuTpmCount(tpm);
        List<Tpm> list = TpmService.findDuTpmList(tpm);
        PageUtil page = new PageUtil();
        page.setTotal(count);
        page.setRows(list);
        return page;
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: M——查询日志
     * @时间: 2018/9/29 14:44
     * @参数:  * @param user
     * @返回值: com.ds.util.PageUtil
     **/
    @GetMapping("findTpmLogList")
    public PageUtil findTpmLogList(Tpm tpm){
        Integer count = TpmService.getTpmLogCount(tpm);
        List<Tpm> list = TpmService.findAllTpmLog(tpm);
        PageUtil page = new PageUtil();
        page.setTotal(count);
        page.setRows(list);
        return page;
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: TOP——查询TPM提取
     * @时间: 2018/9/29 14:44
     * @参数:  * @param user
     * @返回值: com.ds.util.PageUtil
     **/
    @GetMapping("topTpmList")
    public PageUtil topTpmList(Tpm tpm){
        Integer count = TpmService.topTpmListCount(tpm);
        List<Tpm> list = TpmService.topTpmList(tpm);
        PageUtil page = new PageUtil();
        page.setTotal(count);
        page.setRows(list);
        return page;
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: 用户赋查看权限给用户
     * @时间: 2019/4/25 22:00
     * @参数:  * @param httpSession
     * @返回值: java.util.List
     **/
    @PostMapping("updateFQTpmUser")
    public void updateFQTpmUser(Tpm tpm){
        if(tpm.getQx()!=null && !"".equals(tpm.getQx())){
            String[] split = tpm.getQx().split(",");
            String ids = "";
            for (int i = 0; i < split.length; i++) {
                ids += ","+split[i]+"_";
            }
            tpm.setQx(ids.substring(1));
            TpmService.updateFQTpmUser(tpm);
        }else{
            TpmService.updateFQTpmUser(tpm);
        }
    }

    /**
     * @作者: YuBoYaKe
     * @功能描述: i——TPM——>个人查看
     * @时间: 2018/9/29 14:44
     * @参数:  * @param user
     * @返回值: com.ds.util.PageUtil
     **/
    @GetMapping("zjRead1200Tpm")
    public PageUtil zjRead1200Tpm(HttpSession session){
        PageUtil page = new PageUtil();
        LoginUser users = (LoginUser)session.getAttribute("loginUser");

        Integer count = TpmService.zjRead1200TpmCount(users);
        List<Tpm> list = TpmService.zjRead1200Tpm(users);
        page.setTotal(count);
        page.setRows(list);
        return page;
    }

//
//    @PostMapping("updateFQ")
//    public void updateFQ(Tpm Tpm){
//        TpmService.updateFQ(Tpm);
//    }
//
//    /**
//     * Top——TPM——查询提取项
//     * @param Tpm
//     * @return
//     */
//    @GetMapping("findTpm2")
//    public PageUtil findTpm2(Tpm Tpm){
//        Tpm.setGlz_tq("1");
//        Integer count = TpmService.getTpmTiCount(Tpm);
//        List<Tpm> list = TpmService.findAllTiTpm(Tpm);
//        PageUtil page = new PageUtil();
//        page.setTotal(count);
//        page.setRows(list);
//        return page;
//    }
//
//    /**
//     * i——TPM——个人查看（查看自己的以及别人赋予自己的）
//     * @param session
//     * @return
//     */
//    @GetMapping("queryZjRead")
//    public PageUtil queryZjRead(HttpSession session){
//        PageUtil page = new PageUtil();
//        LoginUser users = (LoginUser)session.getAttribute("loginUser");
//        users.setUser_name(users.getUser_name());
//        // 注:user_id 为long类型 无法实现后续逻辑
//        users.setUser_kh(users.getUser_id()+"_");//只做形参
//        Integer count = TpmService.queryZjReadCount(users);
//        List<Tpm> list = TpmService.queryZjRead(users);
//        page.setTotal(count);
//        page.setRows(list);
//        return page;
//    }
}
